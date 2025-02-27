
import 'package:flutter/material.dart';


import '../../../../config/theme/theme_data.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/values_manger.dart';
import 'category_card.dart';
class DiscoverListViewItem extends StatefulWidget {
  const DiscoverListViewItem({super.key});

  @override
  State<DiscoverListViewItem> createState() => _DiscoverListViewItemState();
}

class _DiscoverListViewItemState extends State<DiscoverListViewItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                  title: Text("${item['name']}",style: appTheme().textTheme.titleMedium,),

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
    );
  }
}
