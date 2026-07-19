enum FluxerSfxClip {
  cameraOff('assets/sounds/camera-off.mp3'),
  cameraOn('assets/sounds/camera-on.mp3'),
  deaf('assets/sounds/deaf.mp3'),
  undeaf('assets/sounds/undeaf.mp3'),
  incomingRing('assets/sounds/incoming-ring.mp3'),
  message('assets/sounds/message.mp3'),
  directMessage('assets/sounds/message.mp3'),
  sameChannelMessage('assets/sounds/in-channel-notification.ogg'),
  mute('assets/sounds/mute.mp3'),
  unmute('assets/sounds/unmute.mp3'),
  pttActive('assets/sounds/ptt-active.mp3'),
  pttInactive('assets/sounds/ptt-inactive.mp3'),
  streamStart('assets/sounds/stream-start.mp3'),
  streamStop('assets/sounds/stream-stop.mp3'),
  userJoin('assets/sounds/user-join.mp3'),
  userLeave('assets/sounds/user-leave.mp3'),
  userMove('assets/sounds/user-move.mp3'),
  viewerJoin('assets/sounds/viewer-join.mp3'),
  viewerLeave('assets/sounds/viewer-leave.mp3'),
  voiceDisconnect('assets/sounds/voice-disconnect.mp3');

  const FluxerSfxClip(this.assetKey);

  final String assetKey;

  bool get respectsRinger => switch (this) {
    FluxerSfxClip.message ||
    FluxerSfxClip.directMessage ||
    FluxerSfxClip.sameChannelMessage ||
    FluxerSfxClip.incomingRing => true,
    _ => false,
  };
}
