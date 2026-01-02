import 'package:coffee_app/screens/delivery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';


class OrderPageScreen extends StatefulWidget {
  const OrderPageScreen({super.key});

  @override
  State<OrderPageScreen> createState() => _OrderPageScreenState();
}

class _OrderPageScreenState extends State<OrderPageScreen> {
  final prodContr = Get.put(ProductController());

  bool isPicked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEDEDED),
      body: ListView(
        children: [
          Padding(
           padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    IconlyLight.arrowLeft2,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Order',
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(''),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0XFFD9D9D9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPicked = true;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: isPicked ? Color(0xFFC67C4E) : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Deliver',
                            style: TextStyle(
                              color: isPicked
                                  ? Colors.white
                                  : Colors.black.withValues(alpha: 0.6),
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPicked = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isPicked ? Colors.transparent : Color(0xFFC67C4E),
                        ),
                        child: Center(
                          child: Text(
                            'Pick Up',
                            style: TextStyle(
                              color: isPicked
                                  ? Colors.black.withValues(alpha: 0.6)
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Address',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                SizedBox(height: 10),
                Text(
                  'JI. Kpg Sutoyo',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
                SizedBox(height: 2),
                Text(
                  'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
                  style: TextStyle(
                      color: Colors.black.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Icon(IconlyLight.editSquare),
                          SizedBox(width: 3),
                          Text('Edit Address'),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Icon(IconlyLight.paperNegative),
                          SizedBox(width: 3),
                          Text('Add note'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.5),
                GetBuilder<ProductController>(
                  builder: (controller) {

                  //final cartItems = controller.cart;
                  //final totalAmount = cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
                  //final total = 2 + totalAmount;

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: prodContr.cart.length,
                      itemBuilder: (ctx, index) {
                        final product = prodContr.cart[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(0),
                                height: 1,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal: BorderSide(
                                  width: 2,
                                  color: Colors.grey.withValues(alpha: 0.1),
                                ))),
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: AssetImage(product.imageUrl),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            product.shortDescription,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          prodContr.decreaseQuantity(product);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(2),
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        width: 20,
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            '${product.quantity}',
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          prodContr.increaseQuantity(product);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(2),
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(0),
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
              width: 2,
              color: Color(0xFFC67C4E).withValues(alpha: 0.3),
            ))),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,10,15,5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        IconlyLight.discount,
                        color: Color(0xFFC67C4E),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '1 Discount Applies',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(IconlyLight.arrowRight2),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding:  EdgeInsets.fromLTRB(15, 5, 15, 10),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                    Text(
                  'Payment Summary',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '\$${prodContr.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee',
                      style: TextStyle(fontSize: 14),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ 2.0',
                          style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 7),
                        Text(
                          '\$ 1.0',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      IconlyLight.wallet,
                      color: Color(0xFFC67C4E),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cash/Wallet',
                          style: TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$${prodContr.total.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFC67C4E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  IconlyLight.arrowDown2,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
              ],
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Get.to(DeliveryScreen());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 35),
                decoration: BoxDecoration(
                  color: Color(0xFFC67C4E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Order',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}