import 'package:fluxer_app/features/voice/domain/screen_share_source.dart';

enum ScreenSharePickerTab {
  applications,
  entireScreen;

  ScreenShareSourceKind get kind => switch (this) {
    ScreenSharePickerTab.applications => ScreenShareSourceKind.window,
    ScreenSharePickerTab.entireScreen => ScreenShareSourceKind.screen,
  };

  static ScreenSharePickerTab forKind(ScreenShareSourceKind kind) =>
      switch (kind) {
        ScreenShareSourceKind.window => ScreenSharePickerTab.applications,
        ScreenShareSourceKind.screen => ScreenSharePickerTab.entireScreen,
      };
}

enum ScreenSharePickerMode { start, change }

enum ScreenSharePickerAccess { checking, granted, blocked, relaunchRequired }
