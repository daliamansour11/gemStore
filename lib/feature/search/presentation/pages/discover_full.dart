import 'package:flutter/material.dart';
import 'package:gem_store/config/theme/themeData.dart';
import 'package:gem_store/core/extentions/extentions.dart';
import 'package:gem_store/core/resources/colors_manger.dart';
import 'package:gem_store/core/resources/strings_manger.dart';
import 'package:gem_store/core/resources/values_manger.dart';
import 'package:gem_store/feature/profile/presentation/pages/profile_screen.dart';
import 'package:gem_store/feature/search/presentation/pages/search_page.dart';

import '../../../../core/resources/font_manger.dart';

class DiscoverScreen extends StatelessWidget {
  List<String> categoryType = [
    "CLOTHING",
    "ACCESSORIES",
    "SHOES",
    "COLLECTION"
  ];
  List<String> categoryImage = [
    "https://s3-alpha-sig.figma.com/img/c793/6776/96d160379456b9e0b7274fcb6b4facc6?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=bfFI0IdIdmVgMgjP0DdS~Irk-YppivfhK~Bo~y3h2BhLpKFbfGvHEgbe8qWscfT51WWp2A5Y4u1uGSh379FATPOItoUlTP9Sd7fvE1qnWmy0lXqyMv8h9Fx8K~RjmExAixy~ez2lnX7jkGcvC4lzgfMok693v6GVwpAH0U3pyyPqhzsLYl5qGrANwRIl0n3eqzvXl2fQdSjT2CseR5uFJftvDEJIFQVyTAj-DuiV8jy5bQVJkq15cAbu0FWKFV43q5BIwg2~hQqUaMf7IYagoKC9Oh33wPF5sEAq5t1DqCRyBmp-PZf8QB4iJmGy9kzQczkQUz0CqJlcgsg2mH-d2Q__",
    "https://s3-alpha-sig.figma.com/img/b03a/5128/3ea25298d27460a3a2580d0e87ab3c5d?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kscLBfbgy~CB6c094R-Pdfy-FVqRuLuoO4lca3NKb8D0ioIrDLy8k5yrlC~FPN-iLWEUu7fE6o3hsNH44tPc25T64yR-dLr-QpnFglkj-fivARHrMcI-vK~npvvk8dRJh56pAD1mFxaEmjAHhERJfQlXqauItTUmjs8qlSgJH9IFaaSSAHNRjOF8LOT6JWMKCFkCXhUwg1Jq9DU01zbFYPpdzk7ZNKNPX2fw5DVjjgGcuEZfEf9dtkxe0W1QaVSBxv0w5LgVRz0yXVxRkt86y8kmeTjaE8aHmPT5p0U-zVOEVab8BDv4y7-HZWZJAlVnj4wXrm2juqXY10GDW4sIKQ__",
    "https://s3-alpha-sig.figma.com/img/3d3c/56ec/c5dd806b206d8595e4f1e074342375c1?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=rOcA7He~N7lvRmcpTSwck~rQsFfvVoBivek70s0r5s88g388BT6ddjuahqSBNX-v9L5ifNi8qppUXrgM89vRRmzhYEV47UvCEvxdfP~U0dudWbBcxpDcCZhizYw57~JttbXf~iNVegf7uSCqDrpPcs4-PvdeymkfgabYA3c7QDrlSPWR3RG1YdyNZc66HmT7W~wMMB2IXbxLC3a6mdZgOpkXmTjU7PbGAKUnMvWMalkvsmeVZI0IaMxKCQ-du4mqBd5C6aTmXACz6v0xpvoHgrNQxNBWiwlX5sF6hyj4eT7RTOPRupnHFjAy-UZr~CaivxismZCutI1XHDewKZXi~Q__",
    "https://s3-alpha-sig.figma.com/img/94e3/f60d/0bcca95f03fb944f30384d4c322d886e?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=F2evEQrm2Gzpod8WEyWFdiT5yhLxMHnQRcLtlurJbzmuiitPoVls~DN3K8cXc-z6AF91l-BP061LHnMSctBdLyMnlCjTkwrjro5OP7~m4hvLcB4~gpvOMyEtCDQVWVd~XbqKUNhrmRjo5qCx5M0QKzBp~GETFQvIav7UW-SXNR0sO~nft3flq8UnUDhQuhcWLa4k-~igR5kWM1bSJ3vV2GNo6lKaOKgFQtwl5Wv2Y8auD~Wjh3Ivy3MUVow3dEwgIZKPT09hllwyFnxX34sLs-GhJU-8tTS2JsIHGVMMMWnvVJOVwqQQMCp-YR6B3i-zDHMC-uIefAT39Xu40PNbIg__"
  ];
  List<Color> circleColor = [
    const Color(0xffC2C7B5),
    const Color(0xff9C9492),
    const Color(0xff5B7178),
    const Color(0xffD1CACD)
  ];
  bool isClick = false;
  final List<List<Map<String, dynamic>>> items = [
    [
      {"name": "Jackets", "count": 10},
      {"name": "T-Shirts", "count": 15},
      {"name": "Pants", "count": 8}
    ],
    [
      {"name": "Watches", "count": 5},
      {"name": "Necklaces", "count": 12},
      {"name": "Bracelets", "count": 7}
    ],
    [
      {"name": "Sneakers", "count": 20},
      {"name": "Boots", "count": 9},
      {"name": "Sandals", "count": 14}
    ],
    [
      {"name": "Limited Edition", "count": 4},
      {"name": "Vintage Collection", "count": 6}
    ]
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: ColorsManger.white,
        body: Column(children: [
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
                    decoration:const  InputDecoration(
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
                    readOnly: true,
                    onTap: () {
                      context.pushNamed(const SearchPage());
                    },
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
                      child: Image.asset(
                        "assets/icons/filter.png",
                      )),
                ),

                // Filter Icon
              ],
            ),
          ),
          Expanded(
              child: Expanded(
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
                                  offset: Offset(0, 1),

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
                                      style: TextStyle(color: Colors.grey)),
                                  Icon(Icons.arrow_forward_ios,
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
              )),
        ]));
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Color backgroundColor;

  CategoryCard(
      {required this.title,
        required this.imageUrl,
        required this.backgroundColor});

  cardColor(String categoryName) {
    switch (categoryName) {
      case "CLOTHING":
        return ColorsManger.category1Color;

      case "ACCESSORIES":
        return ColorsManger.category2Color;
      case "SHOES":
        return ColorsManger.category3Color;
      case "COLLECTION":
        return ColorsManger.category4Color;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          height: 126,
          // width: 336,
          decoration: BoxDecoration(
            color: cardColor(title),
            borderRadius: BorderRadius.circular(AppSize.s15),
          ),
          alignment: Alignment.centerLeft,
          // padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(  // Allow text to take available space
                child: Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p20, ),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    // overflow: TextOverflow.ellipsis,
                    // maxLines: 1,
                  ),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: AppPadding.p55, right: AppPadding.p20, top: AppPadding.p10, bottom: AppPadding.p11),
                    child: Container(
                      width: 105,
                      height: 105,
                      decoration: BoxDecoration(
                        color: backgroundColor.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: AppPadding.p72, right: AppPadding.p34, top: AppPadding.p25, bottom: AppPadding.p26),
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: backgroundColor.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    // right: 10,
                    child: Container(
                      width: 194,
                      height: 129,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain, // Makes sure image scales well
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),

        ));
  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final String count;

  CategoryItem(this.name, this.count);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: AppPadding.p31, right: AppPadding.p31),
      child: Card(
        child: ListTile(
          title: Text(name, style: TextStyle(fontSize: 16)),
          trailing: Row(
            children: [
              Text("$count items", style: TextStyle(color: Colors.grey)),
              SizedBox(
                width: 5,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios))
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
