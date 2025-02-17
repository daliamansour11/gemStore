import 'package:flutter/material.dart';

import '../../../../config/theme/themeData.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/values_manger.dart';
class DrawerFilter extends StatefulWidget {
  const DrawerFilter({super.key});

  @override
  State<DrawerFilter> createState() => _DrawerFilterState();
}
RangeValues _priceRange = RangeValues(10, 80);
Map<String, bool> _raceFilters = {
  'Sd': false,
  'Hf': false,
};
Color selectedColor = Colors.black;
int selectedStar = 5;
String selectedCategory = "Crop Tops"; // Default selected category
List<String> categories = ["Crop Tops", "Dresses", "T-Shirts", "Jeans", "Shoes"];
List<String> selectedDiscounts = ["50% off", "40% off", "30% off", "25% off"];
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
                Text("Filter",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
                Image.asset("assets/icons/filter.png")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27.0,right: 31,top: AppPadding.p55),
            child: Text("Price",style: appTheme().textTheme.titleMedium,),
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
            child: Text("Color",style: appTheme().textTheme.titleMedium,),
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
                          : null, // Add border if selected
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding:  EdgeInsets.only(left: AppPadding.p28,),
            child:  Text("Star Rating",style: appTheme().textTheme.titleMedium,),
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
                    width: 45, // Set width
                    height: 45, // Set height
                    margin: const EdgeInsets.only(right: 8), // Spacing between items
                    decoration: BoxDecoration(
                      color: isSelected ? ColorsManger.dark : Colors.white, // Background color
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
                              "$starValue",
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
            padding:  EdgeInsets.only(left: AppPadding.p28,top: AppPadding.p31),
            child:  Text("Category",style: appTheme().textTheme.titleMedium,),
          ),
          // **Dropdown Button Styled**
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
                  child: Text(category, style: TextStyle(fontSize: 16)),
                );
              }).toList(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, // Background color
                contentPadding: EdgeInsets.symmetric(horizontal:10, vertical: 12), // Padding inside box
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded border
                  borderSide: BorderSide(color: ColorsManger.grey.withOpacity(.78), width: 2), // Black border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: ColorsManger.grey.withOpacity(.78), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: ColorsManger.grey.withOpacity(.78), width: 2), // Black border
                ),
                prefixIcon: Image.asset("assets/icons/vector.png")
              ),

              icon: Icon(Icons.arrow_drop_down, color: Colors.black), // Dropdown arrow
              dropdownColor: Colors.white, // Background of dropdown items
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: AppPadding.p28),
              child:  Text("Discount", style: appTheme().textTheme.titleMedium,)),

          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p28,top: AppPadding.p16),
            child: Wrap(
              spacing: 8, // Space between chips
              runSpacing: 17, // Space between lines
              children: selectedDiscounts.map((discount) {
                return Container(
                  height: 38,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsManger.dark, width: 1), // Black border
                    borderRadius: BorderRadius.circular(20), // Rounded edges
                    color: Colors.white, // Background color
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(discount, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),

                      // **Remove Button (X)**
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDiscounts.remove(discount);
                          });
                        },
                        child: IconButton( onPressed: () {  }, icon: Icon(Icons.close, color: ColorsManger.dark, size: 14),),
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
                  padding: const EdgeInsets.only(left: 28.0),
                  child: TextButton(onPressed: () {}, child: const Text("Reset")),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 51.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Change button color
                    ),
                    child: const Text("Apply",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: ColorsManger.white),),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
