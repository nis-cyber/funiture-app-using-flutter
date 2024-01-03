import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture/features/user_auth/presentation/pages/login_page.dart';
import 'package:furniture/pages/cart_page.dart';
import 'package:furniture/pages/product_detail.dart';
import 'package:furniture/widgets/drawer_page.dart';
import 'package:furniture/widgets/recomended_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: DrawerWidget(),
      // You can add your drawer content here
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 25
          ),
        ),
        actions: [
          const Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.search, size: 17, color: Colors.black),
                radius: 11,
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 11,
                backgroundColor: Colors.white,
                child: Icon(Icons.shop, size: 17, color: Colors.black),
              ),
              SizedBox(width: 10),
              // Add more CircleAvatar widgets here for additional actions
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Column(
              children: [
                Image.asset("assets/sale.jpeg"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Arrival",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                title: 'table',
                                description:
                                    "A table is an item of furniture with a raised flat top and is supported most commonly by 1 or 4 legs (although some can have more), used as a surface for working at, eating from or on which to place things.",
                                imageUrl: "assets/table.png",
                                price: 200,
                              ),
                            ));
                          },
                          child: Image.asset("assets/table.png"),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Expanded(child: Image.asset("assets/sofa1.png"))
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/Stool.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      // Container(
                      //   height: 120,
                      //   width: 100,
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: Column(
                      //     children: [
                      //       Expanded(child: Image.asset("assets/chair2.jpg",fit: BoxFit.cover,))
                      //     ],
                      //   ),
                      // ),
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/chair2.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View All",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 180,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            Image.asset("assets/Daraz.jpg", fit: BoxFit.fill),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 180,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/Dhal.jpg",
                            fit: BoxFit.fitWidth),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 180,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                child: Image.asset(
                              "assets/Osofa.jpg",
                              fit: BoxFit.fill,
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View All",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                RecomendedWidget(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black26,
        foregroundColor: Colors.red,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartPage()));
          // Add your action here
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
