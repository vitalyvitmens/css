import 'package:css/models/cart_models.dart';
import 'package:css/models/product_models.dart';
import 'package:css/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Container(
      width: 160,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(int.parse(product.color)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ItemPage(productId: product.id)),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: Image.asset(product.image).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[700],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${product.price} руб',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white70,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.white70,
                  size: 32,
                ),
                onPressed: () {
                  Provider.of<CartDataProvider>(context, listen: false).addItem(
                    productId: product.id,
                    price: product.price,
                    title: product.title,
                    image: product.image,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
