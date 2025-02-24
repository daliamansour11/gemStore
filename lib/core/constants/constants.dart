 import 'package:flutter/material.dart';


const Grey=Color(0xff464447);

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
 List<String> categoryType =const [
   'CLOTHING',
   'ACCESSORIES',
   'SHOES',
   'COLLECTION'
 ];
 List<String> categoryImage = [
   'https://s3-alpha-sig.figma.com/img/c793/6776/96d160379456b9e0b7274fcb6b4facc6?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=n-CLbONt1NLeOeIfKrJ9GWmgCb1rlMUXvzEHMRrgJKia0c8xLFT62~U-SuqGHhNCqfkA8F4RC5Nv1TMufinQ8~TrGzc7szaDlxAUs5pBTSXgSFwDIKONWfpZPOcjZfbLcyAMbDOp9Z0nIM8R0TkaHOTDL-oIrbqdfNYw6BmAJTAsx5OLpCIty8RXODBAEpJXJFKrFRbllZx7nKzntu6Io9rNvb5fjz7oPO7RlZA~uTRNTPyj6yDertdE9tWKKbX7BpkIUpdK4pdolHkcMpa3tAwbKr9gESnr6ntdVso~ssFBQfyk-ERfpLJM9q3io5dawsGhnimKbxDB~fxR6QnhdQ__',
'https://s3-alpha-sig.figma.com/img/b03a/5128/3ea25298d27460a3a2580d0e87ab3c5d?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=P9x47ptIEYYistjhhLEpyKTtYeMrRubm4SKFAP7TUM3bzPsOIHrcQqJg~dylvOcMkfZHKrdJzHPtCCguW3eHg1oDV93cV7HIQhwmKwsv2B6Du3vJqPtgL4MGybG4EfjUQA-ct5OI0fqg9Sx6vIl3ncpntof7qVSkZPA0vfg5pnR77rVNbr-cKoNQfX2lbhGPSBRsKqXitzLjRlWYF119fPXbSZ-SNOuRtghPREwAfCXe9fib7hjdnLZlvLd~5rznHWlEWK6dnug62q6CYp1XtADlC3LCIzjPB~Qkrsn3kPtSf6hBYdEcvmoAK1yBK5ySmeFsvI48trH6imF3ZFaKPQ__',
'https://s3-alpha-sig.figma.com/img/3d3c/56ec/c5dd806b206d8595e4f1e074342375c1?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=mwBTmbQY0AE9FplK~pnNsdowb3KDhtuRj~D02mkxe0W3Va4I90SBOZ7SgQFfDgY~pK4BfGh7-fenb7zmTiQJee7fiME-WLulNL4H9aQ06WV4E5OzH~2Zar4-M1a9YOBie8k6U~p~jHpSEAUxRyNlQubU-xnbErECxP5ZOLFICyAH3GsawzVyMj6HtydWVgdOHCgTc9CKw560u2Fu2g3GXqQU1tbfU-T0~DKSvTlX49IoWNag89K5M2Z72pJCeCQZmt6YPH2g8AA4XZCkFQqoD5tyfWrc60e2mhiCFMFV9r8fiRyXLrfirk7te2IP5bMdznp1Q8heQ4xJiRLlPfqpmw__',
'https://s3-alpha-sig.figma.com/img/94e3/f60d/0bcca95f03fb944f30384d4c322d886e?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=VstQwTKkpbBFF5gqYD1Ef~xT~8g6g0PjF~I5oQ884EcmepKTwclKsjpZTrGxmU0QyfH2ZlgVXBQL5XrHQPTdHfjNGiXdu6UWierj5ABp5cc8~RhmXPMWp28IPBa18Wj3urbcZ5o~B83pyu83B2PCrYXIThaewmUk96hRAy1RLjod0vo3y~I56CoSlU8kVXT-ZBrXIVsX~zmejgkUWY1k2F7CDpdnONxT~PjGPENouzfk~5TTC35s~knZL7ADI1h-o7z3rE9GwWyFNjvEA3IGiHHglny3gcGfkDrNNRpgzQtOLMF3yXW4DO1ptDmDRuwy~MC-NAKPw6OfeUP0hXub7w__' ];

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
