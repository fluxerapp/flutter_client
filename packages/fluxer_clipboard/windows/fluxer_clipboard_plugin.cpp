#include "include/fluxer_clipboard/fluxer_clipboard_plugin_c_api.h"

#include <windows.h>
#include <ole2.h>
#include <shellapi.h>
#include <shlobj.h>
#include <wincodec.h>
#include <wrl/client.h>

#include <flutter/plugin_registrar_windows.h>

#include <cstring>
#include <memory>
#include <optional>
#include <string>
#include <utility>
#include <vector>

#include "messages.g.h"

namespace fluxer_clipboard {
namespace {

using Microsoft::WRL::ComPtr;

std::string WideToUtf8(const std::wstring& wide) {
  if (wide.empty()) {
    return std::string();
  }
  int size = WideCharToMultiByte(CP_UTF8, 0, wide.data(),
                                 static_cast<int>(wide.size()), nullptr, 0,
                                 nullptr, nullptr);
  std::string result(size, '\0');
  WideCharToMultiByte(CP_UTF8, 0, wide.data(), static_cast<int>(wide.size()),
                      result.data(), size, nullptr, nullptr);
  return result;
}

std::string ToLower(std::string value) {
  for (char& c : value) {
    if (c >= 'A' && c <= 'Z') {
      c = static_cast<char>(c - 'A' + 'a');
    }
  }
  return value;
}

class ScopedClipboard {
 public:
  ScopedClipboard() {
    for (int attempt = 0; attempt < 5 && !open_; ++attempt) {
      open_ = OpenClipboard(nullptr) != FALSE;
      if (!open_) {
        Sleep(10);
      }
    }
  }
  ~ScopedClipboard() {
    if (open_) {
      CloseClipboard();
    }
  }
  bool is_open() const { return open_; }

