import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

final baseStyle = Style(
  $box.padding(16), // General padding
  $on.light(
    $box.color(Colors.white), // Default background color
    $text.style.color(Colors.black87), // Default text color
  ),
  $on.dark(
    $box.color(Colors.grey[900]!), // Background color in dark mode
    $text.style.color(Colors.white), // Text color in dark mode
  ),
);


final listItemStyle = Style(
  $box.padding.vertical(8),
  $box.borderRadius(12),
  //$box.elevation(4),
  $box.margin.bottom(10),
  $box.color(Colors.white),
  // Background color for list items
  $box.shadow.color(Colors.black.withOpacity(0.1)),
  $text.style.color(Colors.black87),
  // Default text color
  $on.dark(
    $box.color(Colors.grey[900]!), // Background color in dark mode
    $text.style.color(Colors.white), // Text color in dark mode
  ),
);


final iconStyle = Style(
  $icon.size(20),
  $icon.color(Colors.grey), // Default icon color
  $on.dark(
    $icon.color(Colors.white70), // Icon color in dark mode
  ),
);

