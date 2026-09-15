import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/media/gif_category_grid_layout.dart';

void main() {
  test('visible category indexes exclude cached offscreen rows', () {
    expect(
      visibleGifCategoryIndexes(
        itemCount: 12,
        columnCount: 2,
        tileHeight: 100,
        gap: 8,
        scrollOffset: 0,
        viewportHeight: 100,
      ),
      [0, 1],
    );
  });

  test('visible category indexes advance with scroll offset', () {
    expect(
      visibleGifCategoryIndexes(
        itemCount: 12,
        columnCount: 2,
        tileHeight: 100,
        gap: 8,
        scrollOffset: 108,
        viewportHeight: 100,
      ),
      [2, 3],
    );
  });

  test('category grid content height includes bottom padding', () {
    expect(
      gifCategoryGridContentHeight(
        itemCount: 5,
        columnCount: 2,
        tileHeight: 100,
        gap: 8,
        bottomPadding: 10,
      ),
      326,
    );
  });
}
