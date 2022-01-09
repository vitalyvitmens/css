import 'package:css/models/cart_models.dart';
import 'package:css/widgets/cart_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Ваша корзина ',
          style: TextStyle(fontSize: 26, color: Colors.white70),
        ),
      ),
      body: cartData.cartItems.isEmpty
          ? Card(
              elevation: 5.0,
              margin: const EdgeInsets.all(30.0),
              child: Container(
                color: Colors.blue[600],
                height: 100,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Корзина пуста',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.red[900],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          : Column(
              children: <Widget>[
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Стоимость: ' +
                          cartData.totalAmount.toStringAsFixed(2) +
                          ' руб',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.amberAccent[700],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        cartData.clear();
                      },
                      color: Colors.amberAccent[700],
                      child: Text(
                        'Купить',
                        style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.amberAccent[700],
                ),
                Expanded(
                  child: CartItemList(
                    cartData: cartData,
                  ),
                ),
              ],
            ),
    );
  }
}