 private:
  bool open_ = false;
};

std::optional<std::vector<uint8_t>> ReadGlobal(UINT format) {
  HANDLE handle = GetClipboardData(format);
  if (handle == nullptr) {
    return std::nullopt;
  }
  SIZE_T size = GlobalSize(handle);
  const void* data = GlobalLock(handle);
  if (data == nullptr || size == 0) {
    if (data != nullptr) {
      GlobalUnlock(handle);
    }
    return std::nullopt;
  }
  std::vector<uint8_t> bytes(size);
  std::memcpy(bytes.data(), data, size);
  GlobalUnlock(handle);
  return bytes;
}

std::vector<UINT> FormatsForMime(const std::string& mime) {
  std::vector<std::wstring> names;
  if (mime == "image/png") {
    names = {L"PNG", L"image/png"};
  } else if (mime == "image/gif") {
    names = {L"GIF", L"image/gif"};
  } else if (mime == "image/jpeg") {
    names = {L"JFIF", L"image/jpeg"};
  } else if (mime == "image/tiff") {
    return {static_cast<UINT>(CF_TIFF)};
  }
  std::vector<UINT> formats;
  for (const std::wstring& name : names) {
    UINT format = RegisterClipboardFormatW(name.c_str());
    if (format != 0) {
      formats.push_back(format);
    }
  }
  return formats;
}

bool WantsImage(const std::vector<std::string>& mime_types) {
  for (const std::string& mime : mime_types) {
    if (mime.rfind("image/", 0) == 0) {
      return true;
    }
  }
  return false;
}

std::optional<std::vector<uint8_t>> DibToBmp(const std::vector<uint8_t>& dib) {
  if (dib.size() < sizeof(BITMAPINFOHEADER)) {
    return std::nullopt;
  }
  BITMAPINFOHEADER header;
  std::memcpy(&header, dib.data(), sizeof(header));
  DWORD colors = header.biClrUsed;
  if (colors == 0 && header.biBitCount <= 8) {
    colors = 1u << header.biBitCount;
  }
  DWORD offset =
      header.biSize + colors * static_cast<DWORD>(sizeof(RGBQUAD));
  if (header.biSize == sizeof(BITMAPINFOHEADER) &&
      header.biCompression == BI_BITFIELDS) {
    offset += static_cast<DWORD>(3 * sizeof(DWORD));
  }
  BITMAPFILEHEADER file_header = {};
  file_header.bfType = 0x4D42;
  file_header.bfSize = static_cast<DWORD>(sizeof(file_header) + dib.size());
  file_header.bfOffBits = static_cast<DWORD>(sizeof(file_header) + offset);
  std::vector<uint8_t> bmp(sizeof(file_header) + dib.size());
  std::memcpy(bmp.data(), &file_header, sizeof(file_header));
  std::memcpy(bmp.data() + sizeof(file_header), dib.data(), dib.size());
  return bmp;
}

std::optional<std::vector<uint8_t>> BmpToPng(const std::vector<uint8_t>& bmp) {
  ComPtr<IWICImagingFactory> factory;
  if (FAILED(CoCreateInstance(CLSID_WICImagingFactory, nullptr,
                              CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&factory)))) {
    return std::nullopt;
  }
  ComPtr<IWICStream> input;
  if (FAILED(factory->CreateStream(&input)) ||
      FAILED(input->InitializeFromMemory(const_cast<BYTE*>(bmp.data()),
                                         static_cast<DWORD>(bmp.size())))) {
    return std::nullopt;
  }
  ComPtr<IWICBitmapDecoder> decoder;
  ComPtr<IWICBitmapFrameDecode> frame;
  if (FAILED(factory->CreateDecoderFromStream(
          input.Get(), nullptr, WICDecodeMetadataCacheOnDemand, &decoder)) ||
      FAILED(decoder->GetFrame(0, &frame))) {
    return std::nullopt;
  }
  ComPtr<IWICFormatConverter> converter;
  if (FAILED(factory->CreateFormatConverter(&converter)) ||
      FAILED(converter->Initialize(frame.Get(), GUID_WICPixelFormat32bppBGRA,
                                   WICBitmapDitherTypeNone, nullptr, 0.0,
                                   WICBitmapPaletteTypeCustom))) {
    return std::nullopt;
  }
  UINT width = 0;
  UINT height = 0;
  converter->GetSize(&width, &height);
  ComPtr<IStream> output;
  if (FAILED(CreateStreamOnHGlobal(nullptr, TRUE, &output))) {
    return std::nullopt;
  }
  ComPtr<IWICBitmapEncoder> encoder;
  ComPtr<IWICBitmapFrameEncode> target;
  WICPixelFormatGUID pixel_format = GUID_WICPixelFormat32bppBGRA;
  if (FAILED(factory->CreateEncoder(GUID_ContainerFormatPng, nullptr,
                                    &encoder)) ||
      FAILED(encoder->Initialize(output.Get(), WICBitmapEncoderNoCache)) ||
      FAILED(encoder->CreateNewFrame(&target, nullptr)) ||
      FAILED(target->Initialize(nullptr)) ||
      FAILED(target->SetSize(width, height)) ||
      FAILED(target->SetPixelFormat(&pixel_format)) ||
      FAILED(target->WriteSource(converter.Get(), nullptr)) ||
      FAILED(target->Commit()) || FAILED(encoder->Commit())) {
    return std::nullopt;
  }
  STATSTG stat = {};
  if (FAILED(output->Stat(&stat, STATFLAG_NONAME))) {
    return std::nullopt;
  }
  HGLOBAL global = nullptr;
  if (FAILED(GetHGlobalFromStream(output.Get(), &global))) {
    return std::nullopt;
  }
  const void* data = GlobalLock(global);
  if (data == nullptr) {
    return std::nullopt;
  }
  std::vector<uint8_t> png(static_cast<size_t>(stat.cbSize.QuadPart));
  std::memcpy(png.data(), data, png.size());
  GlobalUnlock(global);
  return png;
}

std::optional<std::vector<uint8_t>> ReadDibAsPng() {
  for (UINT format : {static_cast<UINT>(CF_DIBV5), static_cast<UINT>(CF_DIB)}) {
    if (!IsClipboardFormatAvailable(format)) {
      continue;
    }
    std::optional<std::vector<uint8_t>> dib = ReadGlobal(format);
    if (!dib) {
      continue;
    }
    std::optional<std::vector<uint8_t>> bmp = DibToBmp(*dib);
    if (!bmp) {
      continue;
    }
    std::optional<std::vector<uint8_t>> png = BmpToPng(*bmp);
    if (png && !png->empty()) {
      return png;
    }
  }
  return std::nullopt;
}

void AppendDroppedFiles(::flutter::EncodableList& items, size_t limit) {
  HDROP drop = static_cast<HDROP>(GetClipboardData(CF_HDROP));
  if (drop == nullptr) {
    return;
  }
  UINT count = DragQueryFileW(drop, 0xFFFFFFFF, nullptr, 0);
  for (UINT i = 0; i < count && items.size() < limit; ++i) {
    UINT length = DragQueryFileW(drop, i, nullptr, 0);
    if (length == 0) {
      continue;
    }
    std::wstring path(length + 1, L'\0');
    DragQueryFileW(drop, i, path.data(), length + 1);
    path.resize(length);
    DWORD attributes = GetFileAttributesW(path.c_str());
    if (attributes == INVALID_FILE_ATTRIBUTES ||
        (attributes & FILE_ATTRIBUTE_DIRECTORY) != 0) {
      continue;
    }
    size_t separator = path.find_last_of(L"\\/");
    std::wstring name =
        separator == std::wstring::npos ? path : path.substr(separator + 1);
    NativeClipboardItem item;
    item.set_name(WideToUtf8(name));
    item.set_path(WideToUtf8(path));
    items.push_back(::flutter::CustomEncodableValue(item));
  }
}

std::optional<std::vector<uint8_t>> ReadMedium(const STGMEDIUM& medium) {
  if (medium.tymed == TYMED_HGLOBAL) {
    SIZE_T size = GlobalSize(medium.hGlobal);
    const void* data = GlobalLock(medium.hGlobal);
    if (data == nullptr) {
      return std::nullopt;
    }
    std::vector<uint8_t> bytes(size);
    std::memcpy(bytes.data(), data, size);
    GlobalUnlock(medium.hGlobal);
    return bytes;
  }
  if (medium.tymed == TYMED_ISTREAM && medium.pstm != nullptr) {
    LARGE_INTEGER origin = {};
    medium.pstm->Seek(origin, STREAM_SEEK_SET, nullptr);
    std::vector<uint8_t> bytes;
    uint8_t buffer[64 * 1024];
    ULONG read = 0;
    while (SUCCEEDED(medium.pstm->Read(buffer, sizeof(buffer), &read)) &&
           read > 0) {
      bytes.insert(bytes.end(), buffer, buffer + read);
    }
    return bytes;
  }
  return std::nullopt;
}

bool HasVirtualFiles() {
  return IsClipboardFormatAvailable(
             RegisterClipboardFormatW(CFSTR_FILEDESCRIPTORW)) != FALSE;
}

void AppendVirtualFiles(::flutter::EncodableList& items, size_t limit) {
  CLIPFORMAT descriptor_format =
      static_cast<CLIPFORMAT>(RegisterClipboardFormatW(CFSTR_FILEDESCRIPTORW));
  CLIPFORMAT contents_format =
      static_cast<CLIPFORMAT>(RegisterClipboardFormatW(CFSTR_FILECONTENTS));
  ComPtr<IDataObject> data_object;
  if (FAILED(OleGetClipboard(&data_object))) {
    return;
  }
  FORMATETC descriptor_etc = {descriptor_format, nullptr, DVASPECT_CONTENT, -1,
                              TYMED_HGLOBAL};
  STGMEDIUM descriptor_medium = {};
  if (FAILED(data_object->GetData(&descriptor_etc, &descriptor_medium))) {
    return;
  }
  std::vector<std::wstring> names;
  std::vector<std::optional<uint64_t>> sizes;
  const auto* group = static_cast<const FILEGROUPDESCRIPTORW*>(
      GlobalLock(descriptor_medium.hGlobal));
  if (group != nullptr) {
    for (UINT i = 0; i < group->cItems; ++i) {
      const FILEDESCRIPTORW& descriptor = group->fgd[i];
      bool is_directory =
          (descriptor.dwFlags & FD_ATTRIBUTES) != 0 &&
          (descriptor.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) != 0;
      names.push_back(is_directory ? std::wstring() : descriptor.cFileName);
      if ((descriptor.dwFlags & FD_FILESIZE) != 0) {
        sizes.push_back((static_cast<uint64_t>(descriptor.nFileSizeHigh) << 32) |
                        descriptor.nFileSizeLow);
      } else {
        sizes.push_back(std::nullopt);
      }
    }
    GlobalUnlock(descriptor_medium.hGlobal);
  }
  ReleaseStgMedium(&descriptor_medium);
  for (size_t i = 0; i < names.size() && items.size() < limit; ++i) {
    if (names[i].empty()) {
      continue;
    }
    FORMATETC contents_etc = {contents_format, nullptr, DVASPECT_CONTENT,
                              static_cast<LONG>(i),
                              TYMED_HGLOBAL | TYMED_ISTREAM};
    STGMEDIUM contents_medium = {};
    if (FAILED(data_object->GetData(&contents_etc, &contents_medium))) {
      continue;
    }
    std::optional<std::vector<uint8_t>> data = ReadMedium(contents_medium);
    ReleaseStgMedium(&contents_medium);
    if (data && sizes[i] && data->size() > *sizes[i]) {
      data->resize(static_cast<size_t>(*sizes[i]));
    }
    if (!data || data->empty()) {
      continue;
    }
    size_t separator = names[i].find_last_of(L"\\/");
    std::wstring name = separator == std::wstring::npos
                            ? names[i]
                            : names[i].substr(separator + 1);
    NativeClipboardItem item;
    item.set_name(WideToUtf8(name));
    item.set_data(*data);
    items.push_back(::flutter::CustomEncodableValue(item));
  }
}

class FluxerClipboardPlugin : public ::flutter::Plugin, public ClipboardHostApi {
 public:
  FluxerClipboardPlugin() : ole_initialized_(SUCCEEDED(OleInitialize(nullptr))) {}
  ~FluxerClipboardPlugin() override {
    if (ole_initialized_) {
      OleUninitialize();
    }
  }

