import 'package:flutter/material.dart';

import '../resources/assets_manger.dart';
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
'https://s3-alpha-sig.figma.com/img/c793/6776/96d160379456b9e0b7274fcb6b4facc6?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=pugePxRqdfwxOsJfo4~Rj6xzv7rDYCYMcKtTcyaqPwTBpP0WDMSRAuQLJ64hA3dnZhVSKv9uJN~BEQWfj1qh0hjujLQPuTzIjkjTkly8WiOQ12YPgHijz2hMzSSXIh9L4-2NlFBaej8Iby1aJik5ieeJZ9Xu8CxXp7JuBUrBHBmin5kh5nkovsUbEJGhsOrZJ6Cd~dbzi~flqhvq5oy3Hx0eHe7mQosETlRSKHd6-YXjgMHsvwZgzqBpncSx3WLvdZGHGPSOefGl4B5-TGUc07bczz2RRpEinXE2a87Fwo5T~wFKAnC8ywGd9cRSQjDLGcP2drECZKdrlpB~PiFAqQ__',
 'https://s3-alpha-sig.figma.com/img/b03a/5128/3ea25298d27460a3a2580d0e87ab3c5d?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=m9V54VH4aAPlu18jRRqpQINVixxc87HLxN~G1ygDuYc1QojV8ebifZ-Ap4pqXl1lYVnOyo5iwwhJfdDCkzps1xQEBLWmXPHLAgRApZNoP71-lTFatSADgKyKIsyZasN5QrRJF53isZ6p7aCRi-CmLv1zumIwrCsVd6zfNQrLRK100oSkLSR63beqeuYvVuz2vdoYiJ1kMsDgerCtjymq9Acb-52J43P3h8lxF5w5UzW5XGZln9eYANJNn6Nd~OhV6FJciyCIu3OiVr0Fer-1BBb79oFTfGD1kmXBZEzfeY6Ln2y5J8p0yir3rpLUxubd~jeTnS5vwaD721RYMaE5og__',
'https://s3-alpha-sig.figma.com/img/3d3c/56ec/c5dd806b206d8595e4f1e074342375c1?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=WQDQ6UQn-9TdYsryG9prHZkAIxnIjqPsEwL4B83209cLLbEm1xmMtf5ZFdaVlDGT6f6xMTgRsq-IPDx3jUf9LODD1zZ78tDkHeQMls7lz7aq6F1tGiN5YI5OjRtd-QyuLa1jBtB35SZ-qLnmuSk-2Q-0dzAqp9sivb828ndBpuUggyI-07fFK1YBoSCPsYXaFyGWGWYyEnSoWtr3ndmTiZzxSTqeW4jHe1retrTVyU9k97FUZJa3KrvuXSPPCOFpIbLKlqlZErZ8gkGB9s4B2pYVYvq8EI6zarle641d4bqs8bTrtJ4tkr6jwMnF81vjctcUgwiBXDYIDOteqg87QA__',
'https://s3-alpha-sig.figma.com/img/94e3/f60d/0bcca95f03fb944f30384d4c322d886e?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=lwOkUd0~jP2jGhDLBeIKEptjuFD4y3ROEyV7uwjHAqNnEDTPi84czo0n~4m6vXT4YYt~wit~~1XK7LGwbC6dsYv8FIQhsEEpIQAcfGMjJqHzFlV2knxfAaEJmuGWCLbAcrhQWIhD~9ivVJjmch5opb9cYUytoLJvjfMO9WILseLlXNXz0MD4rtMb7wfny9ri~-79zZyVIp89syJBw4qRsBlACbm-TAr8E~Ug1wlSqVt~z~QGrBk9kThWRfcRw1-AuKn49ag6jarm~An8HqcckgnDB5EH7~mg~r15adJSlVPKJhQIuMBHgONN3UTVOTzWpOR-jijSXbvpz1MBbjui5w__',

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
