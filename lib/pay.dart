// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'cartProvider.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _MyPgPage();
}

class _MyPgPage extends State<Pay> {
  String webApplicationId = '5b8f6a4d396fa665fdc2b5e7';
  String androidApplicationId = '5b8f6a4d396fa665fdc2b5e8';
  String iosApplicationId = '5b8f6a4d396fa665fdc2b5e9';

  // var totalPrice = Cart.totalPrice;
  @override
  Widget build(BuildContext context) {

  final cartItemProvider = Provider.of<CartProvider>(context);
  int totalPrice = 0;
  for (int i=0; i<cartItemProvider.cartItems.length;i++){
    totalPrice += cartItemProvider.cartItems[i].total;
  }

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffffffff),
        foregroundColor: Color(0xffe51937),
        title: Text(
          'Pay',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25
          ),
        ),
      ),
      body: Column(
        children: [
          Container(  // 결제할 메뉴 정보 컨테이너
            padding: EdgeInsets.fromLTRB(40, 30, 40, 15),
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '결제 총 액',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  '$totalPrice원',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffe52937)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 360,
            child: Divider(
              color: Colors.grey[300],
              thickness: 1.8,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 30, 40, 15),
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft, 
                  child: Text(
                    '결제 수단 선택',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  children: [
                    Container(  // 네이버페이
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xfff2f2f2),
                          width: 2.5
                        )
                      ),
                      child: ElevatedButton(
                        style: (
                          ElevatedButton.styleFrom(
                            foregroundColor: Colors.grey[500],
                            backgroundColor: Color(0xffffffff),
                            elevation: 0,
                            fixedSize: Size(150, 150),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                          )
                        ),
                        onPressed: () => payTest(context, 'kcp', 'npay'),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/naverPay.png', width: 100, height: 100,),
                            Text('네이버 페이')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(  // 카카오페이
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xfff2f2f2),
                          width: 2.5
                        )
                      ),
                      child: ElevatedButton(
                        style: (
                          ElevatedButton.styleFrom(
                            foregroundColor: Colors.grey[500],
                            backgroundColor: Color(0xffffffff),
                            elevation: 0,
                            fixedSize: Size(150, 150),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                          )
                        ),
                        onPressed: () => payTest(context, 'kakao', 'easy'),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/kakaoPay.png', width: 100, height: 100,),
                            Text('카카오 페이')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  children: [
                    Container(  // 페이코
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xfff2f2f2),
                          width: 2.5
                        )
                      ),
                      child: ElevatedButton(
                        style: (
                          ElevatedButton.styleFrom(
                            foregroundColor: Colors.grey[500],
                            backgroundColor: Color(0xffffffff),
                            elevation: 0,
                            fixedSize: Size(150, 150),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                          )
                        ),
                        onPressed: () => payTest(context, 'payco', 'easy'),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/payco.png', width: 200, height: 100,),
                            Text('페이코')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xfff2f2f2),
                          width: 2.5
                        )
                      ),
                      child: ElevatedButton(
                        style: (
                          ElevatedButton.styleFrom(
                            foregroundColor: Colors.grey[500],
                            backgroundColor: Color(0xffffffff),
                            elevation: 0,
                            fixedSize: Size(150, 150),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                          )
                        ),
                        onPressed: (){
                          
                        }, 
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/barcode.png', width: 100, height: 100,),
                            Text('모바일 상품권')
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void payTest(BuildContext context, String pg, String method) {
    Payload payload = getPayload(pg, method);
    if (kIsWeb) {
      payload.extra?.openType = "iframe";
    }

    Bootpay().requestPayment(
      context: context,
      payload: payload,
      showCloseButton: false,
      onCancel: (String data) {
        print('------- onCancel: $data');
      },
      onError: (String data) {
        print('------- onError: $data');
      },
      onClose: () {
        print('------- onClose');
        Bootpay().dismiss(context); //명시적으로 부트페이 뷰 종료 호출
        //TO_DO - 원하시는 라우터로 페이지 이동
      },
      onIssued: (String data) {
        print('------- onIssued: $data');
      },
      onConfirm: (String data) {
        print('------- onConfirm: $data');

        return true;
      },
      onDone: (String data) {
        print('------- onDone: $data');
      },
    );
  }

  Payload getPayload(String pg, String method) {
    Payload payload = Payload();
    Item item1 = Item();
    item1.name = "HOT 아메리카노"; // 주문정보에 담길 상품명
    item1.qty = 1; // 해당 상품의 주문 수량
    item1.id = "ITEM_CODE_MOUSE"; // 해당 상품의 고유 키
    item1.price = 2500; // 상품의 가격

    // Item item2 = Item();
    // item2.name = "초코라떼"; // 주문정보에 담길 상품명
    // item2.qty = 1; // 해당 상품의 주문 수량
    // item2.id = "ITEM_CODE_KEYBOARD"; // 해당 상품의 고유 키
    // item2.price = 4000; // 상품의 가격
    List<Item> itemList = [item1];

    payload.webApplicationId = webApplicationId; // web application id
    payload.androidApplicationId =
        androidApplicationId; // android application id
    payload.iosApplicationId = iosApplicationId; // ios application id

    payload.pg = pg;
    payload.method = method;
    // payload.methods = ['card', 'phone', 'vbank', 'bank', 'kakao'];
    payload.orderName = "HOT 아메리카노"; //결제할 상품명
    payload.price = 7500; //정기결제시 0 혹은 주석

    payload.orderId = DateTime.now()
        .millisecondsSinceEpoch
        .toString(); //주문번호, 개발사에서 고유값으로 지정해야함

    payload.metadata = {
      "callbackParam1": "value12",
      "callbackParam2": "value34",
      "callbackParam3": "value56",
      "callbackParam4": "value78",
    }; // 전달할 파라미터, 결제 후 되돌려 주는 값
    payload.items = itemList; // 상품정보 배열

    User user = User(); // 구매자 정보
    user.username = "사용자 이름";
    user.email = "user1234@gmail.com";
    user.area = "서울";
    user.phone = "010-4033-4678";
    user.addr = '서울시 동작구 상도로 222';

    Extra extra = Extra(); // 결제 옵션
    extra.appScheme = 'bootpayFlutterExample';
    extra.cardQuota = '3';
    // extra.openType = 'popup';

    // extra.carrier = "SKT,KT,LGT"; //본인인증 시 고정할 통신사명
    // extra.ageLimit = 20; // 본인인증시 제한할 최소 나이 ex) 20 -> 20살 이상만 인증이 가능

    payload.user = user;
    payload.extra = extra;
    return payload;
  }
}
