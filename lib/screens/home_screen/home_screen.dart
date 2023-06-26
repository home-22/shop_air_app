// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/model/product.dart';

import 'package:shop_air_app/screens/home_screen/components/bottom_navigator_bar.dart';
import 'package:shop_air_app/screens/home_screen/components/category_text.dart';
import 'package:shop_air_app/screens/home_screen/components/product_display_tab.dart';
import '../../providers/card_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productList = dummyData;

  TextEditingController textSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
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
      body: Consumer<CardProvider>(
        builder: (context, cardProvider, _) {
          return CustomScrollView(
            slivers: [
              const CategoryText(title: 'Computers', buttonTitle: 'See more'),
              ProductDisplayTab(
                productList: dummyData
                    .where((element) => element.category == Category.computers)
                    .toList(),
              ),
              const CategoryText(title: 'Laptops', buttonTitle: 'See more'),
              ProductDisplayTab(
                productList: dummyData
                    .where((element) => element.category == Category.laptops)
                    .toList(),
              ),
              const CategoryText(title: 'Phones', buttonTitle: 'See more'),
              ProductDisplayTab(
                productList: dummyData
                    .where((element) => element.category == Category.phones)
                    .toList(),
              ),
              const CategoryText(title: 'Other', buttonTitle: 'See more'),
              ProductDisplayTab(
                productList: dummyData
                    .where((element) => element.category == Category.other)
                    .toList(),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const BottomNavigatorBar(),
    );
  }
}
