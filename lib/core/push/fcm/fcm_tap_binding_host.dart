typedef FcmNotificationTapCallback = void Function(Map<String, String> payload);

class FcmTapBindingHost {
  const FcmTapBindingHost();

  void setNotificationTapCallback(FcmNotificationTapCallback? callback) {}
}

final class FcmTapBindingHostStub extends FcmTapBindingHost {
  const FcmTapBindingHostStub();
}
