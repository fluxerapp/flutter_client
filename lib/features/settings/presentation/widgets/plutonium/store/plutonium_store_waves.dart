import 'package:fluxer_app/material_ui.dart';

const double _kWaveWidth = 1200;
const double _kWaveHeight = 640;
const double _kParallax = 0.2;

const List<_WavePath> _wavePaths = [
  _WavePath(
    'M0 27C40 31 80 34 120 34C160 33 200 27 240 25C280 23 320 22 360 23C400 23 440 28 480 28C520 29 560 27 600 25C640 23 680 19 720 16C760 14 800 11 840 9C880 7 920 3 960 3C1000 3 1040 5 1080 9C1120 13 1160 23 1200 27',
    1,
  ),
  _WavePath(
    'M0 69C40 73 80 75 120 75C160 76 200 72 240 71C280 69 320 67 360 65C400 63 440 60 480 58C520 56 560 55 600 55C640 55 680 59 720 59C760 58 800 56 840 54C880 51 920 44 960 44C1000 43 1040 47 1080 51C1120 55 1160 65 1200 69',
    0.97,
  ),
  _WavePath(
    'M0 106C40 108 80 111 120 113C160 115 200 118 240 117C280 116 320 111 360 106C400 102 440 92 480 89C520 86 560 87 600 88C640 89 680 96 720 97C760 98 800 97 840 96C880 95 920 91 960 91C1000 92 1040 95 1080 97C1120 99 1160 103 1200 106',
    0.87,
  ),
  _WavePath(
    'M0 141C40 142 80 147 120 149C160 152 200 158 240 157C280 156 320 149 360 144C400 140 440 131 480 127C520 124 560 125 600 125C640 126 680 129 720 131C760 133 800 134 840 137C880 139 920 142 960 144C1000 145 1040 145 1080 144C1120 144 1160 141 1200 141',
    0.72,
  ),
  _WavePath(
    'M0 182C40 181 80 185 120 186C160 187 200 189 240 188C280 187 320 183 360 181C400 178 440 175 480 172C520 170 560 167 600 166C640 164 680 162 720 164C760 166 800 173 840 178C880 183 920 191 960 193C1000 195 1040 192 1080 190C1120 188 1160 183 1200 182',
    0.55,
  ),
  _WavePath(
    'M0 228C40 226 80 224 120 222C160 219 200 216 240 215C280 214 320 216 360 217C400 217 440 219 480 218C520 216 560 210 600 208C640 205 680 202 720 204C760 207 800 215 840 220C880 226 920 232 960 235C1000 237 1040 235 1080 233C1120 232 1160 230 1200 228',
    0.38,
  ),
  _WavePath(
    'M0 274C40 271 80 262 120 257C160 252 200 247 240 246C280 245 320 251 360 253C400 255 440 258 480 258C520 258 560 253 600 253C640 252 680 252 720 253C760 255 800 259 840 262C880 264 920 267 960 269C1000 272 1040 275 1080 276C1120 277 1160 277 1200 274',
    0.23,
  ),
  _WavePath(
    'M0 313C40 310 80 299 120 295C160 290 200 286 240 285C280 283 320 286 360 288C400 289 440 291 480 293C520 295 560 298 600 300C640 302 680 305 720 305C760 306 800 302 840 302C880 302 920 302 960 304C1000 306 1040 313 1080 315C1120 316 1160 316 1200 313',
    0.13,
  ),
  _WavePath(
    'M0 345C40 343 80 339 120 336C160 334 200 331 240 329C280 327 320 323 360 323C400 323 440 325 480 329C520 333 560 343 600 347C640 351 680 354 720 354C760 353 800 347 840 345C880 343 920 342 960 343C1000 343 1040 348 1080 348C1120 349 1160 347 1200 345',
    0.1,
  ),
  _WavePath(
    'M0 375C40 375 80 379 120 379C160 378 200 376 240 374C280 371 320 364 360 364C400 363 440 367 480 371C520 375 560 385 600 389C640 393 680 395 720 395C760 396 800 392 840 391C880 389 920 387 960 385C1000 383 1040 380 1080 378C1120 376 1160 375 1200 375',
    0.13,
  ),
  _WavePath(
    'M0 408C40 409 80 416 120 417C160 418 200 417 240 416C280 415 320 411 360 411C400 412 440 415 480 417C520 419 560 423 600 426C640 428 680 431 720 433C760 435 800 438 840 437C880 436 920 431 960 426C1000 422 1040 412 1080 409C1120 406 1160 407 1200 408',
    0.23,
  ),
  _WavePath(
    'M0 445C40 446 80 449 120 451C160 453 200 454 240 457C280 459 320 462 360 464C400 465 440 465 480 464C520 464 560 461 600 461C640 462 680 467 720 469C760 472 800 478 840 477C880 476 920 469 960 464C1000 460 1040 451 1080 447C1120 444 1160 445 1200 445',
    0.38,
  ),
  _WavePath(
    'M0 486C40 484 80 482 120 484C160 486 200 493 240 498C280 503 320 511 360 513C400 515 440 512 480 510C520 508 560 503 600 502C640 501 680 505 720 506C760 507 800 509 840 508C880 507 920 503 960 501C1000 498 1040 495 1080 492C1120 490 1160 487 1200 486',
    0.55,
  ),
  _WavePath(
    'M0 528C40 525 80 522 120 524C160 527 200 535 240 540C280 546 320 552 360 555C400 557 440 555 480 553C520 552 560 550 600 548C640 546 680 544 720 542C760 539 800 536 840 535C880 534 920 536 960 537C1000 537 1040 539 1080 538C1120 536 1160 530 1200 528',
    0.72,
  ),
  _WavePath(
    'M0 573C40 572 80 572 120 573C160 575 200 579 240 582C280 584 320 587 360 589C400 592 440 595 480 596C520 597 560 597 600 594C640 591 680 582 720 577C760 572 800 567 840 566C880 565 920 571 960 573C1000 575 1040 578 1080 578C1120 578 1160 573 1200 573',
    0.87,
  ),
  _WavePath(
    'M0 620C40 622 80 625 120 625C160 626 200 622 240 622C280 622 320 622 360 624C400 626 440 633 480 635C520 636 560 636 600 633C640 630 680 619 720 615C760 610 800 606 840 605C880 603 920 606 960 608C1000 609 1040 611 1080 613C1120 615 1160 618 1200 620',
    0.97,
  ),
];

