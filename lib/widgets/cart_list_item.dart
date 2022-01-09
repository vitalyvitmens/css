import 'package:css/models/cart_models.dart';
import 'package:css/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemList extends StatelessWidget {
  final dynamic cartData;

  const CartItemList({Key key, this.cartData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartData.cartItemsCount,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(cartData.cartItems.keys.toList()[index]),
          background: Container(
            child: Icon(
              Icons.delete,
              color: Colors.red[500],
              size: 30.0,
            ),
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            padding: const EdgeInsets.only(right: 10.0),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) =>
              Provider.of<CartDataProvider>(context, listen: false)
                  .deleteItem(cartData.cartItems.keys.toList()[index]),
          child: CartItem(
            cartData: cartData,
            index: index,
          ),
        );
      },
    );
  }
}
