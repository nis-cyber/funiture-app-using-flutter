import 'package:flutter/material.dart';
import 'package:furniture/Auth/firebase_auth_services.dart';
import 'package:furniture/pages/cart_page.dart';

class CartItem {
  final String title;
  final double price;
  final String imageUrl;
  final int quantity;

  CartItem({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });
}

class ProductDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  ProductDetailPage({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final List<CartItem> cartItems = [];

  double calculateTotalCost() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Image.asset(widget.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Price: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${widget.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Quantity: 1'),
                  SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Total Cost: \$${calculateTotalCost().toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black26,
        foregroundColor: Colors.red,
        onPressed: () async {
          CartItem newItem = CartItem(
            title: widget.title,
            price: widget.price,
            imageUrl: widget.imageUrl,
            quantity: 1,
          );

          setState(() {
            cartItems.add(newItem);
          });

          await FirebaseAuthService().bookMark(
            title: widget.title,
            description: widget.description,
            price: widget.price.toString(),
            imageUrl: widget.imageUrl,
            quantity: "1",
          );

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartPage()));
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
