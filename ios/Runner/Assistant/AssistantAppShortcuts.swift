import AppIntents
import Foundation

struct AssistantAppShortcuts: AppShortcutsProvider {
  static var shortcutTileColor: ShortcutTileColor = .purple

  static var appShortcuts: [AppShortcut] {
    AppShortcut(
      intent: MuteVoiceIntent(),
      phrases: [
        "Mute \(.applicationName)",
        "Mute microphone in \(.applicationName)",
      ],
      shortTitle: "Mute",
      systemImageName: "mic.slash"
    )
    AppShortcut(
      intent: UnmuteVoiceIntent(),
      phrases: [
        "Unmute \(.applicationName)",
        "Unmute microphone in \(.applicationName)",
      ],
      shortTitle: "Unmute",
      systemImageName: "mic"
    )
    AppShortcut(
      intent: LeaveVoiceIntent(),
      phrases: [
        "Leave voice in \(.applicationName)",
        "Disconnect from \(.applicationName) voice",
      ],
      shortTitle: "Leave Voice",
      systemImageName: "phone.down"
    )
    AppShortcut(
      intent: SetOnlineIntent(),
      phrases: [
        "Go online on \(.applicationName)",
        "Set status to online in \(.applicationName)",
      ],
      shortTitle: "Set Online",
      systemImageName: "circle.fill"
    )
    AppShortcut(
      intent: SetDoNotDisturbIntent(),
      phrases: [
        "Set Do Not Disturb in \(.applicationName)",
        "Do not disturb on \(.applicationName)",
      ],
      shortTitle: "Do Not Disturb",
      systemImageName: "moon.fill"
    )
    AppShortcut(
      intent: OpenDmsIntent(),
      phrases: [
        "Open direct messages in \(.applicationName)",
        "Show my DMs in \(.applicationName)",
      ],
      shortTitle: "Direct Messages",
      systemImageName: "bubble.left"
    )
    AppShortcut(
      intent: JoinVoiceIntent(),
      phrases: [
        "Join voice on \(.applicationName)",
        "Join a voice channel on \(.applicationName)",
      ],
      shortTitle: "Join Voice",
      systemImageName: "mic.fill"
    )
    AppShortcut(
      intent: SetCustomStatusIntent(),
      phrases: [
        "Set custom status on \(.applicationName)",
        "Change my status on \(.applicationName)",
      ],
      shortTitle: "Custom Status",
      systemImageName: "text.bubble"
    )
    AppShortcut(
      intent: SendDirectMessageIntent(),
      phrases: [
        "Send a message on \(.applicationName)",
        "Send a DM on \(.applicationName)",
      ],
      shortTitle: "Send Message",
      systemImageName: "paperplane.fill"
    )
    AppShortcut(
      intent: StartDmCallIntent(),
      phrases: [
        "Call a friend on \(.applicationName)",
        "Start a call on \(.applicationName)",
      ],
      shortTitle: "Call Friend",
      systemImageName: "phone.fill"
    )
  }
}
