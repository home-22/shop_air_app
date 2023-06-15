// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';

import 'package:shop_air_app/model/product.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  final Product? product;
  final List<Product> productList;
  const AddProductScreen({
    super.key,
    this.product,
    required this.productList,
  });

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  String? selectedImage;

  bool imageSelected = false;

// _selectImage() za odabir slike iz galerije uređaja
  Future<void> _seletImage() async {
// zatim se poziva metoda pickImage() nad imagePicker objektom i prosljeđuje se
// ImageSource.gallery kao izvor slike Ovo znaci da cemo odbrati sliku iz galerije uređaja
// motoda pickImage je asinkrona zatim koristimo await da bih smo pričekali da se odabir slike dovrši

    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
// uslov ako je slika uspješno odabrana  pickedImage nije null
// tada ažuriramo stanje widgeta koristeci setState()
// i postavljamo selectedImage = na putanju odabira slike (pickedImage.path)
// odabrana slika se pohranjuje u (selectedImage)varijablu što ce se odraziti na prikaz slike u slučaju osvježenja aplikacije
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage.path;
        imageSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // da omogućilo da se tastatura sakrije kada korisnik dodirne bilo koji dio ekrana izvan polja za unos teksta
        // na taj nacin se omogućava korisniku da se zatvori tastaturu i završi sa uređivanje teksta
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.kRed,
          title: const Text('Add Product'),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter product name';
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
                      _seletImage();
                    },
                    icon: const Icon(
                      Icons.add_a_photo,
                      size: 35,
                    ),
                  ),
                  // ako selectedImage je razlicit od null
                  // ovo osigurava da ce se slika prikazati ako postoji odabrana slika
                  if (selectedImage != null && !imageSelected)

                    // Image.file(File(selectedImage!)) kreira (Image) widget koji prikazuje sliku
                    // na osnovu putanje selctedImage File(selectedImage!) i konvertuje putanju selcetedImage u File objekat
                    // kako bih se mogla prikazati slika(za prikazivanje slike iz galerije ili kamere uređaja)

                    Image.file(
                      File(selectedImage!),
                      width: 260,
                    ),
                  if (selectedImage != null && imageSelected)
                    Image.asset(
                      selectedImage!,
                      width: 260,
                    ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            if (form.currentState!.validate()) {
              //  ako je widget.product ima vrijednost  tada uređujemo postojući prizvod.
              // Azuriramo  prizvod sa unesenim novim vrijednostima i zamjenujemo postojeci  u productListi sa ažuriranim prizvodiom
              // ako je widget product ima vrijednost null tada ce dodati novi prizvod na listu
              if (widget.product == null) {
                // Dodajemo novi prizvod na listu
                Product newProduct = Product(
                  id: UniqueKey().toString(),
                  name: nameController.text,
                  description: descController.text,
                  price: priceController.text,
                  image: selectedImage!,
                  isAssetImage: false,
                );
                setState(() {
                  widget.productList.add(newProduct);
                });
              }

              FocusScope.of(context).unfocus();
              // ocistiti kontrolere nakon sto spremimo podatke
              nameController.clear();
              descController.clear();
              priceController.clear();
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
