import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/values_manger.dart';

class SearchTextFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isReadOnly;
  VoidCallback onPressed;
  final Function(String) onSubmit;

  SearchTextFieldWidget({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isReadOnly = false,
    required this.onPressed,
    super.key,
    required this.onSubmit,
  });

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  Color asteriskColor = ColorsManger.green;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding:
            const EdgeInsets.only(left: AppPadding.p18, right: AppPadding.p18),
        child: SizedBox(
          width: 312.w,
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
                  onSubmitted: widget.onSubmit,

                  decoration: InputDecoration(

                      hintText: widget.label,
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeightManger.medium,
                        color: ColorsManger.searchIconColor,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 13),
                      alignLabelWithHint: true,
                      prefixIcon:  Padding(
                        padding:const EdgeInsets.only(left: AppPadding.p18),
                        child:Image.asset(ImageAssets.searchIcon)
                      )),
                  readOnly: widget.isReadOnly,
                  onTap: widget.onPressed,

                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 11,
                  bottom: 11,
                  left: 15,
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
                            offset: const Offset(0, 1),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Image.asset(
                          ImageAssets.filterIcon,
                        ),
                      )),
                ),
              ),

              // Filter Icon
            ],
          ),
        ),
      )
    ]);
  }
}
