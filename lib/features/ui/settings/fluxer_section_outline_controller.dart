import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_section_outline_entry.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerSectionOutlineController extends ChangeNotifier {
  static const double _kScrollOffset = 24;
  static const double _kScrollEpsilon = 2;
  static const int _kMinSections = 2;

  final Map<Object, _OutlineAnchor> _anchors = <Object, _OutlineAnchor>{};
  final Map<String, List<FluxerSectionOutlineEntry>> _entriesByTab =
      <String, List<FluxerSectionOutlineEntry>>{};
  String? _activeTab;
  String? _expandedTab;
  String? _activeSectionId;
  _PinnedSection? _pinned;
  bool _refreshScheduled = false;
  bool _disposed = false;

  String? get activeTab => _activeTab;

  String? get activeSectionId => _activeSectionId;

  List<FluxerSectionOutlineEntry> sectionsFor(String tab) {
    final List<FluxerSectionOutlineEntry>? entries = _entriesByTab[tab];
    if (entries == null || entries.length < _kMinSections) {
      return const <FluxerSectionOutlineEntry>[];
    }
    return entries;
  }

  bool hasSections(String tab) => sectionsFor(tab).isNotEmpty;

  bool isExpanded(String tab) => _expandedTab == tab && hasSections(tab);

  void setActiveTab(String? tab) {
    if (_activeTab == tab) {
      return;
    }
    _activeTab = tab;
    _expandedTab = tab;
    _activeSectionId = null;
    _pinned = null;
    _scheduleRefresh(notify: true);
  }

  void expand(String tab) {
    if (_expandedTab == tab || !hasSections(tab)) {
      return;
    }
    _expandedTab = tab;
    notifyListeners();
  }

  void collapse(String tab) {
    if (_expandedTab != tab) {
      return;
    }
    _expandedTab = null;
    notifyListeners();
  }

  void toggle(String tab) {
    if (_expandedTab == tab) {
      collapse(tab);
    } else {
      expand(tab);
    }
  }

  void register(
    Object owner,
    BuildContext context,
    FluxerSectionOutlineEntry entry,
  ) {
    final String? tab = _activeTab;
    final _OutlineAnchor? existing = _anchors[owner];
    if (existing != null && existing.tab == tab) {
      existing.context = context;
      if (existing.entry != entry) {
        existing.entry = entry;
        _scheduleRefresh();
      }
      return;
    }
    if (tab == null) {
      _anchors.remove(owner);
      return;
    }
    _anchors[owner] = _OutlineAnchor(tab: tab, context: context, entry: entry);
    _scheduleRefresh();
  }

  void unregister(Object owner) {
    final _OutlineAnchor? removed = _anchors.remove(owner);
    if (removed != null && removed.tab == _activeTab) {
      _scheduleRefresh();
    }
  }

  void handleScroll() => _scheduleRefresh();

  bool scrollToSection(String sectionId) {
    if (_disposed) {
      return false;
    }
    final _OutlineAnchor? anchor = _anchorFor(sectionId);
    if (anchor == null || !anchor.context.mounted) {
      return false;
    }
    final ScrollableState? scrollable = Scrollable.maybeOf(anchor.context);
    final double? top = _revealOffset(anchor.context);
    if (scrollable == null || top == null) {
      return false;
    }
    final ScrollPosition position = scrollable.position;
    final double target = (top - _kScrollOffset).clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
    _pinned = _PinnedSection(sectionId, target);
    position.jumpTo(target);
    if (_activeSectionId != sectionId) {
      _activeSectionId = sectionId;
      notifyListeners();
    }
    return true;
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  _OutlineAnchor? _anchorFor(String sectionId) {
    for (final _OutlineAnchor anchor in _anchors.values) {
      if (anchor.tab == _activeTab && anchor.entry.id == sectionId) {
        return anchor;
      }
    }
    return null;
  }

  void _scheduleRefresh({bool notify = false}) {
    if (_refreshScheduled) {
      return;
    }
    _refreshScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshScheduled = false;
      if (_disposed) {
        return;
      }
      if (!_refresh() && notify) {
        notifyListeners();
      }
    });
    WidgetsBinding.instance.ensureVisualUpdate();
  }

  bool _refresh() {
    final String? tab = _activeTab;
    if (tab == null) {
      return false;
    }
    final List<_MeasuredSection> measured = <_MeasuredSection>[];
    ScrollableState? scrollable;
    for (final _OutlineAnchor anchor in _anchors.values) {
      if (anchor.tab != tab || !anchor.context.mounted) {
        continue;
      }
      final double? top = _revealOffset(anchor.context);
      if (top == null) {
        continue;
      }
      scrollable ??= Scrollable.maybeOf(anchor.context);
      measured.add(_MeasuredSection(anchor.entry, top));
    }
    measured.sort(
      (_MeasuredSection a, _MeasuredSection b) => a.top.compareTo(b.top),
    );
    final List<FluxerSectionOutlineEntry> entries = <FluxerSectionOutlineEntry>[
      for (final _MeasuredSection section in measured) section.entry,
    ];
    bool changed = false;
    if (!listEquals(entries, _entriesByTab[tab])) {
      _entriesByTab[tab] = entries;
      changed = true;
    }
    final String? nextActive = _resolveActive(measured, scrollable);
    if (nextActive != _activeSectionId) {
      _activeSectionId = nextActive;
      changed = true;
    }
    if (changed) {
      notifyListeners();
    }
    return changed;
  }

  String? _resolveActive(
    List<_MeasuredSection> measured,
    ScrollableState? scrollable,
  ) {
    if (measured.length < _kMinSections) {
      return null;
    }
    if (scrollable == null || !scrollable.position.hasContentDimensions) {
      return measured.first.entry.id;
    }
    final ScrollPosition position = scrollable.position;
    final double pixels = position.pixels;
    final _PinnedSection? pinned = _pinned;
    if (pinned != null) {
      if ((pixels - pinned.expectedPixels).abs() <= _kScrollEpsilon) {
        return pinned.id;
      }
      _pinned = null;
    }
    final List<double> thresholds = _thresholds(
      <double>[for (final _MeasuredSection section in measured) section.top],
      maxScroll: position.maxScrollExtent,
      viewport: position.viewportDimension,
    );
    String? next;
    for (int i = 0; i < measured.length; i++) {
      if (thresholds[i] > pixels + _kScrollEpsilon) {
        break;
      }
      next = measured[i].entry.id;
    }
    return next ?? measured.first.entry.id;
  }

  static double? _revealOffset(BuildContext context) {
    final RenderObject? object = context.findRenderObject();
    if (object == null || !object.attached) {
      return null;
    }
    final RenderAbstractViewport? viewport = RenderAbstractViewport.maybeOf(
      object,
    );
    return viewport?.getOffsetToReveal(object, 0).offset;
  }

  static List<double> _thresholds(
    List<double> tops, {
    required double maxScroll,
    required double viewport,
  }) {
    final List<double> raw = <double>[
      for (final double top in tops) top - _kScrollOffset,
    ];
    if (raw.isEmpty || maxScroll <= 0) {
      return raw;
    }
    final int firstUnreachable = raw.indexWhere(
      (double threshold) => threshold > maxScroll - _kScrollEpsilon,
    );
    if (firstUnreachable == -1) {
      return raw;
    }
    final double span = raw.last - maxScroll;
    if (span <= 0) {
      return <double>[
        for (int i = 0; i < raw.length; i++)
          if (i < firstUnreachable) raw[i] else maxScroll,
      ];
    }
    final double zoneFloor = firstUnreachable > 0
        ? raw[firstUnreachable - 1].clamp(0, maxScroll)
        : 0;
    final double zone = math.min(
      span,
      math.min(math.max(viewport - _kScrollOffset, 0), maxScroll - zoneFloor),
    );
    return <double>[
      for (int i = 0; i < raw.length; i++)
        if (i < firstUnreachable)
          raw[i]
        else
          maxScroll - zone * (1 - ((raw[i] - maxScroll) / span).clamp(0, 1)),
    ];
  }
}

class _OutlineAnchor {
  _OutlineAnchor({
    required this.tab,
    required this.context,
    required this.entry,
  });

  final String tab;
  BuildContext context;
  FluxerSectionOutlineEntry entry;
}

class _MeasuredSection {
  const _MeasuredSection(this.entry, this.top);

  final FluxerSectionOutlineEntry entry;
  final double top;
}

class _PinnedSection {
  const _PinnedSection(this.id, this.expectedPixels);

  final String id;
  final double expectedPixels;
}
