import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/extentions.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/values_manger.dart';
import '../pages/search_page.dart';
class SearchTextFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isReadOnly;
  VoidCallback onPressed;
  
   SearchTextFieldWidget({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isReadOnly = false,
    required this.onPressed,
    super.key,
  });

  @override
  _SearchTextFieldWidgetState createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  Color asteriskColor = ColorsManger.green;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding:
        const EdgeInsets.only(left: AppPadding.p32, right: AppPadding.p32),
        child: Row(
          children: [
            Container(
              width: 246.w,
              height: 46.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s15),
                border: Border.all(
                  color: ColorsManger.lightWhiteColor,
                ),
                color: ColorsManger.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    offset: const Offset(0, 1),
                    blurRadius: 1,
                  ),
                ],
              ),
              child: TextField(
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                decoration: const InputDecoration(
                    hintText: 'Search',
                    
                    hintStyle: TextStyle(
                      fontSize: 14,
                      // Font size
                      fontWeight: FontWeightManger.medium,
                      // Medium weight
                      color: ColorsManger.searchIconColor,
                      fontFamily: FontConstants.fontFamily,
                      //Italic hint text
                    ),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: AppPadding.p18),
                      child: Icon(
                        Icons.search,
                        size: AppSize.s18,
                        color: ColorsManger.searchIconColor,
                      ),
                    )),
                readOnly: widget.isReadOnly,
                onTap:widget.onPressed
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 11,
                bottom: 11,
                left: 12,
              ),
              child: GestureDetector(
                child: Container(
                    width: 51.w,
                    height: 49.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: ColorsManger.lightWhiteColor,
                      ),
                      color: ColorsManger.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          // Equivalent to #00000026
                          offset: const Offset(0, 1),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Scaffold.of(context).openEndDrawer();

                      },
                      child: Image.asset(
                        'assets/icons/filter.png',
                      ),
                    )),
              ),
            ),

            // Filter Icon
          ],
        ),
      )
    ]);
  }
}




// class SearchTextFieldWidget extends StatelessWidget {
//   SearchTextFieldWidget({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Padding(
//         padding:
//         const EdgeInsets.only(left: AppPadding.p32, right: AppPadding.p32),
//         child: Row(
//           children: [
//             Container(
//               width: 246.w,
//               height: 46.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(AppSize.s15),
//                 border: Border.all(
//                   color: ColorsManger.lightWhiteColor,
//                 ),
//                 color: ColorsManger.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.9),
//                     offset: const Offset(0, 1),
//                     blurRadius: 1,
//                   ),
//                 ],
//               ),
//               child: TextField(
//                 decoration: const InputDecoration(
//                     hintText: 'Search',
//                     hintStyle: TextStyle(
//                       fontSize: 14,
//                       // Font size
//                       fontWeight: FontWeightManger.medium,
//                       // Medium weight
//                       color: ColorsManger.searchIconColor,
//                       fontFamily: FontConstants.fontFamily,
//                       //Italic hint text
//                     ),
//                     border: InputBorder.none,
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: AppPadding.p18),
//                       child: Icon(
//                         Icons.search,
//                         size: AppSize.s18,
//                         color: ColorsManger.searchIconColor,
//                       ),
//                     )),
//                 readOnly: true,
//                 onTap: () {
//                   context.pushNamed(const SearchPage());
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 top: 11,
//                 bottom: 11,
//                 left: 12,
//               ),
//               child: GestureDetector(
//                 child: Container(
//                     width: 51.w,
//                     height: 49.h,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(
//                         color: ColorsManger.lightWhiteColor,
//                       ),
//                       color: ColorsManger.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.9),
//                           // Equivalent to #00000026
//                           offset: const Offset(0, 1),
//                           blurRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: GestureDetector(
//                       onTap: (){
//                         Scaffold.of(context).openEndDrawer();
//
//                       },
//                       child: Image.asset(
//                         'assets/icons/filter.png',
//                       ),
//                     )),
//               ),
//             ),
//
//             // Filter Icon
//           ],
//         ),
//       )
//     ]);
//   }
// }
