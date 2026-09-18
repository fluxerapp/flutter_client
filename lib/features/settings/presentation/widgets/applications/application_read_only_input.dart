import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

class ApplicationReadOnlyInput extends StatefulWidget {
  const ApplicationReadOnlyInput({
    required this.text,
    required this.label,
    this.hint,
    this.trailing,
    this.enabled = true,
    super.key,
  });

  final String text;
  final String label;
  final String? hint;
  final Widget? trailing;
  final bool enabled;

  @override
  State<ApplicationReadOnlyInput> createState() =>
      _ApplicationReadOnlyInputState();
}

class _ApplicationReadOnlyInputState extends State<ApplicationReadOnlyInput> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.text,
  );

  @override
  void didUpdateWidget(ApplicationReadOnlyInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text && _controller.text != widget.text) {
      _controller.text = widget.text;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FluxerInput(
      controller: _controller,
      label: widget.label,
      hint: widget.hint,
      readOnly: true,
      enabled: widget.enabled,
      trailing: widget.trailing,
    );
  }
}
