import 'package:flutter/material.dart';

import '../../../../config/theme/theme_data.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/resources/values_manger.dart';
class DrawerFilter extends StatefulWidget {
  const DrawerFilter({super.key});

  @override
  State<DrawerFilter> createState() => _DrawerFilterState();
}
RangeValues _priceRange = const RangeValues(10, 80);

Color selectedColor = Colors.black;
int selectedStar = 5;
String selectedCategory = 'Crop Tops';
List<String> categories = ['Crop Tops', 'Dresses', 'T-Shirts', 'Jeans', 'Shoes'];
List<String> selectedDiscounts = ['50% off', '40% off', '30% off', '25% off'];
class _DrawerFilterState extends State<DrawerFilter> {
  @override
  Widget build(BuildContext context) {

    return Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 27.0,right: 31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(AppString.filterStr,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
                Image.asset(ImageAssets.filterIcon)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27.0,right: 31,top: AppPadding.p55),
            child: Text(AppString.priceStr,style: appTheme().textTheme.titleMedium,),
          ),


          RangeSlider(
            values: _priceRange,
            min: 10,
            max: 80,
            divisions: 7,
            labels: RangeLabels('${_priceRange.start}', '${_priceRange.end}'),
            onChanged: (RangeValues values) {
              setState(() {
                _priceRange = values;
              });
            },

          ),

          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p28,top: AppPadding.p40,bottom: AppPadding.p24),
            child: Text(AppString.colorStr,style: appTheme().textTheme.titleMedium,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p28,),
            child: Wrap(
              spacing: 12,
              children: colors.map((color) {
                bool isSelected = selectedColor == color;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      border: isSelected
                          ? Border.all(color: Colors.black, width: 3)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding:  const EdgeInsets.only(left: AppPadding.p28,),
            child:  Text(AppString.starRatingStr,style: appTheme().textTheme.titleMedium,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p28,top: AppPadding.p24),
            child:      Row(
              children: List.generate(5, (index) {
                int starValue = index + 1;
                bool isSelected = selectedStar == starValue;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedStar = starValue;
                    });
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? ColorsManger.dark : Colors.white,
                      shape: BoxShape.circle,

                      border: Border.all(
                        color: ColorsManger.rentSearchColors,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Row(
                          children:[

                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Icon(Icons.star, color: isSelected?ColorsManger.white:ColorsManger.dark, size: 10),
                            ),
                            Text(
                              '$starValue',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),

                          ]),
                    ),
                  ),
                );
              }),
            ),

          ),
          Padding(
            padding:  const EdgeInsets.only(left: AppPadding.p28,top: AppPadding.p31),
            child:  Text(AppString.categoryStr,style: appTheme().textTheme.titleMedium,),
          ),
          Padding(

            padding: const  EdgeInsets.symmetric(horizontal: AppPadding.p28,vertical: 15),
            child: DropdownButtonFormField<String>(
              value: selectedCategory,

              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category, style: const TextStyle(fontSize: 16)),
                );
              }).toList(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal:10, vertical: 12),
                prefixIcon: Image.asset(ImageAssets.vectorIcon)
              ),

              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              dropdownColor: Colors.white,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: AppPadding.p28),
              child:  Text(AppString.discountStr, style: appTheme().textTheme.titleMedium,)),

          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p28,top: AppPadding.p16),
            child: Wrap(
              spacing: 8,
              runSpacing: 17,
              children: selectedDiscounts.map((discount) {
                return Container(
                  height: 38,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsManger.dark, width: 1),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(discount, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDiscounts.remove(discount);
                          });
                        },
                        child: IconButton( onPressed: () {  }, icon: const Icon(Icons.close, color: ColorsManger.dark, size: FontSize.s14),),
                      ),
                    ],
                  ),
                 );
              }).toList(),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p55,bottom: AppPadding.p40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p28),
                  child: TextButton(onPressed: () {}, child: const Text(AppString.resetBtn)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p51),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(AppString.applyBtn,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: ColorsManger.white),),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
