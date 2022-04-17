import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  //const ProductDetail({Key? key}) : super(key: key);
  final Map product;
  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(product['picture_name']),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product['price'],
                    style: TextStyle(fontSize: 22),
                  ),
                  Row(children: [
                    Text(
                      product['name'],
                      style: TextStyle(fontSize: 22),
                    ),
                  ]),
                ]),
          ),
          Text(product['description'])
        ],
      ),
    );
  }
}
