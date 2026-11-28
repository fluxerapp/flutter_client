enum ExpressionPickerResizeEdge {
  top,
  bottom,
  left,
  right,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight;

  bool get movesTop => this == top || this == topLeft || this == topRight;

  bool get movesBottom =>
      this == bottom || this == bottomLeft || this == bottomRight;

  bool get movesLeft => this == left || this == topLeft || this == bottomLeft;

  bool get movesRight =>
      this == right || this == topRight || this == bottomRight;
}
