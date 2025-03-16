
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import '../../../../core/global/global.dart';
import '../widgets/build_search_history_chip.dart';
import 'search_result.dart';

import '../../../../core/resources/colors_manger.dart';

import '../widgets/drawer_filter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {

    Global.logScreenView('SearchPage', 'SearchPage');

    return const Scaffold(
      backgroundColor: ColorsManger.white,
        endDrawer: Drawer(
            child: SingleChildScrollView(
                child:DrawerFilter()
            )),
        body: Column(
          children: [

            BuildSearchHistoryChip(),

            SizedBox(height: 10,),
    // Expanded(child: SearchResult()
    // )
          ],));
  }
}
