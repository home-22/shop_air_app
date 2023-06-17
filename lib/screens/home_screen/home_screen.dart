// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/model/product.dart';
import 'dart:io';
import 'package:shop_air_app/screens/add_product_screen/add_product_screen.dart';

import 'package:shop_air_app/screens/product_detail_screen/product_detail_screen.dart';
import '../../providers/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textSearch = TextEditingController();
  List<Product> productList = dummyData;

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SizedBox(
              height: 45,
              child: TextFormField(
                controller: textSearch,
                onChanged: (_) {
                  // varijabla se koristi jel prtrzeni text unesen i nije prazan
                  // metoda isNotEmty vraca true akoje text unesen i nije prazan
                  bool isSearch = textSearch.text.isNotEmpty &&
                      // provjera jel text u pretraživaču nakon uklanjana suvišni razmaka s pocetka i kraja  nije prazan
                      // metoda trim() uklanja suvišne ramake sa početka i kraja texta
                      // metoda isNotEmpty provjerva jel rezultirajući text nakon uklonjena razmaka przan
                      textSearch.text.trim().isNotEmpty;
                  // ako ispunimo oba uvjeta  textSearch.text.isNotEmpty i textSearch.text.trim().isNotEmpty
                  //pretraženi text je unesen i nije prazan pa se varijbla isSearch postavlja na true ako je pretraženi text prazan
                  // varijbla isSearch ce biti false
                  if (isSearch) {
                    // printamo kucnje texta
                    print(textSearch.text.trim());

                    setState(() {
                      //lista dummyData se filtrira pococu medode where i fonkcije predikata
                      // provjerva sadrzi li ime svakog prizvoda u mail slovima
                      productList = dummyData
                          .where(
                            (element) =>
                                //izvrsava svaki element prizvoda u listi  i provjerva jeli pretvoren naziv prizvoda

                                element.name.toLowerCase().contains(
                                      // uzimamo sadrzaj texta unesenog u pretrazivanje
                                      // trim() uklana suvisne razmake sa pcetka i kraja texta
                                      //zatim pococu metode toLowerCase() pretvra sve zankove u mala slova
                                      // bez obzira na velicinu slova zelimo izvršiti pretrazivanje i pronaci prizvode bez obrira na velicinu slova napisanim
                                      textSearch.text.trim().toLowerCase(),
                                    ),
                          )
                          // pretvaramo rezultat u listu
                          .toList();
                    });

                    // dajemo uvjet else koji ce se izvršit ako je pretraženi text prazan
                    //postvljamo productListu na pocetnu listu kada je pretraženi text prazan obnovit ce se cijela lista prizvoda
                  } else {
                    setState(() {
                      productList = dummyData.toList();
                    });
                  }
                },
                decoration: InputDecoration(
                  fillColor: AppColors.kWhite,
                  labelText: 'Search',
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cardProvider, _) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final product = productList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductDetaliScreen(
                              id: product.id,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          child: Column(
                            children: [
                              Text(product.name),
                              Row(
                                children: [
                                  // Ako selectedImage nije null  jeste asset slika,
                                  // prikazujemo sliku koristeći Image.asset()
                                  SizedBox(
                                    height: 120,
                                    width: 120,
                                    child: product.isAssetImage
                                        ? Image.asset(
                                            product.image,
                                            filterQuality: FilterQuality.high,
                                          )
                                        : Image.file(
                                            File(product.image),
                                            filterQuality: FilterQuality.high,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(product.image);
                                            },
                                          ),
                                  ),

                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(product.price),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // brisemo prizvod sa liste koristci index prizvoda
                                      // setState koristimo da aziriramo listu  nakon brisana
                                      setState(() {
                                        productList.removeAt(index);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: AppColors.kRed,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: productList.length,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.kRed,
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProductScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.add,
            size: 28,
          ),
        ),
      ),
    );
  }
}
