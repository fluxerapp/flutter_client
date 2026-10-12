import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

const double kNotificationRowLeadingSize = 48;
const double kNotificationRowLeadingGap = 12;
const double kNotificationRowTextInset =
    kNotificationRowLeadingSize + kNotificationRowLeadingGap;
const double kNotificationRowHorizontalPadding = 16;
const double kNotificationPreviewRadius = 8;
const Duration _kPulsePeriod = Duration(milliseconds: 900);

class NotificationsSkeletonList extends StatefulWidget {
  const NotificationsSkeletonList({this.rowCount = 6, super.key});

  final int rowCount;

  @override
  State<NotificationsSkeletonList> createState() =>
      _NotificationsSkeletonListState();
}

class _NotificationsSkeletonListState extends State<NotificationsSkeletonList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: _kPulsePeriod,
  );
  late final Animation<double> _opacity = Tween<double>(
    begin: 0.55,
    end: 1,
  ).animate(CurvedAnimation(parent: _pulse, curve: Curves.easeInOut));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _pulse
        ..stop()
        ..value = 1;
    } else if (!_pulse.isAnimating) {
      _pulse.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: FadeTransition(
        opacity: _opacity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (int i = 0; i < widget.rowCount; i++)
              const _NotificationsSkeletonRow(),
          ],
        ),
      ),
    );
  }
}

class _NotificationsSkeletonRow extends StatelessWidget {
  const _NotificationsSkeletonRow();

  @override
  Widget build(BuildContext context) {
    final Color shape = context.colors.backgroundSecondaryAlt;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        kNotificationRowHorizontalPadding,
        8,
        kNotificationRowHorizontalPadding,
        8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: kNotificationRowLeadingSize,
            height: kNotificationRowLeadingSize,
            decoration: BoxDecoration(color: shape, shape: BoxShape.circle),
          ),
          const SizedBox(width: kNotificationRowLeadingGap),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _SkeletonBar(widthFactor: 0.8, height: 14, color: shape),
                const SizedBox(height: 4),
                _SkeletonBar(widthFactor: 0.57, height: 15, color: shape),
                const SizedBox(height: 9),
                NotificationsSkeletonBlock(color: shape, height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationsSkeletonBlock extends StatelessWidget {
  const NotificationsSkeletonBlock({this.color, this.height = 56, super.key});

  final Color? color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color ?? context.colors.backgroundSecondaryAlt,
        borderRadius: BorderRadius.circular(kNotificationPreviewRadius),
      ),
    );
  }
}

class _SkeletonBar extends StatelessWidget {
  const _SkeletonBar({
    required this.widthFactor,
    required this.height,
    required this.color,
  });

  final double widthFactor;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height / 2),
        ),
      ),
    );
  }
}
