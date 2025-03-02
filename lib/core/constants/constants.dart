import 'package:flutter/material.dart';

import '../resources/colors_manger.dart';

const grey = Color(0xff464447);

const List<Color> colors = [
  Color(0xFFFFA500), // Orange
  Color(0xFFE53935), // Red
  Color(0xFF000000), // Black
  Color(0xFF607D8B), // Dark Gray
  Color(0xFFB0BEC5), // Light Gray
  Color(0xFFD7AFA7), // Light Pink
];
List<Color> circleColor = [
  const Color(0xffC2C7B5),
  const Color(0xff9C9492),
  const Color(0xff5B7178),
  const Color(0xffD1CACD)
];
List<String> categoryType = const [
  'CLOTHING',
  'ACCESSORIES',
  'SHOES',
  'COLLECTION'
];

List<String> categoryImage = [
  'https://s3-alpha-sig.figma.com/img/c793/6776/96d160379456b9e0b7274fcb6b4facc6?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=n-CLbONt1NLeOeIfKrJ9GWmgCb1rlMUXvzEHMRrgJKia0c8xLFT62~U-SuqGHhNCqfkA8F4RC5Nv1TMufinQ8~TrGzc7szaDlxAUs5pBTSXgSFwDIKONWfpZPOcjZfbLcyAMbDOp9Z0nIM8R0TkaHOTDL-oIrbqdfNYw6BmAJTAsx5OLpCIty8RXODBAEpJXJFKrFRbllZx7nKzntu6Io9rNvb5fjz7oPO7RlZA~uTRNTPyj6yDertdE9tWKKbX7BpkIUpdK4pdolHkcMpa3tAwbKr9gESnr6ntdVso~ssFBQfyk-ERfpLJM9q3io5dawsGhnimKbxDB~fxR6QnhdQ__',
  'https://s3-alpha-sig.figma.com/img/c793/6776/96d160379456b9e0b7274fcb6b4facc6?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=n-CLbONt1NLeOeIfKrJ9GWmgCb1rlMUXvzEHMRrgJKia0c8xLFT62~U-SuqGHhNCqfkA8F4RC5Nv1TMufinQ8~TrGzc7szaDlxAUs5pBTSXgSFwDIKONWfpZPOcjZfbLcyAMbDOp9Z0nIM8R0TkaHOTDL-oIrbqdfNYw6BmAJTAsx5OLpCIty8RXODBAEpJXJFKrFRbllZx7nKzntu6Io9rNvb5fjz7oPO7RlZA~uTRNTPyj6yDertdE9tWKKbX7BpkIUpdK4pdolHkcMpa3tAwbKr9gESnr6ntdVso~ssFBQfyk-ERfpLJM9q3io5dawsGhnimKbxDB~fxR6QnhdQ__',
  'https://s3-alpha-sig.figma.com/img/c793/6776/96d160379456b9e0b7274fcb6b4facc6?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=n-CLbONt1NLeOeIfKrJ9GWmgCb1rlMUXvzEHMRrgJKia0c8xLFT62~U-SuqGHhNCqfkA8F4RC5Nv1TMufinQ8~TrGzc7szaDlxAUs5pBTSXgSFwDIKONWfpZPOcjZfbLcyAMbDOp9Z0nIM8R0TkaHOTDL-oIrbqdfNYw6BmAJTAsx5OLpCIty8RXODBAEpJXJFKrFRbllZx7nKzntu6Io9rNvb5fjz7oPO7RlZA~uTRNTPyj6yDertdE9tWKKbX7BpkIUpdK4pdolHkcMpa3tAwbKr9gESnr6ntdVso~ssFBQfyk-ERfpLJM9q3io5dawsGhnimKbxDB~fxR6QnhdQ__',
  'https://s3-alpha-sig.figma.com/img/c793/6776/96d160379456b9e0b7274fcb6b4facc6?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=n-CLbONt1NLeOeIfKrJ9GWmgCb1rlMUXvzEHMRrgJKia0c8xLFT62~U-SuqGHhNCqfkA8F4RC5Nv1TMufinQ8~TrGzc7szaDlxAUs5pBTSXgSFwDIKONWfpZPOcjZfbLcyAMbDOp9Z0nIM8R0TkaHOTDL-oIrbqdfNYw6BmAJTAsx5OLpCIty8RXODBAEpJXJFKrFRbllZx7nKzntu6Io9rNvb5fjz7oPO7RlZA~uTRNTPyj6yDertdE9tWKKbX7BpkIUpdK4pdolHkcMpa3tAwbKr9gESnr6ntdVso~ssFBQfyk-ERfpLJM9q3io5dawsGhnimKbxDB~fxR6QnhdQ__',
];
final List<List<Map<String, dynamic>>> items = [
  [
    {'name': 'Jackets', 'count': 10},
    {'name': 'T-Shirts', 'count': 15},
    {'name': 'Pants', 'count': 8}
  ],
  [
    {'name': 'Watches', 'count': 5},
    {'name': 'Necklaces', 'count': 12},
    {'name': 'Bracelets', 'count': 7}
  ],
  [
    {'name': 'Sneakers', 'count': 20},
    {'name': 'Boots', 'count': 9},
    {'name': 'Sandals', 'count': 14}
  ],
  [
    {'name': 'Limited Edition', 'count': 4},
    {'name': 'Vintage Collection', 'count': 6}
  ]
];

final kCustomBoxShadow = BoxShadow(
  color: ColorsManger.grey.withOpacity(0.9),
  blurRadius: 8,
  spreadRadius: 2,
  offset: const Offset(0, 2),
);
