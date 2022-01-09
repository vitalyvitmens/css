import 'package:css/models/cart_models.dart';
import 'package:css/models/product_models.dart';
import 'package:css/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  final String productId;
  const ItemPage({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ProductDataProvider>(context).getElementById(productId);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          data.title,
          style: GoogleFonts.marmelad(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: data.image,
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(data.image).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Card(
            elevation: 5.0,
            margin:
                const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
            child: Container(
              color: Colors.grey[900],
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Text(
                    data.title,
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 22.0,
                    ),
                  ),
                  const Divider(),
                  Row(
                    children: <Widget>[
                      Text(
                        'Цена: ',
                        style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        '${data.price} руб',
                        style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.amberAccent[700],
                  ),
                  Text(
                    data.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Provider.of<CartDataProvider>(context)
                          .cartItems
                          .containsKey(productId)
                      ? Column(
                          children: <Widget>[
                            MaterialButton(
                              color: Colors.white70,
                              child: const Text(
                                'Перейти в корзину',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const CartPage(),
                                  ),
                                );
                              },
                            ),
                            Text(
                              'Товар в корзине',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.red[700],
                              ),
                            )
                          ],
                        )
                      : MaterialButton(
                          color: Colors.blueAccent,
                          child: const Text(
                            'Добавить в корзину',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Provider.of<CartDataProvider>(context,
                                    listen: false)
                                .addItem(
                              productId: data.id,
                              image: data.image,
                              title: data.title,
                              price: data.price,
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
