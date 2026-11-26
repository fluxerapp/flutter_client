import CoreGraphics
import Foundation

struct InputFilter {
  var keycodes: Set<Int64> = []
  var buttons: Set<Int64> = []
  var modifiers = false

  func accepts(keycode: Int64) -> Bool {
    keycodes.contains(keycode) || (modifiers && ModifierFlags.isModifier(keycode))
  }
}

final class InputTapWorker {
  private static let capsLockKeycode: Int64 = 0x39
  private static let eventTypes: [CGEventType] = [
    .keyDown, .keyUp, .flagsChanged, .leftMouseDown, .leftMouseUp, .rightMouseDown,
    .rightMouseUp, .otherMouseDown, .otherMouseUp,
  ]

  private let onEvent: (MacInputEvent) -> Void
  private let onReleaseAll: () -> Void
  private let lock = NSLock()
  private var filter: InputFilter
  private var heldKeys: Set<Int64> = []
  private var heldButtons: Set<Int64> = []
  private var lastFlags: UInt64 = 0
  private var capsLockViaHid = false
  private var tap: CFMachPort?
  private var runLoop: CFRunLoop?
  private let finished = DispatchSemaphore(value: 0)

  init(
    filter: InputFilter,
    onEvent: @escaping (MacInputEvent) -> Void,
    onReleaseAll: @escaping () -> Void
  ) {
    self.filter = filter
    self.onEvent = onEvent
    self.onReleaseAll = onReleaseAll
  }

  func start() -> Bool {
    let ready = DispatchSemaphore(value: 0)
    var started = false
    let thread = Thread { [self] in
      run { result in
        started = result
        ready.signal()
      }
      finished.signal()
    }
    thread.name = "fluxer_macos.input_hook"
    thread.qualityOfService = .userInteractive
    thread.start()
    ready.wait()
    return started
  }

  func stop() {
    guard let runLoop = lock.withLock({ self.runLoop }) else {
      return
    }
    CFRunLoopPerformBlock(runLoop, CFRunLoopMode.commonModes.rawValue) {
      CFRunLoopStop(runLoop)
    }
    CFRunLoopWakeUp(runLoop)
    finished.wait()
  }

  func setFilter(_ next: InputFilter) {
    lock.withLock {
      filter = next
    }
  }

  func releaseAll() {
    lock.withLock {
      heldKeys.removeAll()
      heldButtons.removeAll()
    }
    onReleaseAll()
  }

