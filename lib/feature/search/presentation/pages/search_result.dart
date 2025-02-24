
import 'package:flutter/material.dart';
import '../../../../config/theme/themeData.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/values_manger.dart';

import '../../../../core/resources/strings_manger.dart';
import '../widgets/search_result_card.dart';

class SearchResult extends StatefulWidget {

  const SearchResult({super.key, });

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: ColorsManger.white,
      body: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p40,top: AppPadding.p18,bottom: AppPadding.p18),
                child: Text(AppString.foundSearch,style: appTheme().textTheme.labelLarge,),
              ),
              const Expanded(
                child:SearchResultCard() ,
              ),
            ]),
      ),
    );
  }
}


