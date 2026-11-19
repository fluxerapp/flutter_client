#include "taskbar_badge.h"

#include <flutter/standard_method_codec.h>

#include <algorithm>
#include <limits>
#include <variant>

#include "resource.h"
#include "utils.h"

namespace {

constexpr int kMaxBadgeIcon = 10;
constexpr int kOverlayBaseSize = 16;

const flutter::EncodableValue* FindArgument(const flutter::EncodableMap& map,
                                            const char* key) {
  auto it = map.find(flutter::EncodableValue(key));
  return it == map.end() ? nullptr : &it->second;
}

}  // namespace

TaskbarBadge::TaskbarBadge(flutter::BinaryMessenger* messenger, HWND window)
    : window_(window),
      taskbar_button_created_message_(
          ::RegisterWindowMessageW(L"TaskbarButtonCreated")) {
  channel_ = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
      messenger, "fluxer_app/desktop_badge",
      &flutter::StandardMethodCodec::GetInstance());
  channel_->SetMethodCallHandler(
      [this](const flutter::MethodCall<flutter::EncodableValue>& call,
             std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>>
                 result) {
        if (call.method_name() != "setCount") {
          result->NotImplemented();
          return;
        }
        const auto* args =
            std::get_if<flutter::EncodableMap>(call.arguments());
        if (args == nullptr) {
          result->Error("bad_args", "Expected a map");
          return;
        }
        int count = 0;
        if (const auto* value = FindArgument(*args, "count")) {
          if (const auto* count32 = std::get_if<int32_t>(value)) {
            count = *count32;
          } else if (const auto* count64 = std::get_if<int64_t>(value)) {
            count = static_cast<int>(std::clamp<int64_t>(
                *count64, 0, std::numeric_limits<int>::max()));
          }
        }
        std::wstring description;
        if (const auto* value = FindArgument(*args, "description")) {
          if (const auto* text = std::get_if<std::string>(value)) {
            description = Utf8ToWide(*text);
          }
        }
        SetCount(count, description);
        result->Success();
      });
}

TaskbarBadge::~TaskbarBadge() {
  channel_->SetMethodCallHandler(nullptr);
}

void TaskbarBadge::HandleMessage(UINT message) {
  if (message == taskbar_button_created_message_) {
    taskbar_.Reset();
    Apply();
  } else if (message == WM_DPICHANGED && count_ > 0) {
    Apply();
  }
}

void TaskbarBadge::SetCount(int count, const std::wstring& description) {
  count = std::max(count, 0);
  if (count == count_ && description == description_) {
    return;
  }
  count_ = count;
  description_ = description;
  Apply();
}

void TaskbarBadge::Apply() {
  if (!taskbar_) {
    Microsoft::WRL::ComPtr<ITaskbarList3> taskbar;
    if (FAILED(::CoCreateInstance(CLSID_TaskbarList, nullptr,
                                  CLSCTX_INPROC_SERVER,
                                  IID_PPV_ARGS(&taskbar))) ||
        FAILED(taskbar->HrInit())) {
      return;
    }
    taskbar_ = taskbar;
  }
  HICON icon = nullptr;
  if (count_ > 0) {
    int index = std::min(count_, kMaxBadgeIcon);
    UINT dpi = ::GetDpiForWindow(window_);
    int size = ::MulDiv(kOverlayBaseSize, dpi == 0 ? 96 : dpi, 96);
    icon = static_cast<HICON>(::LoadImageW(
        ::GetModuleHandleW(nullptr),
        MAKEINTRESOURCEW(IDI_BADGE_1 + index - 1), IMAGE_ICON, size, size,
        LR_DEFAULTCOLOR));
  }
  taskbar_->SetOverlayIcon(window_, icon,
                           icon == nullptr ? nullptr : description_.c_str());
  if (icon != nullptr) {
    ::DestroyIcon(icon);
  }
}
