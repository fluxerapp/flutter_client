import Foundation

enum ModifierFlags {
  static let shift: UInt64 = 1 << 17
  static let control: UInt64 = 1 << 18
  static let alternate: UInt64 = 1 << 19
  static let command: UInt64 = 1 << 20

  private struct Side {
    let group: UInt64
    let own: UInt64
    let other: UInt64
  }

  private static let sides: [Int64: Side] = [
    0x38: Side(group: shift, own: 0x02, other: 0x04),
    0x3C: Side(group: shift, own: 0x04, other: 0x02),
    0x3B: Side(group: control, own: 0x01, other: 0x2000),
    0x3E: Side(group: control, own: 0x2000, other: 0x01),
    0x3A: Side(group: alternate, own: 0x20, other: 0x40),
    0x3D: Side(group: alternate, own: 0x40, other: 0x20),
    0x37: Side(group: command, own: 0x08, other: 0x10),
    0x36: Side(group: command, own: 0x10, other: 0x08),
  ]

  static func isModifier(_ keycode: Int64) -> Bool {
    sides[keycode] != nil
  }

  static func isDown(keycode: Int64, flags: UInt64, wasHeld: Bool) -> Bool? {
    guard let side = sides[keycode] else {
      return nil
    }
    if flags & side.group == 0 {
      return false
    }
    if flags & (side.own | side.other) != 0 {
      return flags & side.own != 0
    }
    return !wasHeld
  }
}
