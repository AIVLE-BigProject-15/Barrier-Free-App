// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

final coffeeItem = {
  "coffeeList": [
    {"image": "assets/americano.png", "name": "HOT 아메리카노", "price": "2500"},
    {"image": "assets/iceAmericano.png", "name": "ICE 아메리카노", "price": "3000원"},
    {"image": "assets/latte.png", "name": "HOT 카페라떼", "price": "3000원"},
    {"image": "assets/iceLatte.png", "name": "ICE 카페라떼", "price": "3500원"},
    {"image": "assets/hazelnutAmericano.png", "name": "ICE 헤이즐넛 아메리카노", "price": "3500원"},
    {"image": "assets/toffeNutsLatte.png", "name": "ICE 토피넛 라떼", "price": "4500원"},
  ]
};

final nonCoffeeItem = {
  "nonCoffeeList": [
    {"image": "assets/orangeAde.png", "name": "오렌지 에이드", "price": "5000원"},
    {"image": "assets/mangoAde.png", "name": "망고 에이드", "price": "5000원"},
    {"image": "assets/appleMintAde.png", "name": "애플민트 에이드", "price": "5000원"},
    {"image": "assets/strawberryLatte.png", "name": "ICE 딸기 라떼", "price": "4500원"},
    {"image": "assets/chocoLatte.png", "name": "ICE 초코 라떼", "price": "4500원"},
    {"image": "assets/mintChocoLatte.png", "name": "ICE 민트초코 라떼", "price": "4500원"},
  ]
};

final breadItem = {
  "breadList": [
    {"image": "assets/saltBread.png", "name": "소금빵", "price": "2500원"},
    {"image": "assets/pretzel.png", "name": "프레첼", "price": "3000원"},
    {"image": "assets/croissant.png", "name": "크로와상", "price": "3000원"},
    {"image": "assets/strawberryMacaron.png", "name": "딸기 마카롱", "price": "2000원"},
    {"image": "assets/bananaMacaron.png", "name": "바나나 마카롱", "price": "2000원"},
    {"image": "assets/chocoMacaron.png", "name": "초코 마카롱", "price": "2000원"},
  ]
};


class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _menuState();
}

class _menuState extends State<Menu> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3, vsync: this
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          TabBar(
            tabs: [
              Container(
                height: 50,
                alignment: Alignment.center,
                child: Text('Coffee', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: Text('Non-Coffee', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: Text('Bread', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              )
            ],
            indicator: BoxDecoration(
              color: Colors.green,
            ),
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.green,
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  child: GridView.builder(
                    itemCount: coffeeItem['coffeeList']!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1/1.2, crossAxisSpacing: 10
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            Image.asset(coffeeItem['coffeeList']!.elementAt(index)['image']!),
                            Container(
                              height: 40,
                              alignment: Alignment.center,
                              color: Colors.white,
                              child: Text(
                                coffeeItem['coffeeList']!.elementAt(index)['name']!,
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  coffeeItem['coffeeList']!.elementAt(index)['price']!,
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                              )
                            ),
                            SizedBox(height: 10,)
                          ],
                        ),
                      );
                    }
                  )
                ),
                Container(
                  child: GridView.builder(
                    itemCount: nonCoffeeItem['nonCoffeeList']!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1/1.2, crossAxisSpacing: 10
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            Image.asset(nonCoffeeItem['nonCoffeeList']!.elementAt(index)['image']!),
                            Container(
                              height: 40,
                              alignment: Alignment.center,
                              color: Colors.white,
                              child: Text(
                                nonCoffeeItem['nonCoffeeList']!.elementAt(index)['name']!,
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  nonCoffeeItem['nonCoffeeList']!.elementAt(index)['price']!,
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                              )
                            ),
                            SizedBox(height: 10,)
                          ],
                        ),
                      );
                    }
                  )
                ),
                Container(
                  child: GridView.builder(
                    itemCount: breadItem['breadList']!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1/1.2, crossAxisSpacing: 10
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            Image.asset(breadItem['breadList']!.elementAt(index)['image']!),
                            Container(
                              height: 40,
                              alignment: Alignment.center,
                              color: Colors.white,
                              child: Text(
                                breadItem['breadList']!.elementAt(index)['name']!,
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  breadItem['breadList']!.elementAt(index)['price']!,
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                              )
                            ),
                            SizedBox(height: 10,)
                          ],
                        ),
                      );
                    }
                  )
                )
              ]
            ),
          ),

        ],

      ),
    );
  }
}