import 'package:flutter/widgets.dart';

class SystemEmojiFallback extends StatelessWidget {
  const SystemEmojiFallback({
    required this.emoji,
    required this.size,
    super.key,
  });

  final String emoji;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FittedBox(
        child: Text(emoji, style: TextStyle(fontSize: size, height: 1)),
      ),
    );
  }
}
