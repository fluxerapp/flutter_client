enum KeybindSection {
  defaults,
  messages,
  navigation,
  dragAndDrop,
  chat,
  voiceAndVideo,
  misc,
}

extension KeybindSectionOrder on KeybindSection {
  int get sortOrder {
    switch (this) {
      case KeybindSection.defaults:
        return 0;
      case KeybindSection.messages:
        return 1;
      case KeybindSection.navigation:
        return 2;
      case KeybindSection.dragAndDrop:
        return 3;
      case KeybindSection.chat:
        return 4;
      case KeybindSection.voiceAndVideo:
        return 5;
      case KeybindSection.misc:
        return 6;
    }
  }
}
