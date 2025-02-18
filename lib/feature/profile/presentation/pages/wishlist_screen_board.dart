

import 'package:flutter/material.dart';

import '../widgets/sidebar_home.dart';

class WishlistScreenBoards extends StatefulWidget {
  const WishlistScreenBoards({super.key});

  @override
  State<WishlistScreenBoards> createState() => _WishlistScreenBoardsState();
}

class _WishlistScreenBoardsState extends State<WishlistScreenBoards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SidebarHomeScreen(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "My Wishlist",
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
        body: ListView(
          children: const [
            WishlistItemCard(),
            WishlistItemCard(),
            WishlistItemCard(),
          ],
        ));
  }
}


class WishlistItemCard extends StatelessWidget {
  const WishlistItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 106,
                  height: 149,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: Image.asset(
                      "assets/images/تنزيل (2).jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 106,
                  height: 149,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/تنزيل (2).jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 149,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 53,
                        height: 85,
                        child: ClipRRect(
                          child: Image.asset(
                            "assets/images/تنزيل (2).jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 53,
                        height: 59,
                        child: ClipRRect(
                          child: Image.asset(
                            "assets/images/تنزيل (2).jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 149,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 53,
                        height: 59,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                          ),
                          child: Image.asset(
                            "assets/images/تنزيل (2).jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 53,
                        height: 85,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8)),
                          child: Image.asset(
                            "assets/images/تنزيل (2).jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Card(
            color: Colors.white,
            child: ListTile(
              title: Text(
                "Going out outfits",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              subtitle: Text("36 items", style: TextStyle(color: Colors.grey)),
            ),
          ),
        ),
      ],
    );
  }
}