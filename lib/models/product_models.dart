import 'dart:collection';

import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String image;
  final dynamic color;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.image,
      @required this.color});
}

class ProductDataProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'МЧ модульная "ГОТИКА"\n RAL 7024 матовый',
      description:
          'Описание: RAL7024МАТ (графит)\nТолщина: 0,50мм\nПокрытие: матовый полиэстер 35мкм\nЦинковое покрытие: 225гр/м2\nГарантия: 15лет',
      price: 33.96,
      image: 'assets/images/1.png',
      color: '0xFF082B3A',
    ),
    Product(
      id: 'p2',
      title: 'МЧ модульная "ВЕНЕЦИАНА"\n RAL 9005 матовый',
      description:
          'Описание: RAL9005МАТ (черный)\nТолщина: 0,50мм\nПокрытие: матовый полиэстер 35мкм\nЦинковое покрытие: 225гр/м2\nГарантия: 15лет',
      price: 33.96,
      image: 'assets/images/2.png',
      color: '0xFF212121',
    ),
    Product(
      id: 'p3',
      title: 'Металлочерепица "Супермонтеррей"\n RAL 9005 матовый',
      description:
          'Описание: RAL9005МАТ (черный)\nТолщина: 0,50мм\nПокрытие: матовый полиэстер 35мкм\nЦинковое покрытие: 225гр/м2\nГарантия: 15лет',
      price: 20.00,
      image: 'assets/images/3.png',
      color: '0xFF333333',
    ),
    Product(
      id: 'p4',
      title: 'МЧ модульная "ВЕНЕЦИАНА"\n RAL 7024 матовый',
      description:
          'Описание: RAL7024МАТ (графит)\nТолщина: 0,50мм\nПокрытие: матовый полиэстер 35мкм\nЦинковое покрытие: 225гр/м2\nГарантия: 15лет',
      price: 19.80,
      image: 'assets/images/4.png',
      color: '0xFF102832',
    ),
    Product(
      id: 'p5',
      title: 'Металлочерепица "Супермонтеррей"\n RAL 8019 матовый',
      description:
          'Описание: RAL8019МАТ (тёмно-коричневый)\nТолщина: 0,50мм\nПокрытие: матовый полиэстер 35мкм\nЦинковое покрытие: 225гр/м2\nГарантия: 15лет',
      price: 20.00,
      image: 'assets/images/5.png',
      color: '0xFF222120',
    ),
    Product(
      id: 'p6',
      title: 'Металлочерепица "Супермонтеррей"\n RAL 8017 матовый',
      description:
          'Описание: RAL8017МАТ (коричневый)\nТолщина: 0,50мм\nПокрытие: матовый полиэстер 35мкм\nЦинковое покрытие: 225гр/м2\nГарантия: 15лет',
      price: 19.80,
      image: 'assets/images/6.png',
      color: '0xFF551F0B',
    ),
    Product(
      id: 'p7',
      title: 'Металлочерепица "Супермонтеррей"\n RAL 8017 глянец',
      description:
          'Описание: RAL8017 (шоколадно-коричневый)\nТолщина: 0,45мм\nПокрытие: глянцевый полиэстер 25мкм\nЦинковое покрытие: 180гр/м2\nГарантия: 10лет',
      price: 16.80,
      image: 'assets/images/7.png',
      color: '0xFF492517',
    ),
    Product(
      id: 'p8',
      title: 'Металлочерепица "Супермонтеррей"\n RAL 8019 глянец',
      description:
          'Описание: RAL8019 (тёмно-коричневый)\nТолщина: 0,45мм\nПокрытие: глянцевый полиэстер 25мкм\nЦинковое покрытие: 180гр/м2\nГарантия: 10лет',
      price: 17.00,
      image: 'assets/images/8.png',
      color: '0xFF230B00',
    ),
    Product(
      id: 'p9',
      title: 'Металлочерепица "Супермонтеррей"\n RAL 7024 глянец',
      description:
          'Описание: RAL7024 (графит)\nТолщина: 0,45мм\nПокрытие: глянцевый полиэстер 25мкм\nЦинковое покрытие: 180гр/м2\nГарантия: 10лет',
      price: 16.80,
      image: 'assets/images/9.png',
      color: '0xFF2C2E3C',
    ),
    Product(
      id: 'p10',
      title: 'Металлочерепица "Супермонтеррей"\n RAL 6005 глянец',
      description:
          'Описание: RAL6005 (зелёный мох)\nТолщина: 0,45мм\nПокрытие: глянцевый полиэстер 25мкм\nЦинковое покрытие: 180гр/м2\nГарантия: 10лет',
      price: 16.80,
      image: 'assets/images/10.png',
      color: '0xFF1A3416',
    ),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id) =>
      _items.singleWhere((value) => value.id == id);
}
