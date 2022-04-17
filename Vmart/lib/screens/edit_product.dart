import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:Vmart/screens/homepage.dart';
import 'package:http/http.dart' as http;

class EditProduct extends StatelessWidget {
  //consEdit({Key? key}) : super(key: key);
  final Map product;
  EditProduct({required this.product});
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _pictureController = TextEditingController();
  Future updateProduct() async {
    final response = await http.put(
        Uri.parse(
            'http://10.0.2.2:8000/api/produk/' + product['id'].toString()),
        body: {
          'name': _nameController.text,
          'description': _descriptionController.text,
          'price': _priceController.text,
          'picture_name': _pictureController.text,
        });
    print(response.body);
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit product'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController..text = product['name'],
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan nama produk';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController
                  ..text = product['description'],
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan Description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController..text = product['price'],
                decoration: InputDecoration(labelText: 'Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan Price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pictureController..text = product['picture_name'],
                decoration: InputDecoration(labelText: 'Picture URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan Picture URL';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      updateProduct().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('product berhasil di ubah'),
                        ));
                      });
                    }
                    //print(_nameController.text);
                  },
                  child: Text('Save'))
            ],
          ),
        ));
  }
}