  private func run(signal: (Bool) -> Void) {
    let mask = Self.eventTypes.reduce(CGEventMask(0)) { $0 | (1 << $1.rawValue) }
    let created = CGEvent.tapCreate(
      tap: .cgSessionEventTap,
      place: .headInsertEventTap,
      options: .listenOnly,
      eventsOfInterest: mask,
      callback: { _, type, event, userInfo in
        if let userInfo {
          Unmanaged<InputTapWorker>.fromOpaque(userInfo).takeUnretainedValue()
            .handle(type, event)
        }
        return Unmanaged.passUnretained(event)
      },
      userInfo: Unmanaged.passUnretained(self).toOpaque()
    )
    guard let created,
      let source = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, created, 0),
      let current = CFRunLoopGetCurrent()
    else {
      signal(false)
      return
    }
    CFRunLoopAddSource(current, source, .commonModes)
    CGEvent.tapEnable(tap: created, enable: true)
    let capsLock = CapsLockListener(runLoop: current) { [unowned self] pressed in
      handleCapsLock(pressed)
    }
    lock.withLock {
      tap = created
      runLoop = current
      capsLockViaHid = capsLock != nil
    }
    signal(true)
    CFRunLoopRun()
    capsLock?.close()
    CGEvent.tapEnable(tap: created, enable: false)
    CFRunLoopRemoveSource(current, source, .commonModes)
    CFMachPortInvalidate(created)
    lock.withLock {
      tap = nil
      runLoop = nil
    }
  }

  private func handle(_ type: CGEventType, _ event: CGEvent) {
    switch type {
    case .tapDisabledByTimeout, .tapDisabledByUserInput:
      if let tap = lock.withLock({ self.tap }) {
        CGEvent.tapEnable(tap: tap, enable: true)
      }
      releaseAll()
    case .keyDown, .keyUp:
      let keycode = event.getIntegerValueField(.keyboardEventKeycode)
      let repeated = event.getIntegerValueField(.keyboardEventAutorepeat) != 0
      handleKey(
        keycode,
        down: type == .keyDown,
        flags: event.flags.rawValue,
        repeated: repeated
      )
    case .flagsChanged:
      handleFlags(event)
    default:
      handleMouse(type, event)
    }
  }

  private func handleFlags(_ event: CGEvent) {
    let keycode = event.getIntegerValueField(.keyboardEventKeycode)
    let flags = event.flags.rawValue
    if keycode == Self.capsLockKeycode {
      let viaHid = lock.withLock { capsLockViaHid }
      if !viaHid {
        handleKey(keycode, down: true, flags: flags, repeated: false)
        handleKey(keycode, down: false, flags: flags, repeated: false)
      }
      return
    }
    let wasHeld = lock.withLock { heldKeys.contains(keycode) }
    guard let down = ModifierFlags.isDown(keycode: keycode, flags: flags, wasHeld: wasHeld)
    else {
      return
    }
    handleKey(keycode, down: down, flags: flags, repeated: false)
  }

  private func handleCapsLock(_ pressed: Bool) {
    let flags = lock.withLock { lastFlags }
    handleKey(Self.capsLockKeycode, down: pressed, flags: flags, repeated: false)
  }

  private func handleKey(_ keycode: Int64, down: Bool, flags: UInt64, repeated: Bool) {
    let forward: Bool = lock.withLock {
      lastFlags = flags
      if down {
        guard !repeated, filter.accepts(keycode: keycode) else {
          return false
        }
        heldKeys.insert(keycode)
        return true
      }
      let wasHeld = heldKeys.remove(keycode) != nil
      return wasHeld || filter.accepts(keycode: keycode)
    }
    if forward {
      send(down ? .keyDown : .keyUp, keycode: keycode, button: 0, flags: flags)
    }
  }

  private func handleMouse(_ type: CGEventType, _ event: CGEvent) {
    guard let button = Self.domButton(type, event) else {
      return
    }
    let down = type == .leftMouseDown || type == .rightMouseDown || type == .otherMouseDown
    let flags = event.flags.rawValue
    let forward: Bool = lock.withLock {
      if down {
        guard filter.buttons.contains(button) else {
          return false
        }
        heldButtons.insert(button)
        return true
      }
      return heldButtons.remove(button) != nil
    }
    if forward {
      send(down ? .mouseDown : .mouseUp, keycode: 0, button: button, flags: flags)
    }
  }

  private static func domButton(_ type: CGEventType, _ event: CGEvent) -> Int64? {
    switch type {
    case .leftMouseDown, .leftMouseUp:
      return 0
    case .rightMouseDown, .rightMouseUp:
      return 2
    case .otherMouseDown, .otherMouseUp:
      switch event.getIntegerValueField(.mouseEventButtonNumber) {
      case 2:
        return 1
      case 3:
        return 3
      case 4:
        return 4
      default:
        return nil
      }
    default:
      return nil
    }
  }

  private func send(_ type: MacInputEventType, keycode: Int64, button: Int64, flags: UInt64) {
    onEvent(
      MacInputEvent(
        type: type,
        keycode: keycode,
        button: button,
        ctrl: flags & ModifierFlags.control != 0,
        alt: flags & ModifierFlags.alternate != 0,
        shift: flags & ModifierFlags.shift != 0,
        meta: flags & ModifierFlags.command != 0
      )
    )
  }
}
