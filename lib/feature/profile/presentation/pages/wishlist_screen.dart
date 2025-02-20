import 'package:flutter/material.dart';
import '../../../../core/resources/colors_manger.dart';

import '../widgets/sidebar_home.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  // TODO: Create a model, generate a list of model data, and use it here.
  // TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.
  // TODO: It’s best to avoid passing more than two arguments or variables. Instead, create a model to group them and pass the model.
  //  TODO: Avoid using List.generate. Research how it works to understand why.
  List<Map<String, dynamic>> wishlistItems = List.generate(
      10,
      (index) => {
            'image':
                'https://s3-alpha-sig.figma.com/img/277a/304a/44849c4e605ccf87ec37092bf51698d0?Expires=1740960000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=LTsWfxaVDKsuerLC9HOhiX-pJlHbXwe5FOQ7oMNnENGGXkaJOq1HsQSJ021W2ALhjB24cBGF0oHOpjeG1aWDKj--qEsFL~UCsLhcQzozlya8CsbnI~PEX~pSmPzIfutjeCBxq~8haMYLWDUftrlH8BAxgW09ZyXg4kHta63Ewm6lhvciNIbN5cOMFLm9vy10gMuZOVmcCNvhVMVwlD1QGon3IhLv1~KDnD499BGyPwoJ48yojC4JkurQatUpvq34omcO6XscZRucTbIZ0aO7LdMjXV83KOdLzQQS0-M5KDD0TnGSjJobzc7h01mYLeDyZnIkL-XBj9WkMyEGE3v3dw__',
            'name': 'Product $index',
            'price': '\$${(index + 1) * 20}.00',
            'oldPrice': index % 2 == 0 ? '\$${(index + 1) * 30}.00' : null,
            'rating': (4.0 + (index % 5) * 0.2),
            'reviews': (30 + index * 5),
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarHomeScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Wishlist',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(right: 25),
              child: Icon(Icons.notifications_none_outlined,
                  color: Colors.black, size: 30),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: wishlistItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.52,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            final item = wishlistItems[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item['image'],
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Positioned(
                          top: 12,
                          right: 10,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              item['price'],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            if (item['oldPrice'] != null)
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  item['oldPrice'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: ColorsManger.ratingColor, size: 15),
                            const Icon(Icons.star,
                                color: ColorsManger.ratingColor, size: 15),
                            const Icon(Icons.star,
                                color: ColorsManger.ratingColor, size: 15),
                            const Icon(Icons.star,
                                color: ColorsManger.ratingColor, size: 15),
                            const Icon(Icons.star_border_outlined,
                                color: ColorsManger.ratingColor, size: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                "${item["rating"]} (${item["reviews"]})",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