class PremiumStoreWaves extends StatelessWidget {
  const PremiumStoreWaves({required this.controller, super.key});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            final double offset = controller.hasClients ? controller.offset : 0;
            return CustomPaint(
              painter: _PageWavesPainter(offset: offset),
              child: child,
            );
          },
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}

class _WavePath {
  const _WavePath(this.d, this.opacity);

  final String d;
  final double opacity;
}

class _PageWavesPainter extends CustomPainter {
  _PageWavesPainter({required this.offset});

  final double offset;

  static final List<Path> _paths = _buildPaths();

  static List<Path> _buildPaths() {
    return [
      for (final _WavePath wave in _wavePaths)
        _parsePath(wave.d).shift(Offset.zero),
    ];
  }

  static Path _parsePath(String d) {
    final Path path = Path();
    final Iterable<Match> matches = RegExp(
      r'[MC]|-?\d+(?:\.\d+)?',
    ).allMatches(d);
    final List<String> tokens = matches.map((m) => m.group(0)!).toList();
    int i = 0;
    double x = 0;
    double y = 0;
    while (i < tokens.length) {
      final String command = tokens[i];
      if (command == 'M') {
        x = double.parse(tokens[i + 1]);
        y = double.parse(tokens[i + 2]);
        path.moveTo(x, y);
        i += 3;
      } else if (command == 'C') {
        final double cp1x = double.parse(tokens[i + 1]);
        final double cp1y = double.parse(tokens[i + 2]);
        final double cp2x = double.parse(tokens[i + 3]);
        final double cp2y = double.parse(tokens[i + 4]);
        x = double.parse(tokens[i + 5]);
        y = double.parse(tokens[i + 6]);
        path.cubicTo(cp1x, cp1y, cp2x, cp2y, x, y);
        i += 7;
      } else {
        i++;
      }
    }
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double shift = (offset * _kParallax) % _kWaveHeight;
    final int columns = (size.width / _kWaveWidth).ceil() + 1;
    final int rows = (size.height / _kWaveHeight).ceil() + 2;
    final double startY = -_kWaveHeight - shift;
    const double startX = -_kWaveWidth;

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas
      ..save()
      ..clipRect(Offset.zero & size);

    for (int row = 0; row < rows; row++) {
      for (int column = 0; column < columns; column++) {
        final double dx = startX + column * _kWaveWidth;
        final double dy = startY + row * _kWaveHeight;
        canvas
          ..save()
          ..translate(dx, dy);
        for (int p = 0; p < _paths.length; p++) {
          paint.color = const Color(
            0xFFFFFFFF,
          ).withValues(alpha: _wavePaths[p].opacity * 0.075);
          canvas.drawPath(_paths[p], paint);
        }
        canvas.restore();
      }
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(_PageWavesPainter oldDelegate) =>
      oldDelegate.offset != offset;
}