  void ReadItems(const ::flutter::EncodableList& mime_types, int64_t max_items,
                 std::function<void(ErrorOr<::flutter::EncodableList> reply)>
                     result) override {
    ::flutter::EncodableList items;
    size_t limit = max_items > 0 ? static_cast<size_t>(max_items) : 0;
    std::vector<std::string> mimes;
    for (const ::flutter::EncodableValue& value : mime_types) {
      if (const auto* mime = std::get_if<std::string>(&value)) {
        mimes.push_back(ToLower(*mime));
      }
    }
    if (limit == 0) {
      result(std::move(items));
      return;
    }
    if (IsClipboardFormatAvailable(CF_HDROP)) {
      ScopedClipboard clipboard;
      if (clipboard.is_open()) {
        AppendDroppedFiles(items, limit);
      }
    }
    if (items.empty() && ole_initialized_ && HasVirtualFiles()) {
      AppendVirtualFiles(items, limit);
    }
    if (!items.empty()) {
      result(std::move(items));
      return;
    }
    ScopedClipboard clipboard;
    if (!clipboard.is_open()) {
      result(std::move(items));
      return;
    }
    for (const std::string& mime : mimes) {
      for (UINT format : FormatsForMime(mime)) {
        if (!IsClipboardFormatAvailable(format)) {
          continue;
        }
        std::optional<std::vector<uint8_t>> data = ReadGlobal(format);
        if (!data || data->empty()) {
          continue;
        }
        NativeClipboardItem item;
        item.set_mime_type(mime);
        item.set_data(*data);
        items.push_back(::flutter::CustomEncodableValue(item));
        result(std::move(items));
        return;
      }
    }
    if (WantsImage(mimes)) {
      std::optional<std::vector<uint8_t>> png = ReadDibAsPng();
      if (png) {
        NativeClipboardItem item;
        item.set_mime_type("image/png");
        item.set_data(*png);
        items.push_back(::flutter::CustomEncodableValue(item));
      }
    }
    result(std::move(items));
  }

