import 'package:flutter/material.dart';

// TODO: Separate app strings, colors, and constants into individual classes, each in its own file.
const Grey = Color(0xff464447);

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
  'https://s3-alpha-sig.figma.com/img/c793/6776/96d160379456b9e0b7274fcb6b4facc6?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=bfFI0IdIdmVgMgjP0DdS~Irk-YppivfhK~Bo~y3h2BhLpKFbfGvHEgbe8qWscfT51WWp2A5Y4u1uGSh379FATPOItoUlTP9Sd7fvE1qnWmy0lXqyMv8h9Fx8K~RjmExAixy~ez2lnX7jkGcvC4lzgfMok693v6GVwpAH0U3pyyPqhzsLYl5qGrANwRIl0n3eqzvXl2fQdSjT2CseR5uFJftvDEJIFQVyTAj-DuiV8jy5bQVJkq15cAbu0FWKFV43q5BIwg2~hQqUaMf7IYagoKC9Oh33wPF5sEAq5t1DqCRyBmp-PZf8QB4iJmGy9kzQczkQUz0CqJlcgsg2mH-d2Q__',
  'https://s3-alpha-sig.figma.com/img/b03a/5128/3ea25298d27460a3a2580d0e87ab3c5d?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kscLBfbgy~CB6c094R-Pdfy-FVqRuLuoO4lca3NKb8D0ioIrDLy8k5yrlC~FPN-iLWEUu7fE6o3hsNH44tPc25T64yR-dLr-QpnFglkj-fivARHrMcI-vK~npvvk8dRJh56pAD1mFxaEmjAHhERJfQlXqauItTUmjs8qlSgJH9IFaaSSAHNRjOF8LOT6JWMKCFkCXhUwg1Jq9DU01zbFYPpdzk7ZNKNPX2fw5DVjjgGcuEZfEf9dtkxe0W1QaVSBxv0w5LgVRz0yXVxRkt86y8kmeTjaE8aHmPT5p0U-zVOEVab8BDv4y7-HZWZJAlVnj4wXrm2juqXY10GDW4sIKQ__',
  'https://s3-alpha-sig.figma.com/img/3d3c/56ec/c5dd806b206d8595e4f1e074342375c1?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=rOcA7He~N7lvRmcpTSwck~rQsFfvVoBivek70s0r5s88g388BT6ddjuahqSBNX-v9L5ifNi8qppUXrgM89vRRmzhYEV47UvCEvxdfP~U0dudWbBcxpDcCZhizYw57~JttbXf~iNVegf7uSCqDrpPcs4-PvdeymkfgabYA3c7QDrlSPWR3RG1YdyNZc66HmT7W~wMMB2IXbxLC3a6mdZgOpkXmTjU7PbGAKUnMvWMalkvsmeVZI0IaMxKCQ-du4mqBd5C6aTmXACz6v0xpvoHgrNQxNBWiwlX5sF6hyj4eT7RTOPRupnHFjAy-UZr~CaivxismZCutI1XHDewKZXi~Q__',
  'https://s3-alpha-sig.figma.com/img/94e3/f60d/0bcca95f03fb944f30384d4c322d886e?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=F2evEQrm2Gzpod8WEyWFdiT5yhLxMHnQRcLtlurJbzmuiitPoVls~DN3K8cXc-z6AF91l-BP061LHnMSctBdLyMnlCjTkwrjro5OP7~m4hvLcB4~gpvOMyEtCDQVWVd~XbqKUNhrmRjo5qCx5M0QKzBp~GETFQvIav7UW-SXNR0sO~nft3flq8UnUDhQuhcWLa4k-~igR5kWM1bSJ3vV2GNo6lKaOKgFQtwl5Wv2Y8auD~Wjh3Ivy3MUVow3dEwgIZKPT09hllwyFnxX34sLs-GhJU-8tTS2JsIHGVMMMWnvVJOVwqQQMCp-YR6B3i-zDHMC-uIefAT39Xu40PNbIg__'
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
