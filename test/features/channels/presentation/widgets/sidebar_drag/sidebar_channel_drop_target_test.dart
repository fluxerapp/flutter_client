import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/channels/domain/voice_participant_drag_item.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/sidebar_drag/sidebar_channel_drop_target.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/sidebar_drag/sidebar_drag_controller.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/sidebar_drag/sidebar_drag_scope.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/sidebar_drag/sidebar_draggable.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/sidebar_drag/sidebar_null_space_drop_target.dart';
import 'package:fluxer_app/material_ui.dart';

const double _rowHeight = 40;

final ChannelReorderDragItem _textItem = ChannelReorderDragItem(
  id: 'text-a',
  kind: ChannelReorderDragKind.channel,
  channelType: ChannelType.guildText.wireValue,
);

final ChannelReorderDragItem _categoryItem = ChannelReorderDragItem(
  id: 'category-a',
  kind: ChannelReorderDragKind.category,
  channelType: ChannelType.guildCategory.wireValue,
);

const VoiceParticipantDragItem _participantItem = VoiceParticipantDragItem(
  userId: 'user-1',
  guildId: 'guild-1',
  channelId: 'voice-a',
);

class _Drops {
  final List<(ChannelReorderDragItem, ChannelReorderDropResult)> channels =
      <(ChannelReorderDragItem, ChannelReorderDropResult)>[];
  final List<VoiceParticipantDragItem> participants =
      <VoiceParticipantDragItem>[];
}

Widget _row(String label) {
  return SizedBox(height: _rowHeight, child: Text(label));
}

Widget _target({
  required String id,
  required ChannelType type,
  required _Drops drops,
  String? parentId,
}) {
  return SidebarChannelDropTarget(
    target: ChannelReorderTarget(
      id: id,
      channelType: type.wireValue,
      parentId: parentId,
    ),
    onChannelDrop: (ChannelReorderDragItem item, ChannelReorderDropResult r) =>
        drops.channels.add((item, r)),
    onParticipantDrop: type == ChannelType.guildVoice
        ? drops.participants.add
        : null,
    builder: (BuildContext context, bool isOver) => _row(id),
  );
}

Future<void> _pump(
  WidgetTester tester, {
  required SidebarDragController controller,
  required Object source,
  required _Drops drops,
}) async {
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: SidebarDragScope(
          controller: controller,
          child: Column(
            children: <Widget>[
              SidebarNullSpaceDropTarget(
                trailing: false,
                onChannelDrop:
                    (ChannelReorderDragItem item, ChannelReorderDropResult r) =>
                        drops.channels.add((item, r)),
              ),
              if (source is VoiceParticipantDragItem)
                SidebarDraggable<VoiceParticipantDragItem>(
                  data: source,
                  enabled: true,
                  child: _row('source'),
                )
              else
                SidebarDraggable<ChannelReorderDragItem>(
                  data: source as ChannelReorderDragItem,
                  enabled: true,
                  child: _row('source'),
                ),
              _target(
                id: 'text-b',
                type: ChannelType.guildText,
                drops: drops,
                parentId: 'category-b',
              ),
              _target(
                id: 'voice-b',
                type: ChannelType.guildVoice,
                drops: drops,
                parentId: 'category-b',
              ),
              _target(
                id: 'category-b',
                type: ChannelType.guildCategory,
                drops: drops,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Future<void> _dragTo(WidgetTester tester, Offset destination) async {
  final TestGesture gesture = await tester.startGesture(
    tester.getCenter(find.text('source')),
    kind: PointerDeviceKind.mouse,
  );
  await gesture.moveBy(const Offset(0, 20));
  await tester.pump();
  await gesture.moveTo(destination);
  await tester.pump();
  await gesture.up();
  await tester.pump();
}

Offset _pointIn(WidgetTester tester, String label, {required double dy}) {
  final Rect rect = tester.getRect(find.text(label));
  return Offset(rect.left + 4, rect.top + dy);
}

void main() {
  late SidebarDragController controller;
  late _Drops drops;

  setUp(() {
    controller = SidebarDragController();
    drops = _Drops();
  });

  tearDown(() => controller.dispose());

  testWidgets('top half of a channel drops before it', (tester) async {
    await _pump(
      tester,
      controller: controller,
      source: _textItem,
      drops: drops,
    );
    await _dragTo(tester, _pointIn(tester, 'text-b', dy: 8));

    expect(drops.channels, hasLength(1));
    final ChannelReorderDropResult result = drops.channels.single.$2;
    expect(result.targetId, 'text-b');
    expect(result.position, ChannelReorderDropPosition.before);
    expect(result.targetParentId, 'category-b');
    expect(controller.isDragging, isFalse);
  });

  testWidgets('bottom half of a channel drops after it', (tester) async {
    await _pump(
      tester,
      controller: controller,
      source: _textItem,
      drops: drops,
    );
    await _dragTo(tester, _pointIn(tester, 'text-b', dy: _rowHeight - 6));

    expect(drops.channels.single.$2.position, ChannelReorderDropPosition.after);
  });

  testWidgets('bottom half of a category drops a channel inside it', (
    tester,
  ) async {
    await _pump(
      tester,
      controller: controller,
      source: _textItem,
      drops: drops,
    );
    await _dragTo(tester, _pointIn(tester, 'category-b', dy: _rowHeight - 6));

    final ChannelReorderDropResult result = drops.channels.single.$2;
    expect(result.position, ChannelReorderDropPosition.inside);
    expect(result.targetParentId, 'category-b');
  });

  testWidgets('text channel is rejected by a voice channel', (tester) async {
    await _pump(
      tester,
      controller: controller,
      source: _textItem,
      drops: drops,
    );
    await _dragTo(tester, _pointIn(tester, 'voice-b', dy: 8));

    expect(drops.channels, isEmpty);
    expect(controller.isDragging, isFalse);
  });

  testWidgets('category is rejected by a channel', (tester) async {
    await _pump(
      tester,
      controller: controller,
      source: _categoryItem,
      drops: drops,
    );
    await _dragTo(tester, _pointIn(tester, 'text-b', dy: 8));

    expect(drops.channels, isEmpty);
  });

  testWidgets('null space drops at the top level', (tester) async {
    await _pump(
      tester,
      controller: controller,
      source: _textItem,
      drops: drops,
    );
    final Rect nullSpace = tester.getRect(
      find.byType(SidebarNullSpaceDropTarget),
    );
    await _dragTo(tester, nullSpace.center);

    final ChannelReorderDropResult result = drops.channels.single.$2;
    expect(result.targetId, kNullSpaceTargetId);
    expect(result.targetParentId, isNull);
  });

  testWidgets('participant drops onto a voice channel only', (tester) async {
    await _pump(
      tester,
      controller: controller,
      source: _participantItem,
      drops: drops,
    );
    await _dragTo(tester, _pointIn(tester, 'text-b', dy: 8));
    expect(drops.participants, isEmpty);

    await _dragTo(tester, _pointIn(tester, 'voice-b', dy: 8));
    expect(drops.participants, <VoiceParticipantDragItem>[_participantItem]);
    expect(drops.channels, isEmpty);
  });

  testWidgets('drag is disabled without a scope', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SidebarDraggable<ChannelReorderDragItem>(
          data: _textItem,
          enabled: true,
          child: _row('source'),
        ),
      ),
    );
    final Draggable<ChannelReorderDragItem> draggable = tester.widget(
      find.byType(Draggable<ChannelReorderDragItem>),
    );
    expect(draggable.maxSimultaneousDrags, 0);
  });
}
