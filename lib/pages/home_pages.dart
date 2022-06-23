// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_web_libraries_in_flutter, sized_box_for_whitespace

import 'package:coffeeapps/util/coffe_type.dart';
import 'package:coffeeapps/util/util_coffee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeType = [
    ['Cappucino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false]
  ];
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeType.length; i++) {
        coffeType[i][1] = false;
      }
      coffeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Find the best Coffee for you",
                style: GoogleFonts.bebasNeue(
                  fontSize: 56,
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee....',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            // horizontal
            Container(
                height: 20,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeType.length,
                    itemBuilder: (context, index) {
                      return CoffeType(
                          coffeType: coffeType[index][0],
                          isSelected: coffeType[index][1],
                          onTap: () {
                            coffeeTypeSelected(index);
                          });
                    })),

            // horizontal listview of coffe tiles
            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'assets/images/coffe1.jpg',
                  coffeeName: 'latte',
                  coffePrice: '4.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/coffe2.jpg',
                  coffeeName: 'latte',
                  coffePrice: '4.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/coffe3.jpg',
                  coffeeName: 'latte',
                  coffePrice: '4.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/coffe1.jpg',
                  coffeeName: 'latter',
                  coffePrice: '4.20',
                )
              ],
            ))
          ],
        ));
  }
}
