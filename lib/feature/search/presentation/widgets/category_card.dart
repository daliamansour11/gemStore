//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../config/theme/themeData.dart';
// import '../../../../core/resources/colors_manger.dart';
// import '../../../../core/resources/values_manger.dart';
//
//
//
// class CategoryCard extends StatelessWidget {
//   final String title;
//   final String imageUrl;
//   final Color backgroundColor;
//
//   const CategoryCard(
//       {super.key, required this.title,
//         required this.imageUrl,
//         required this.backgroundColor});
//
//   cardColor(String categoryName) {
//     switch (categoryName) {
//       case 'CLOTHING':
//         return ColorsManger.category1Color;
//
//       case 'ACCESSORIES':
//         return ColorsManger.category2Color;
//       case 'SHOES':
//         return ColorsManger.category3Color;
//       case 'COLLECTION':
//         return ColorsManger.category4Color;
//       default:
//         return Colors.white;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//         child: Container(
//           height: 126.h,
//           // width: 340,
//           decoration: BoxDecoration(
//             color: cardColor(title),
//             borderRadius: BorderRadius.circular(AppSize.s15),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: AppPadding.p18, ),
//                   child: Text(
//                     title,
//                     style:appTheme().textTheme.bodySmall,
//
//
//                   ),
//                 ),
//               ),
//               Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: AppPadding.p51, right: AppPadding.p20, top: AppPadding.p10, bottom: AppPadding.p11),
//                     child: Container(
//                       width: 105.w,
//                       height: 105.h,
//                       decoration: BoxDecoration(
//                         color: backgroundColor.withOpacity(0.5),
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: AppPadding.p72, right: AppPadding.p34, top: AppPadding.p25, bottom: AppPadding.p26),
//                     child: Container(
//                       width: 75.w,
//                       height: 75.h
//                       ,
//                       decoration: BoxDecoration(
//                         color: backgroundColor.withOpacity(0.5),
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 50,
//                     // right: 10,
//                     child: SizedBox(
//                       width: 194.w,
//                       height: 129.h,
//                       child: Image.network(
//                         imageUrl,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//
//         ));
//   }
// }
//
// class CategoryItem extends StatelessWidget {
//   final String name;
//   final String count;
//
//   const CategoryItem(this.name, this.count, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//       const EdgeInsets.only(left: AppPadding.p31, right: AppPadding.p31),
//       child: Card(
//         child: ListTile(
//           title: Text(name, style: const TextStyle(fontSize: 16)),
//           trailing: Row(
//             children: [
//               Text('$count items', style: const TextStyle(color: Colors.grey)),
//               const SizedBox(
//                 width: 5,
//               ),
//               IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios))
//             ],
//           ),
//           onTap: () {},
//         ),
//       ),
//     );
//   }
// }