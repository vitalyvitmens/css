import 'package:css/pages/catalog_page.dart';
import 'package:flutter/material.dart';

class CatalogListTile extends StatelessWidget {
  final dynamic image;
  const CatalogListTile({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ItemCatalog(image: image)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: Image.asset(image).image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            'Кровельный набор ББ',
            style: TextStyle(fontSize: 15, color: Colors.blue[600]),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '09:00 - 17:00   NON-STOP',
                style: TextStyle(fontSize: 15, color: Colors.blue[600]),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.red[700],
                  ),
                  const Text(' 4.9 баллов',
                      style: TextStyle(fontSize: 15, color: Colors.white70)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
