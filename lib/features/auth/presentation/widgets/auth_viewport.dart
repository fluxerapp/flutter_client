import 'package:material_ui/material_ui.dart';

class AuthViewport extends StatelessWidget {
  const AuthViewport({
    required this.child,
    required this.padding,
    this.maxWidth = double.infinity,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: SingleChildScrollView(padding: padding, child: child),
        ),
      ),
    );
  }
}
