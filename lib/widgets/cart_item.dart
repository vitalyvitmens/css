import 'package:css/models/cart_models.dart';
import 'package:css/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final dynamic cartData;
  final dynamic index;

  const CartItem({Key key, this.cartData, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ItemPage(
                productId: cartData.cartItems.keys.toList()[index],
              ),
            ),
          );
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image:
                  Image.asset(cartData.cartItems.values.toList()[index].image)
                      .image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        cartData.cartItems.values.toList()[index].title,
        style: TextStyle(
          color: Colors.blue[600],
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        'Цена: ${cartData.cartItems.values.toList()[index].price} руб',
        style: TextStyle(
          color: Colors.red[700],
          fontSize: 14.0,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.remove_circle_outline,
                color: Colors.white70,
                size: 28.0,
              ),
              onPressed: () {
                Provider.of<CartDataProvider>(context, listen: false)
                    .updateItemsSubOne(cartData.cartItems.keys.toList()[index]);
              }),
          Text(
            'x${cartData.cartItems.values.toList()[index].number}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15.0,
            ),
          ),
          IconButton(
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.white70,
                size: 28.0,
              ),
              onPressed: () {
                Provider.of<CartDataProvider>(context, listen: false)
                    .updateItemsAddOne(cartData.cartItems.keys.toList()[index]);
              }),
        ],
      ),
    );
  }
}
