
import 'package:flutter/material.dart';
import 'package:gem_store/config/theme/themeData.dart';
import 'package:gem_store/core/extentions/extentions.dart';
import 'package:gem_store/core/resources/strings_manger.dart';
import 'package:gem_store/feature/search/presentation/pages/search_result.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/values_manger.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}
final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();

class _SearchPageState extends State<SearchPage> {

  TextEditingController searchController =TextEditingController();
  List<String> recentSearches = [];

  void _addSearchItem(String text) {
    if (text.isNotEmpty && !recentSearches.contains(text)) {
      setState(() {
        recentSearches.add(text);
      });
    }
    searchController.clear();   }

  void _removeSearchItem(int index) {
    setState(() {
      recentSearches.removeAt(index);
    });
  }

  void _clearAllSearches() {
    setState(() {
      recentSearches.clear();
    });
  }
  RangeValues _priceRange = RangeValues(10, 80);
  Map<String, bool> _raceFilters = {
    'Sd': false,
    'Hf': false,
  };
  Map<String, bool> _colorFilters = {
    'Red': false,
    'Blue': false,
    'Green': false,
  };
  Map<String, bool> _categoryFilters = {
    'Crop Tops': false,
    'T-Shirts': false,
    'Jeans': false,
  };
  Map<String, bool> _discountFilters = {
    '50% off': false,
    '40% off': false,
    '30% off': false,
    '25% off': false,
  };


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
     endDrawer: Drawer(
       child: Column(

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
             padding: const EdgeInsets.only(left: 27.0,right: 31),
             child: Text('Price', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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

         ],
       ),
     ),
        body: Column(
          children: [

            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,

                  child: Padding(
                    padding: const EdgeInsets.only(left: AppPadding.p33,top: AppPadding.p24,bottom: AppPadding.p22),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsManger.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            offset:const Offset(0, 1),

                            blurRadius: 1,

                          ),
                        ],
                      ),
                      child: Center(
                        child: IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back_ios,size: 15,),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: AppPadding.p32, right: AppPadding.p32),
              child: Row(
                children: [
                  Container(
                    width: screenWidth * .66,
                    height: screenHeight * 0.0575,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s15),
                      border: Border.all(
                        color: ColorsManger.lightWhiteColor,
                      ),
                      color: ColorsManger.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          offset: Offset(0, 1),

                          blurRadius: 1,

                        ),
                      ],
                    ),
                    child:  TextField(
                        controller:searchController ,
                        decoration:const InputDecoration(
                            hintText: "Search",
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

                        onSubmitted: (value){
                          value =searchController.text;
                          _addSearchItem(searchController.text);
                        }

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 11,
                      bottom: 11,
                      left: 12,
                    ),
                    child: Container(
                        width: screenWidth * 0.128,
                        height: screenHeight * 0.06,
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
                              offset: Offset(0, 1),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Builder(
                          builder: (context) {
                            return InkWell(
                              onTap: (){
                                // _scaffoldKey.currentState!.openDrawer();

                                Scaffold.of(context).openEndDrawer();
                              },
                              child: Image.asset(
                                "assets/icons/filter.png",
                              ),
                            );
                          }
                        )),
                  ),

                  // Filter Icon
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p28,bottom: AppPadding.p28,left: AppPadding.p33),
                  child: Text(AppString.recnt_searches,style: appTheme().textTheme.titleLarge,),
                ),
                // if (recentSearches.isNotEmpty)
                Padding(padding:const EdgeInsets.only(top: AppPadding.p28,bottom: AppPadding.p28,right: AppPadding.p28,),

                  child: InkWell(child: Image.asset("assets/icons/Trash.png",),
                    onTap: (){
                      _clearAllSearches();
                    },)

                  ,)
              ],

            ),
            // SizedBox(height: 10,),
            Wrap(
              spacing: 15,
              runSpacing: 18,
              children:
              recentSearches.map((search) {
                return  _buildSearchHistoryChip(search);
              }).toList(),
            ),

            SizedBox(height: 10,),

            Expanded(child:           SearchResult()
            )    ],
        )
    );
  }

  Widget _buildSearchHistoryChip(String text) {
    int index=0;
    return Container(
        width: 163,
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsManger.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              offset: Offset(0, 1),
              blurRadius: 1,

            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppPadding.p8,bottom: AppPadding.p8,left: AppPadding.p22,right: AppPadding.p21),
              child: Text(text,style: TextStyle(color: ColorsManger.rentSearchColors.withOpacity(0.7),fontSize: 16,fontWeight: FontWeight.w600,fontFamily: FontConstants.NunitoFamily),
              ),
            ),

            IconButton(onPressed: (){
              _removeSearchItem(index);

            }, icon: Icon(Icons.clear,color: ColorsManger.lightGrey,))


          ],
        )
    );
  }
}
