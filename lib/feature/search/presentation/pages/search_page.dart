
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/theme/themeData.dart';
import '../../../../core/resources/strings_manger.dart';
import '../widgets/search_textFieldWidget.dart';
import 'search_result.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/values_manger.dart';
import '../widgets/drawer_filter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

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


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorsManger.white,
     endDrawer: const Drawer(

       child: SingleChildScrollView(

         child:DrawerFilter()
       )),


        body: Column(

          children: [

            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,

                  child: Padding(
                    padding: const EdgeInsets.only(left: AppPadding.p33,top: AppPadding.p59,bottom: AppPadding.p22),
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
                        }, icon: const Icon(Icons.arrow_back_ios,size: 15,),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
           const SearchTextField(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p28,bottom: AppPadding.p28,left: AppPadding.p33),
                  child: Text(AppString.recnt_searches,style: appTheme().textTheme.titleLarge,),
                ),
                // if (recentSearches.isNotEmpty)
                Padding(padding:const EdgeInsets.only(top: AppPadding.p28,bottom: AppPadding.p28,right: AppPadding.p28,),

                  child: InkWell(child: Image.asset('assets/icons/Trash.png',),
                    onTap: (){
                      _clearAllSearches();
                    },)

                  ,)
              ],

            ),
            Wrap(
              spacing: 15,
              runSpacing: 18,
              children:
              recentSearches.map((search) {
                return  _buildSearchHistoryChip(search);
              }).toList(),
            ),

            const SizedBox(height: 10,),

            const Expanded(child:  SearchResult()
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
              offset: const Offset(0, 1),
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

            }, icon: const Icon(Icons.clear,color: ColorsManger.lightGrey,))


          ],
        )
    );
  }}

class SearchTextField extends StatelessWidget{
  const SearchTextField({super.key});

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
               onTap: () {
               },
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
