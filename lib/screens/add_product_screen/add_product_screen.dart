// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:shop_air_app/model/product.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  final List<Product> productList;
  const AddProductScreen({super.key, required this.productList});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  String? selectedImage;
  Future<void> _seletImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product to List..'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: form,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: TextFormField(
                      controller: priceController,
                      decoration: const InputDecoration(
                        labelText: 'price',
                        hintText: 'price.. \$',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter price';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'product name',
                        hintText: 'Enter product name ',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: TextFormField(
                      controller: descController,
                      decoration: const InputDecoration(
                        labelText: 'product description',
                        hintText: 'Enter product description',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _seletImage();
                  },
                  icon: const Icon(
                    Icons.add_a_photo,
                    size: 35,
                  ),
                ),
                if (selectedImage != null) Image.file(File(selectedImage!)),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          if (form.currentState!.validate()) {
            Product product = Product(
                id: DateTime.now().toString(),
                name: nameController.text,
                description: descController.text,
                price: priceController.text,
                image: selectedImage!,
                isAssetImage: false);
            setState(() {
              widget.productList.add(product);
            });

// ocistiti kontrolere nakon sto spremimo
            nameController.clear();
            descController.clear();
            priceController.clear();
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
