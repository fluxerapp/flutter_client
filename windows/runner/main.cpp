#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <shobjidl.h>
#include <windows.h>

#include <algorithm>
#include <cwctype>
#include <string>

#include "app_links/app_links_plugin_c_api.h"
#include "flutter_window.h"
#include "utils.h"

namespace {

constexpr wchar_t kAppUserModelId[] = L"com.fluxer.oxygen";
constexpr wchar_t kWindowTitle[] = L"Fluxer Oxygen";
constexpr wchar_t kUrlScheme[] = L"fluxer";
constexpr wchar_t kExecutableName[] = L"fluxer_oxygen.exe";

std::wstring ToLower(std::wstring value) {
  std::transform(value.begin(), value.end(), value.begin(),
                 [](wchar_t c) { return static_cast<wchar_t>(std::towlower(c)); });
  return value;
}

std::wstring ReadRegistryString(HKEY root, const std::wstring& subkey) {
  DWORD size = 0;
  if (::RegGetValueW(root, subkey.c_str(), nullptr, RRF_RT_REG_SZ, nullptr,
                     nullptr, &size) != ERROR_SUCCESS ||
      size == 0) {
    return std::wstring();
  }
  std::wstring value(size / sizeof(wchar_t), L'\0');
  if (::RegGetValueW(root, subkey.c_str(), nullptr, RRF_RT_REG_SZ, nullptr,
                     value.data(), &size) != ERROR_SUCCESS) {
    return std::wstring();
  }
  value.resize(wcslen(value.c_str()));
  return value;
}

bool WriteRegistryString(const std::wstring& subkey, const wchar_t* name,
                         const std::wstring& value) {
  return ::RegSetKeyValueW(
             HKEY_CURRENT_USER, subkey.c_str(), name, REG_SZ, value.c_str(),
             static_cast<DWORD>((value.size() + 1) * sizeof(wchar_t))) ==
         ERROR_SUCCESS;
}

void RegisterUrlSchemeIfUnclaimed() {
  wchar_t exe_path[MAX_PATH];
  const DWORD length = ::GetModuleFileNameW(nullptr, exe_path, MAX_PATH);
  if (length == 0 || length == MAX_PATH) {
    return;
  }

  const std::wstring command =
      L"\"" + std::wstring(exe_path) + L"\" \"%1\"";
  const std::wstring existing = ReadRegistryString(
      HKEY_CLASSES_ROOT, std::wstring(kUrlScheme) + L"\\shell\\open\\command");
  if (existing == command) {
    return;
  }
  if (!existing.empty() &&
      ToLower(existing).find(kExecutableName) == std::wstring::npos) {
    return;
  }

  const std::wstring scheme_key =
      std::wstring(L"Software\\Classes\\") + kUrlScheme;
  WriteRegistryString(scheme_key, nullptr, L"URL:Fluxer Protocol");
  WriteRegistryString(scheme_key, L"URL Protocol", L"");
  WriteRegistryString(scheme_key + L"\\DefaultIcon", nullptr,
                      L"\"" + std::wstring(exe_path) + L"\",0");
  WriteRegistryString(scheme_key + L"\\shell\\open\\command", nullptr,
                      command);
}

}

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  if (SendAppLinkToInstance()) {
    return EXIT_SUCCESS;
  }

  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  ::SetCurrentProcessExplicitAppUserModelID(kAppUserModelId);
  RegisterUrlSchemeIfUnclaimed();

  ::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

  flutter::DartProject project(L"data");

  std::vector<std::string> command_line_arguments =
      GetCommandLineArguments();

  project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

  FlutterWindow window(project);
  Win32Window::Point origin(10, 10);
  Win32Window::Size size(1280, 720);
  if (!window.Create(kWindowTitle, origin, size)) {
    return EXIT_FAILURE;
  }
  window.SetQuitOnClose(true);

  ::MSG msg;
  while (::GetMessage(&msg, nullptr, 0, 0)) {
    ::TranslateMessage(&msg);
    ::DispatchMessage(&msg);
  }

  ::CoUninitialize();
  return EXIT_SUCCESS;
}
