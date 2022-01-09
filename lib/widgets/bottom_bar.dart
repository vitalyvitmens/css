import 'package:css/models/cart_models.dart';
import 'package:css/pages/cart_page.dart';
import 'package:css/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);
    final cartItems = cartData.cartItems;

    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.blue[700],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 + 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cartItems.length,
                itemBuilder: (context, index) => Hero(
                  tag: cartItems.values.toList()[index].image,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ItemPage(
                            productId: cartData.cartItems.keys.toList()[index],
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 35,
                          height: 35,
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 4.0,
                                spreadRadius: 5.0,
                                offset: Offset(-2, 2),
                              ),
                            ],
                            image: DecorationImage(
                              image: Image.asset(
                                      cartItems.values.toList()[index].image)
                                  .image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 5,
                          child: Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.green[900],
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              '${cartItems.values.toList()[index].number}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 - 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    cartData.totalAmount.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white70,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart,
                        color: Color(0xFF535353)),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
