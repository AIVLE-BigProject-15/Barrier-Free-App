// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_is_empty, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'itemProvider.dart';
import 'cart.dart';

class MenuCake extends StatefulWidget {
  const MenuCake({super.key});

  @override
  State<MenuCake> createState() => _MenuCakeState();
}

class _MenuCakeState extends State<MenuCake> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2, vsync: this
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
          return Row(
            children: [
              Expanded(
                flex: 8,
                child: Scaffold(
                  backgroundColor: Color(0xffffffff),
                  appBar: AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/orderType', (route) => false,);
                      },
                      color: Color(0xffe51937),
                      icon: Icon(Icons.arrow_back)
                    ),
                    elevation: 0.0,
                    backgroundColor: Color(0xffffffff),
                    foregroundColor: Color(0xffe51937),
                    title: Text(
                      'Menu',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22
                      ),
                    ),
                  ),
                  body: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        tabs: [
                          Container(
                            height: 30,
                            alignment: Alignment.center,
                            child: Text('Whole', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.center,
                            child: Text('Piece', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ],
                        indicator: ShapeDecoration(
                          shape: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffe51937),
                              style: BorderStyle.solid,
                              width: 3
                            )
                          ),
                        ),
                        controller: _tabController,
                        labelColor: Color(0xffe51937),
                        unselectedLabelColor: Colors.grey[500],
                      ),
              
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Container(
                              child: GridView.builder(
                                itemCount: itemProvider.wholeCakeItems.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return GridTile(
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, '/detail', 
                                        arguments: itemProvider.wholeCakeItems[index]);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xfff2f2f2),
                                              width: 2
                                            ),
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.network(itemProvider.wholeCakeItems[index].img),
                                              SizedBox(height: 6,),
                                              Text(
                                                itemProvider.wholeCakeItems[index].menu,
                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(height: 3,),
                                              Text(
                                                '${itemProvider.wholeCakeItems[index].price}원',
                                                style: TextStyle(fontSize: 13, color: Color(0xffe51937), fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              )
                            ),
              
                            Container(
                              child: GridView.builder(
                                itemCount: itemProvider.pieceCakeItems.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return GridTile(
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, '/detail', 
                                        arguments: itemProvider.pieceCakeItems[index]);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xfff2f2f2),
                                              width: 2
                                            ),
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.network(itemProvider.pieceCakeItems[index].img),
                                              SizedBox(height: 6,),
                                              Text(
                                                itemProvider.pieceCakeItems[index].menu,
                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(height: 3,),
                                              Text(
                                                '${itemProvider.pieceCakeItems[index].price}원',
                                                style: TextStyle(fontSize: 13, color: Color(0xffe51937), fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
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
                ),
              ),
              Expanded(
                flex: 2,
                child: Scaffold(
                  backgroundColor: Color(0xfff2f2f2),
                  body: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 100,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xfff2f2f2),
                            elevation: 0.0
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/recom', (route) => false,);
                          }, 
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/star.png',
                                color: Colors.grey[500],
                                scale: 13,
                              ),
                              Text(
                                'Best',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.normal
                                ),
                              )
                            ]
                          ),
                        ),
                        SizedBox(height: 40,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xfff2f2f2),
                            elevation: 0.0
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/drink', (route) => false,);
                          }, 
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/drink.png',
                                color: Colors.grey[500],
                                scale: 13,
                              ),
                              Text(
                                'Drink',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.normal
                                ),
                              )
                            ]
                          ),
                        ),
                        SizedBox(height: 45,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xfff2f2f2),
                            elevation: 0.0
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/bread', (route) => false,);
                          }, 
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/bread.png',
                                color: Colors.grey[500],
                                scale: 13,
                              ),
                              Text(
                                'Bread',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.normal
                                ),
                              )
                            ]
                          ),
                        ),
                        SizedBox(height: 50,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xfff2f2f2),
                            elevation: 0.0
                          ),
                          onPressed: () {
                            
                          }, 
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/cake.png',
                                color: Color(0xffe51937),
                                scale: 15,
                              ),
                              Padding(padding: EdgeInsets.all(3)),
                              Text(
                                'Cake',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xffe51937),
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ]
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xfff2f2f2),
                            elevation: 0.0
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
                          }, 
                          child: Column(
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined, 
                                color: Color(0xffe51937),
                                size: 30,
                              ),
                              Padding(padding: EdgeInsets.all(3)),
                              Text(
                                'Cart',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xffe51937),
                                ),
                              )
                            ]
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 25))
                      ],
                    ),
                  ),
                ),
              )
            ]
          );
        }
      }
    );
  }
}