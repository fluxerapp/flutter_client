#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <shobjidl.h>
#include <windows.h>

#include <algorithm>
#include <cwctype>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

#include "app_links/app_links_plugin_c_api.h"
#include "flutter_window.h"
#include "utils.h"

namespace {

constexpr wchar_t kFallbackAppUserModelId[] = L"com.fluxer.oxygen";
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

std::wstring ExecutablePath() {
  wchar_t exe_path[MAX_PATH];
  const DWORD length = ::GetModuleFileNameW(nullptr, exe_path, MAX_PATH);
  if (length == 0 || length == MAX_PATH) {
    return std::wstring();
  }
  return std::wstring(exe_path, length);
}

std::string ReadXmlElement(const std::string& xml, const std::string& name) {
  const std::string open = "<" + name + ">";
  const std::string close = "</" + name + ">";
  const size_t start = xml.find(open);
  if (start == std::string::npos) {
    return std::string();
  }
  const size_t value_start = start + open.size();
  const size_t end = xml.find(close, value_start);
  if (end == std::string::npos) {
    return std::string();
  }
  std::string value = xml.substr(value_start, end - value_start);
  const size_t first = value.find_first_not_of(" \t\r\n");
  const size_t last = value.find_last_not_of(" \t\r\n");
  if (first == std::string::npos) {
    return std::string();
  }
  return value.substr(first, last - first + 1);
}

std::wstring ResolveAppUserModelId() {
  const std::wstring exe_path = ExecutablePath();
  const size_t separator = exe_path.find_last_of(L"\\/");
  if (separator == std::wstring::npos) {
    return kFallbackAppUserModelId;
  }
  std::ifstream manifest(exe_path.substr(0, separator) + L"\\sq.version",
                         std::ios::binary);
  if (!manifest) {
    return kFallbackAppUserModelId;
  }
  std::stringstream buffer;
  buffer << manifest.rdbuf();
  const std::string xml = buffer.str();

  for (const char* element : {"shortcutAumid", "shortcutAmuid"}) {
    const std::wstring aumid = Utf8ToWide(ReadXmlElement(xml, element));
    if (!aumid.empty()) {
      return aumid;
    }
  }
  const std::wstring id = Utf8ToWide(ReadXmlElement(xml, "id"));
  if (id.empty()) {
    return kFallbackAppUserModelId;
  }
  return L"velopack." + id;
}

std::wstring UrlSchemeCommand(const std::wstring& exe_path) {
  return L"\"" + exe_path + L"\" \"%1\"";
}

void RegisterUrlSchemeIfUnclaimed() {
  const std::wstring exe_path = ExecutablePath();
  if (exe_path.empty()) {
    return;
  }

  const std::wstring command = UrlSchemeCommand(exe_path);
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

void UnregisterOwnedUrlScheme() {
  const std::wstring exe_path = ExecutablePath();
  if (exe_path.empty()) {
    return;
  }
  const std::wstring scheme_key =
      std::wstring(L"Software\\Classes\\") + kUrlScheme;
  const std::wstring existing = ReadRegistryString(
      HKEY_CURRENT_USER, scheme_key + L"\\shell\\open\\command");
  if (ToLower(existing) != ToLower(UrlSchemeCommand(exe_path))) {
    return;
  }
  ::RegDeleteTreeW(HKEY_CURRENT_USER, scheme_key.c_str());
}

void UnregisterNotificationIdentity(const std::wstring& aumid) {
  ::RegDeleteTreeW(HKEY_CURRENT_USER,
                   (L"Software\\Classes\\AppUserModelId\\" + aumid).c_str());
  ::RegDeleteTreeW(
      HKEY_CURRENT_USER,
      (L"Software\\Microsoft\\Windows\\CurrentVersion\\PushNotifications\\Backup\\" +
       aumid)
          .c_str());
}

bool HandleVelopackHook() {
  const std::vector<std::string> arguments = GetCommandLineArguments();
  if (arguments.empty() || arguments.front().rfind("--veloapp-", 0) != 0) {
    return false;
  }
  if (arguments.front() == "--veloapp-uninstall") {
    UnregisterOwnedUrlScheme();
    UnregisterNotificationIdentity(ResolveAppUserModelId());
  }
  return true;
}

}

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  if (HandleVelopackHook()) {
    return EXIT_SUCCESS;
  }

  if (SendAppLinkToInstance()) {
    return EXIT_SUCCESS;
  }

  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  ::SetCurrentProcessExplicitAppUserModelID(ResolveAppUserModelId().c_str());
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
