import Foundation
import IOKit.hid

final class CapsLockListener {
  private let manager: IOHIDManager
  private let runLoop: CFRunLoop
  private let onChange: (Bool) -> Void

  init?(runLoop: CFRunLoop, onChange: @escaping (Bool) -> Void) {
    manager = IOHIDManagerCreate(kCFAllocatorDefault, IOOptionBits(kIOHIDOptionsTypeNone))
    self.runLoop = runLoop
    self.onChange = onChange
    IOHIDManagerSetDeviceMatching(
      manager,
      [
        kIOHIDDeviceUsagePageKey: kHIDPage_GenericDesktop,
        kIOHIDDeviceUsageKey: kHIDUsage_GD_Keyboard,
      ] as CFDictionary
    )
    IOHIDManagerSetInputValueMatching(
      manager,
      [
        kIOHIDElementUsagePageKey: kHIDPage_KeyboardOrKeypad,
        kIOHIDElementUsageKey: kHIDUsage_KeyboardCapsLock,
      ] as CFDictionary
    )
    IOHIDManagerRegisterInputValueCallback(
      manager,
      { context, result, _, value in
        guard result == kIOReturnSuccess, let context else {
          return
        }
        let listener = Unmanaged<CapsLockListener>.fromOpaque(context).takeUnretainedValue()
        listener.handle(value)
      },
      Unmanaged.passUnretained(self).toOpaque()
    )
    IOHIDManagerScheduleWithRunLoop(manager, runLoop, CFRunLoopMode.commonModes.rawValue)
    let opened = IOHIDManagerOpen(manager, IOOptionBits(kIOHIDOptionsTypeNone))
    if opened != kIOReturnSuccess {
      detach()
      return nil
    }
  }

  func close() {
    detach()
    IOHIDManagerClose(manager, IOOptionBits(kIOHIDOptionsTypeNone))
  }

  private func detach() {
    IOHIDManagerUnscheduleFromRunLoop(manager, runLoop, CFRunLoopMode.commonModes.rawValue)
    IOHIDManagerRegisterInputValueCallback(manager, nil, nil)
  }

  private func handle(_ value: IOHIDValue) {
    let element = IOHIDValueGetElement(value)
    guard IOHIDElementGetUsagePage(element) == UInt32(kHIDPage_KeyboardOrKeypad),
      IOHIDElementGetUsage(element) == UInt32(kHIDUsage_KeyboardCapsLock)
    else {
      return
    }
    onChange(IOHIDValueGetIntegerValue(value) != 0)
  }
}
