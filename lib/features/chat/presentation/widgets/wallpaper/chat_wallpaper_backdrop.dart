import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/providers/chat_wallpaper_provider.dart';
import 'package:fluxer_app/features/chat/wallpaper/chat_wallpaper.dart';
import 'package:fluxer_app/features/ui/background/starfield_background.dart';
import 'package:fluxer_app/material_ui.dart';

class ChatWallpaperBackdrop extends ConsumerWidget {
  const ChatWallpaperBackdrop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChatWallpaperSnapshot snapshot = ref.watch(chatWallpaperProvider);
    final ChatWallpaperState resolved = snapshot.resolved;
    final Color themeBackground = context.colors.chatBackground;
    final ChatWallpaperPaint paint = resolveChatWallpaperPaint(
      snapshot: snapshot,
      themeBackground: themeBackground,
    );

    final Size size = MediaQuery.sizeOf(context);
    final double dpr = MediaQuery.devicePixelRatioOf(context);
    final int cacheWidth = (size.width * dpr).round().clamp(1, 4096);
    final int cacheHeight = (size.height * dpr).round().clamp(1, 4096);

    final ImageProvider? imageProvider = paint.imageProvider;

    return RepaintBoundary(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ColoredBox(color: paint.fallbackColor),
          if (paint.gradient != null)
            DecoratedBox(decoration: BoxDecoration(gradient: paint.gradient)),
          if (imageProvider != null)
            Image(
              key: ObjectKey(imageProvider),
              image: ResizeImage(
                imageProvider,
                width: cacheWidth,
                height: cacheHeight,
                policy: ResizeImagePolicy.fit,
              ),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
              gaplessPlayback: true,
            ),
          if (resolved.kind == ChatWallpaperKind.starfield)
            const StarfieldBackground(animate: false),
          if (!resolved.isThemeBackground)
            ColoredBox(color: chatWallpaperDimColor(resolved.dim)),
        ],
      ),
    );
  }
}

class ChatWallpaperComposerFade extends ConsumerWidget {
  const ChatWallpaperComposerFade({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChatWallpaperSnapshot snapshot = ref.watch(chatWallpaperProvider);
    final ChatWallpaperState resolved = snapshot.resolved;
    final Color themeBackground = context.colors.chatBackground;
    final ChatWallpaperPaint paint = resolveChatWallpaperPaint(
      snapshot: snapshot,
      themeBackground: themeBackground,
    );
    return WideComposerFade(
      surfaceColor: chatWallpaperComposerFadeColor(
        paint: paint,
        resolved: resolved,
        themeBackground: themeBackground,
      ),
    );
  }
}
