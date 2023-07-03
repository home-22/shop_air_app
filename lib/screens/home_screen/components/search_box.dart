import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/model/product.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  List<Product> productList = dummyData;
  TextEditingController textSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.65,
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
                    if (kDebugMode) {
                      print(
                        textSearch.text.trim(),
                      );
                    }

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
                    productList = dummyData.toList();
                  }
                },
                decoration: InputDecoration(
                  fillColor: AppColors.kWhite,
                  labelText: 'Search Product',
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.kBlue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
    );
  }
}
