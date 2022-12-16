// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'itemProvider.dart';
import 'package:flutter/cupertino.dart';
import 'detail.dart';

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
                                        style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
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
                                        style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
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
                                        style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
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
          );
        }
      }
    );
  }
}