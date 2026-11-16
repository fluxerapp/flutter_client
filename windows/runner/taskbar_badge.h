#ifndef RUNNER_TASKBAR_BADGE_H_
#define RUNNER_TASKBAR_BADGE_H_

#include <flutter/binary_messenger.h>
#include <flutter/encodable_value.h>
#include <flutter/method_channel.h>
#include <shobjidl.h>
#include <windows.h>
#include <wrl/client.h>

#include <memory>
#include <string>

class TaskbarBadge {
 public:
  TaskbarBadge(flutter::BinaryMessenger* messenger, HWND window);
  ~TaskbarBadge();

  TaskbarBadge(const TaskbarBadge&) = delete;
  TaskbarBadge& operator=(const TaskbarBadge&) = delete;

  void HandleMessage(UINT message);

 private:
  void SetCount(int count, const std::wstring& description);
  void Apply();

  HWND window_;
  UINT taskbar_button_created_message_;
  int count_ = 0;
  std::wstring description_;
  Microsoft::WRL::ComPtr<ITaskbarList3> taskbar_;
  std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> channel_;
};

#endif
