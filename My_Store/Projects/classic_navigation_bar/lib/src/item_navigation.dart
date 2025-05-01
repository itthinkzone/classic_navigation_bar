import 'package:flutter/material.dart';

/// Represents a navigation item for [ClassicNavigationBar].
class ItemNavigation {
  /// The widget displayed when the item is not selected.
  final Widget childBefore;

  /// The widget displayed when the item is selected.
  final Widget childAfter;

  /// The label displayed below the item.
  final String label;

  ItemNavigation({
    required this.childAfter,
    required this.childBefore,
    required this.label,
  });
}