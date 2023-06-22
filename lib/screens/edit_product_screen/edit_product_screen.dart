import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_air_app/colors/app_colors.dart';

import 'package:shop_air_app/model/product.dart';
import 'package:shop_air_app/providers/card_provider.dart';

class EditProductScreen extends StatefulWidget {
  final Product? product;

  const EditProductScreen({
    super.key,
    required this.product,
  });

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  GlobalKey<FormState> from = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  String? selectedImage; //putnja odabrane slike
  bool imageSelected = true; // oznacavamo odabranu sliku

  Future<void> _selectImage() async {
// ImageSource.gallery kao izvor slike Ovo znaci da cemo odbrati sliku iz galerije uređaja
// metoda pickImage je asinkrona zatim koristimo await da bih smo pričekali da se odabir slike dovrši iz galerije

    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
// uslov ako je slika uspješno odabrana  pickedImage nije null
// tada ažuriramo stanje widgeta koristeci setState()
// i postavljamo selectedImage = na putanju odabira slike (pickedImage.path)
// odabrana slika se pohranjuje u (selectedImage)varijablu što ce se odraziti na prikaz slike u slučaju osvježenja  ili izgradnje widgeta
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage.path;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // uslov provjera da widget da nije nije null osigurava  postojanje objekta
    // kako bih se pristupilo njegovim svojistima ispod
    if (widget.product != null) {
      priceController.text = widget.product!.price;
      nameController.text = widget.product!.name;
      descController.text = widget.product!.description;
      selectedImage = widget.product!.image;
      imageSelected = widget.product!.isAssetImage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.kRed,
          title: const Text('Edit Product'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
                key: from,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter name product';
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
                        _selectImage();
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                        size: 35,
                      ),
                    ),
                    // ako je imageSelectd istina koristimo image.assets za prikaz slike
                    // ako je imageSelectd laz koristimo image.file za prikaz slike
                    // errorBuilder koristimo da bih definisali ako se dogodi greska
                    // mi koristimo da se prikaze slika iz image.assets
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: imageSelected
                          ? Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(selectedImage!),
                            )
                          : Image.file(
                              File(selectedImage!),
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(selectedImage!);
                              },
                            ),
                    ),
                  ],
                )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.kRed,
            child: Icon(
              Icons.save,
              color: AppColors.kWhite,
            ),
            onPressed: () {
              if (from.currentState!.validate()) {
                // ovdje ažuriramo  postojeći prizvod na listi
                final updatedProduct = Product(
                  id: widget.product!.id,
                  name: nameController.text,
                  description: descController.text,
                  price: priceController.text,
                  image: selectedImage ?? widget.product!.image,
                  isAssetImage: widget.product!.isAssetImage,
                  category: Category.computers,
                );
                context.read<CardProvider>().updatedItem(updatedProduct);
                // metoda indexWhere se poziva  na widgetom.productList tj primjenuje se
                // na svaki element u listi Ova metoda prima funkciju koja se izvršava za svaki element i provjerava određeni uslov
                // u ovom  slučaju uslov(uvjet) je id prizvoda jednak id trenutnog uređivanog prizvoda widget.product!.id
                // final index = dummyData
                //     .indexWhere((product) => product.id == widget.product!.id);
                // if (index != -1) {
                //  setState(() {
                //    dummyData[index] = updatedProduct;
                //  });
                // }
                //// context.read<CartProvider>().updatedItem(updatedProduct);
                // metoda indexWhere se poziva  na widgetom.productList tj primjenuje se
                // na svaki element u listi Ova metoda prima funkciju koja se izvršava za svaki element i provjerava određeni uslov
                // u ovom  slučaju uslov(uvjet) je id prizvoda jednak id trenutnog uređivanog prizvoda widget.product!.id
                // final index = dummyData
                //     .indexWhere((product) => product.id == widget.product!.id);
                // if (index != -1) {
                //  setState(() {
                //    dummyData[index] = updatedProduct;
                //  });
                // }
                FocusScope.of(context).unfocus();
                Navigator.pop(context);
              }
            }),
      ),
    );
  }
}
