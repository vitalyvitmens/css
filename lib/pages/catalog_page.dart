import 'package:flutter/material.dart';

class ItemCatalog extends StatelessWidget {
  final String image;

  const ItemCatalog({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Каталог продукции',
          style: TextStyle(fontSize: 24, color: Colors.white70),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 1,
          children: <Widget>[
            _buildItem(image),
            _buildItem(image),
            _buildItem(image),
            _buildItem(image),
            _buildItem(image),
            _buildItem(image),
            _buildItem(image),
            _buildItem(image),
            _buildItem(image),
            _buildItem(image),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String image) => Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(image).image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0),
          ],
          color: Colors.lime,
        ),
        child: Text(
          'Продукция ЦСС',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            backgroundColor: Colors.blue[700],
          ),
        ),
      );
}
