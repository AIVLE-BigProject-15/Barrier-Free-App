// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'itemProvider.dart';
import 'cart.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin{
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
    final itemProvider = Provider.of<ItemProvider>(context);
    return FutureBuilder(
      future: itemProvider.fetchItems(),
      builder: (context, snapshot) {
        if (itemProvider.coffeeItems.length == 0) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            backgroundColor: Color(0xffffffff),
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Color(0xffffffff),
              foregroundColor: Color(0xffe51937),
              title: Text(
                'Menu',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25
                ),
              ),
            ),
            body: Column(
              children: [
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
                      child: Text('NonCoffee', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text('Bread', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    )
                  ],
                  indicator: BoxDecoration(
                    color: Color(0xffe51937),
                  ),
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Color(0xffe51937),
                ),

                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        child: GridView.builder(
                          itemCount: itemProvider.coffeeItems.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1/1.5,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return GridTile(
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, '/detail', 
                                  arguments: itemProvider.coffeeItems[index]);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(itemProvider.coffeeItems[index].img),
                                      Text(
                                        itemProvider.coffeeItems[index].menu,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${itemProvider.coffeeItems[index].price}원',
                                        style: TextStyle(fontSize: 16, color: Color(0xffe51937), fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        )
                      ),

                      Container(
                        child: GridView.builder(
                          itemCount: itemProvider.nonCoffeeItems.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1/1.5
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return GridTile(
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, '/detail', 
                                  arguments: itemProvider.nonCoffeeItems[index]);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(itemProvider.nonCoffeeItems[index].img),
                                      Text(
                                        itemProvider.nonCoffeeItems[index].menu,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${itemProvider.nonCoffeeItems[index].price}원',
                                        style: TextStyle(fontSize: 16, color: Color(0xffe51937), fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        )
                      ),

                      Container(
                        child: GridView.builder(
                          itemCount: itemProvider.breadItems.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1/1.5
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return GridTile(
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, '/detail', 
                                  arguments: itemProvider.breadItems[index]);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(itemProvider.breadItems[index].img),
                                      Text(
                                        itemProvider.breadItems[index].menu,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${itemProvider.breadItems[index].price}원',
                                        style: TextStyle(fontSize: 16, color: Color(0xffe51937), fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        )
                      ),
                    ]
                  ),
                ),
              ],
              
            ),
            floatingActionButton: SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                backgroundColor: Color(0xffe51937),
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                },
                child: Icon(Icons.shopping_cart, size: 40,),
              ),
            )
          );
        }
      }
    );
  }
}