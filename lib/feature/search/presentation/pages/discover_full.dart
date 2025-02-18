import 'package:flutter/material.dart';
import '../../../../config/theme/themeData.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/resources/values_manger.dart';
import '../../../profile/presentation/widgets/sidebar_home.dart';
import '../widgets/category_card.dart';
import '../widgets/search_textFieldWidget.dart';


class DiscoverScreen extends StatefulWidget {

  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {


  bool isClick = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: ColorsManger.white,
        drawer:const SidebarHomeScreen(),
        appBar: AppBar(
          backgroundColor: ColorsManger.white,
          leading:  InkWell(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset('assets/icons/menu.png',)),
          // assets/icons/menu.png'
          title: Text(AppString.discover_str,
            style: appTheme().textTheme.bodyLarge,
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding:  EdgeInsets.only(right: 32.0),
              child: ImageIcon(
                AssetImage('assets/icons/Bell_pin.png'), // For PNG icons
                size: 24,
              ),
            ),
          ],
        ),
        body: Column(children: [
           SearchTextFieldWidget(),
          Expanded(
            child: Center(
              child: ListView.builder(
                itemCount: categoryType.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: AppPadding.p3),
                    child: ExpansionTile(
                      title: CategoryCard(
                        title: categoryType[index],
                        backgroundColor: circleColor[index],
                        imageUrl: categoryImage[index],
                      ),
                      trailing: const SizedBox.shrink(),
                      children: items[index]
                          .map((item) => Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p18,right: AppPadding.p18,bottom: AppPadding.p10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),

                            color: ColorsManger.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.9),
                                offset: const Offset(0, 1),

                                blurRadius: 1,

                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text("${item['name']}"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("${item['count']} items",
                                    style: const TextStyle(color: Colors.grey)),
                                const Icon(Icons.arrow_forward_ios,
                                    size: 10, color: ColorsManger.dark),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ),
                      ))
                          .toList(),
                    ),
                  );
                },
              ),
            ),
          ),
        ]));
  }
}


