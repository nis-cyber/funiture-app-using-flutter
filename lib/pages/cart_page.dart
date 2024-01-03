import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture/Auth/firebase_auth_services.dart';

class showCart extends StatefulWidget {
  final snap;
  const showCart({super.key, required this.snap});

  @override
  State<showCart> createState() => _showCartState();
}

class _showCartState extends State<showCart> {
  TextEditingController quantity = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // AppBarWidget(),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 10,
                bottom: 10,
              ),
              child: Text(
                " Order List",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 9),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        widget.snap['imgUrl'],
                        height: 80,
                        width: 150,
                      ),
                    ),
                    Container(
                      // height: 420,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.snap['title'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Stock : ${widget.snap['quantity']}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Edit"),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: TextFormField(
                                        controller: quantity,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          hintText:
                                              "How much quantity do you want ? : ",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () async {
                                              String res =
                                                  await FirebaseAuthService()
                                                      .newQuantity(
                                                          productId:
                                                              widget.snap[
                                                                  'productId'],
                                                          quantity:
                                                              quantity.text);

                                              if (res == 'success') {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Quantity succesfully updated")));
                                              }
                                            },
                                            child: const Text("Update")),
                                        const SizedBox(
                                          width: 55,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Cancel")),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            child: const Text("Edit")),
                        IconButton(
                          onPressed: () async {
                            await deleteDialog(context);
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.black,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(
                          widget.snap['price'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  deleteDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete"),
          content: Text("Are you sure you want to delete the selected item? "),
          actions: [
            TextButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('cart')
                      .doc(widget.snap['productId'])
                      .delete();
                  Navigator.pop(context);
                },
                child: Text("Yes")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No"))
          ],
        );
      },
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('cart').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return showCart(
                      snap: snapshot.data!.docs[index].data(),
                    );
                  },
                );

              default:
                return const CircularProgressIndicator();
            }
          }),

      // drawer: const DrawerWidget(),
      // bottomNavigationBar: const CartBottomNavBar(),
    );
  }
}

class AppBarWidget {}
