import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extentions/extentions.dart';
import '../../../../core/global/global.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/resources/values_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../../../profile/presentation/widgets/sidebar_home.dart';
import '../widgets/discover_listview_Item.dart';
import '../widgets/search_textfield_widget.dart';
import 'search_page.dart';


class DiscoverScreen extends StatefulWidget {

  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}
 TextEditingController searchController =TextEditingController();
class _DiscoverScreenState extends State<DiscoverScreen> {


  bool isClick = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: ColorsManger.white,
        drawer:const SidebarHomeScreen(),
        appBar: customAppBar(title: AppString.discoverAppBar, context: context, isBackable: false, haveActions: true),
        body: Column(
            children: [
          SearchTextFieldWidget(label: AppString.searchStr, controller: searchController,
            isReadOnly: true,
            onPressed: () {
              Global.analytics.logEvent(
                name: 'searchTextField clicked',
                parameters: {
                  'button_name': 'searchTextField',
                },
              );
              Global.buttonClicked( 'searchTextField clicked');

              context.pushNamed(const SearchPage());  }, onSubmit: (String value) {  }
            ,
           ),

          const Flexible(
            child: DiscoverListViewItem(),
          ),
        ]));
  }
}

