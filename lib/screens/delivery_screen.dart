import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //  Map Image (Background)
          Positioned.fill(
            child: Image.asset('assets/Maps.png', fit: BoxFit.cover),
          ),

          // Top Bar (Hello/Exit)
          Positioned(
            top: 50, // Added margin for status bar
            left: 15,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFEDEDED),
                      border: Border.all(
                        width: 1,
                        color: Colors.transparent
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      IconlyLight.arrowLeft2,
                      size: 25,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFEDEDED),
                    border: Border.all(
                      width: 1,
                      color: Colors.transparent
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    IconlyLight.location,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),

          // 3. THE DRAGGABLE SHEET
          DraggableScrollableSheet(
            initialChildSize: 0.15, // How much it shows when it starts
            minChildSize: 0.15,     // The lowest it can go
            maxChildSize: 0.40,     // The highest it can go
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController, // Vital for tracking the drag
                  child: Column(
                    children: [
                      // Little handle bar at the top
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 5,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      
                      //REMAINING CONTENT GOES HEREEEEEEE
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 13),
                                Text(
                                  '10 minutes left',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Delivery to ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13
                                      ),
                                    ),
                                    Text(
                                      'JI. Kpg Sutoyo',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 70,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 70,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 70,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 70,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.2)
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withValues(alpha: 0.5),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    height: 66,
                                    width: 66,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage('assets/Deliver (1).png'),
                                        fit: BoxFit.contain
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Delivering your Order',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          'We will  deliver your goods to you in '
                                          '\nthe shortest possible time',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                    padding: EdgeInsets.all(5),
                                    height: 66,
                                    width: 66,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage('assets/Profile (1).png'),
                                        fit: BoxFit.contain
                                      ),
                                    ),
                                    ),
                                    SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Brooklyn Simmons',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 1),
                                        Text('Personal Courier',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black.withValues(alpha: 0.2)
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    IconlyLight.calling,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}