  void ReadText(std::function<void(ErrorOr<std::optional<std::string>> reply)>
                    result) override {
    ScopedClipboard clipboard;
    if (!clipboard.is_open() || !IsClipboardFormatAvailable(CF_UNICODETEXT)) {
      result(std::optional<std::string>());
      return;
    }
    HANDLE handle = GetClipboardData(CF_UNICODETEXT);
    const wchar_t* text =
        handle == nullptr ? nullptr : static_cast<const wchar_t*>(GlobalLock(handle));
    if (text == nullptr) {
      result(std::optional<std::string>());
      return;
    }
    std::string utf8 = WideToUtf8(std::wstring(text));
    GlobalUnlock(handle);
    if (utf8.empty()) {
      result(std::optional<std::string>());
      return;
    }
    result(std::optional<std::string>(std::move(utf8)));
  }

 private:
  bool ole_initialized_;
};

}
}

void FluxerClipboardPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  auto* windows_registrar =
      ::flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<::flutter::PluginRegistrarWindows>(registrar);
  auto plugin = std::make_unique<fluxer_clipboard::FluxerClipboardPlugin>();
  fluxer_clipboard::ClipboardHostApi::SetUp(windows_registrar->messenger(),
                                            plugin.get());
  windows_registrar->AddPlugin(std::move(plugin));
}
