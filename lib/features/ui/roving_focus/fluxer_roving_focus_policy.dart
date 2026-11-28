import 'package:fluxer_app/material_ui.dart';

class FluxerRovingFocusPolicy extends ReadingOrderTraversalPolicy {
  FluxerRovingFocusPolicy({required this.skippedNodes});

  final Set<FocusNode> Function() skippedNodes;

  @override
  Iterable<FocusNode> sortDescendants(
    Iterable<FocusNode> descendants,
    FocusNode currentNode,
  ) {
    final Iterable<FocusNode> sorted = super.sortDescendants(
      descendants,
      currentNode,
    );
    final Set<FocusNode> skipped = skippedNodes();
    if (skipped.isEmpty) {
      return sorted;
    }
    return sorted.where((FocusNode node) => !skipped.contains(node)).toList();
  }
}
