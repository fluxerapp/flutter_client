import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChannelPinsOpenRequest extends Notifier<int> {
  @override
  int build() => 0;

  void open() => state = state + 1;
}

final NotifierProvider<ChannelPinsOpenRequest, int>
channelPinsOpenRequestProvider = NotifierProvider<ChannelPinsOpenRequest, int>(
  ChannelPinsOpenRequest.new,
);
