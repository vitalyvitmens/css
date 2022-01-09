import 'package:css/models/product_models.dart';
import 'package:css/widgets/bottom_bar.dart';
import 'package:css/widgets/catalog.dart';
import 'package:css/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 85,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              )),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Продукция ООО "Центростальстрой"',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                subtitle: Text(
                  'RAL 9005, 8019, 8017, 7024, 6005, 3005',
                  style: TextStyle(fontSize: 15, color: Colors.blue[600]),
                ),
                trailing: const Icon(
                  Icons.add_call,
                  color: Colors.white70,
                  size: 30,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(3.0),
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productData.items.length,
                  itemBuilder: (context, int index) =>
                      ChangeNotifierProvider.value(
                    value: productData.items[index],
                    child: const ItemCard(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  'Каталог продукции ББэшечки:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
              ),
              ...productData.items.map((value) {
                return CatalogListTile(image: value.image);
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
