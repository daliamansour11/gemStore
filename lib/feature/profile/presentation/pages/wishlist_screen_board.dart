import 'package:flutter/material.dart';

import '../widgets/sidebar_home.dart';

class WishlistScreenBoards extends StatefulWidget {
  // TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.

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
                    child: Image.network(
                      // TODO: Cache the image.
                      'https://s3-alpha-sig.figma.com/img/3d3c/56ec/c5dd806b206d8595e4f1e074342375c1?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=rOcA7He~N7lvRmcpTSwck~rQsFfvVoBivek70s0r5s88g388BT6ddjuahqSBNX-v9L5ifNi8qppUXrgM89vRRmzhYEV47UvCEvxdfP~U0dudWbBcxpDcCZhizYw57~JttbXf~iNVegf7uSCqDrpPcs4-PvdeymkfgabYA3c7QDrlSPWR3RG1YdyNZc66HmT7W~wMMB2IXbxLC3a6mdZgOpkXmTjU7PbGAKUnMvWMalkvsmeVZI0IaMxKCQ-du4mqBd5C6aTmXACz6v0xpvoHgrNQxNBWiwlX5sF6hyj4eT7RTOPRupnHFjAy-UZr~CaivxismZCutI1XHDewKZXi~Q__',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 106,
                  height: 149,
                  child: ClipRRect(
                    child: Image.network(
                      'https://s3-alpha-sig.figma.com/img/3d3c/56ec/c5dd806b206d8595e4f1e074342375c1?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=rOcA7He~N7lvRmcpTSwck~rQsFfvVoBivek70s0r5s88g388BT6ddjuahqSBNX-v9L5ifNi8qppUXrgM89vRRmzhYEV47UvCEvxdfP~U0dudWbBcxpDcCZhizYw57~JttbXf~iNVegf7uSCqDrpPcs4-PvdeymkfgabYA3c7QDrlSPWR3RG1YdyNZc66HmT7W~wMMB2IXbxLC3a6mdZgOpkXmTjU7PbGAKUnMvWMalkvsmeVZI0IaMxKCQ-du4mqBd5C6aTmXACz6v0xpvoHgrNQxNBWiwlX5sF6hyj4eT7RTOPRupnHFjAy-UZr~CaivxismZCutI1XHDewKZXi~Q__',
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
                          child: Image.network(
                            'https://s3-alpha-sig.figma.com/img/b03a/5128/3ea25298d27460a3a2580d0e87ab3c5d?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kscLBfbgy~CB6c094R-Pdfy-FVqRuLuoO4lca3NKb8D0ioIrDLy8k5yrlC~FPN-iLWEUu7fE6o3hsNH44tPc25T64yR-dLr-QpnFglkj-fivARHrMcI-vK~npvvk8dRJh56pAD1mFxaEmjAHhERJfQlXqauItTUmjs8qlSgJH9IFaaSSAHNRjOF8LOT6JWMKCFkCXhUwg1Jq9DU01zbFYPpdzk7ZNKNPX2fw5DVjjgGcuEZfEf9dtkxe0W1QaVSBxv0w5LgVRz0yXVxRkt86y8kmeTjaE8aHmPT5p0U-zVOEVab8BDv4y7-HZWZJAlVnj4wXrm2juqXY10GDW4sIKQ__',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 53,
                        height: 59,
                        child: ClipRRect(
                          child: Image.network(
                            'https://s3-alpha-sig.figma.com/img/b03a/5128/3ea25298d27460a3a2580d0e87ab3c5d?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kscLBfbgy~CB6c094R-Pdfy-FVqRuLuoO4lca3NKb8D0ioIrDLy8k5yrlC~FPN-iLWEUu7fE6o3hsNH44tPc25T64yR-dLr-QpnFglkj-fivARHrMcI-vK~npvvk8dRJh56pAD1mFxaEmjAHhERJfQlXqauItTUmjs8qlSgJH9IFaaSSAHNRjOF8LOT6JWMKCFkCXhUwg1Jq9DU01zbFYPpdzk7ZNKNPX2fw5DVjjgGcuEZfEf9dtkxe0W1QaVSBxv0w5LgVRz0yXVxRkt86y8kmeTjaE8aHmPT5p0U-zVOEVab8BDv4y7-HZWZJAlVnj4wXrm2juqXY10GDW4sIKQ__',
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
                          child: Image.network(
                            'https://s3-alpha-sig.figma.com/img/b03a/5128/3ea25298d27460a3a2580d0e87ab3c5d?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kscLBfbgy~CB6c094R-Pdfy-FVqRuLuoO4lca3NKb8D0ioIrDLy8k5yrlC~FPN-iLWEUu7fE6o3hsNH44tPc25T64yR-dLr-QpnFglkj-fivARHrMcI-vK~npvvk8dRJh56pAD1mFxaEmjAHhERJfQlXqauItTUmjs8qlSgJH9IFaaSSAHNRjOF8LOT6JWMKCFkCXhUwg1Jq9DU01zbFYPpdzk7ZNKNPX2fw5DVjjgGcuEZfEf9dtkxe0W1QaVSBxv0w5LgVRz0yXVxRkt86y8kmeTjaE8aHmPT5p0U-zVOEVab8BDv4y7-HZWZJAlVnj4wXrm2juqXY10GDW4sIKQ__',
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
                          child: Image.network(
                            'https://s3-alpha-sig.figma.com/img/b03a/5128/3ea25298d27460a3a2580d0e87ab3c5d?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kscLBfbgy~CB6c094R-Pdfy-FVqRuLuoO4lca3NKb8D0ioIrDLy8k5yrlC~FPN-iLWEUu7fE6o3hsNH44tPc25T64yR-dLr-QpnFglkj-fivARHrMcI-vK~npvvk8dRJh56pAD1mFxaEmjAHhERJfQlXqauItTUmjs8qlSgJH9IFaaSSAHNRjOF8LOT6JWMKCFkCXhUwg1Jq9DU01zbFYPpdzk7ZNKNPX2fw5DVjjgGcuEZfEf9dtkxe0W1QaVSBxv0w5LgVRz0yXVxRkt86y8kmeTjaE8aHmPT5p0U-zVOEVab8BDv4y7-HZWZJAlVnj4wXrm2juqXY10GDW4sIKQ__',
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
                'Going out outfits',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              subtitle: Text('36 items', style: TextStyle(color: Colors.grey)),
            ),
          ),
        ),
      ],
    );
  }
}
