// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_is_empty, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'itemProvider.dart';
import 'cart.dart';
import 'file_upload.dart';

class MenuRecom extends StatefulWidget {
  const MenuRecom({super.key});

  @override
  State<MenuRecom> createState() => _MenuRecomState();
}

class _MenuRecomState extends State<MenuRecom> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 1, vsync: this
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    var recomItems = [];
    if (ageDec == '20대' || ageDec == '10대'){
      recomItems = itemProvider.age20Items;
      ageDec = '20대 이하';
    } else if (ageDec == '30대'){
      recomItems = itemProvider.age30Items;
    } else if (ageDec == '40대' || ageDec == '50대'){
      recomItems = itemProvider.age40Items;
    } else if (ageDec == '60대 이상'){
      recomItems = itemProvider.age60Items;
    } else {
      recomItems = itemProvider.age20Items;
    }

    return FutureBuilder(
      future: itemProvider.fetchItems(),
      builder: (context, snapshot) {
        if (recomItems.length == 0) {
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
                            child: Text('$ageDec 추천 메뉴', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
                                itemCount: recomItems.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return GridTile(
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, '/detail', 
                                        arguments: recomItems[index]);
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
                                              Image.network(recomItems[index].img),
                                              SizedBox(height: 6,),
                                              Text(
                                                recomItems[index].menu,
                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(height: 3,),
                                              Text(
                                                '${recomItems[index].price}원',
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
                            
                          }, 
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/star.png',
                                color: Color(0xffe51937),
                                scale: 13,
                              ),
                              Text(
                                'Best',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffe51937),
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
                            Navigator.pushNamedAndRemoveUntil(context, '/drink', (route) => false);
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
                                  fontSize: 18,
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
                            Navigator.pushNamedAndRemoveUntil(context, '/bread', (route) => false);
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
                            Navigator.pushNamedAndRemoveUntil(context, '/cake', (route) => false,);
                          }, 
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/cake.png',
                                color: Colors.grey[500],
                                scale: 15,
                              ),
                              Padding(padding: EdgeInsets.all(3)),
                              Text(
                                'Cake',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[500],
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