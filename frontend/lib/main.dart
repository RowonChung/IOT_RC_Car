import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 22, 24, 1), // Set background color
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 8.0),
              // App bar with car image, Model3, distance, and parking status
              Container(
                height: 120,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Align Model 3 text
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Model 3', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(240, 240, 240, 1))),
                        ),
                        Text('298 km', style: TextStyle(fontSize: 16.0, color: Color.fromRGBO(137, 137, 137, 1))),
                        Text('주차됨', style: TextStyle(fontSize: 14.0, color: Color.fromRGBO(137, 137, 137, 1))),
                      ],
                    ),
                    Spacer(),
                    Center( // Center the Container with Icon
                      child: Container( // Wrap Icon in Container
                        width: 50.0,
                        height: 50.0,

                        decoration: BoxDecoration( // Add BoxDecoration
                          color: Color.fromRGBO(47, 47, 47,1), // Set background color
                          borderRadius: BorderRadius.circular(50.0), // Set circular border
                        ),
                        child: Align( // Align the Icon within the Container
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.person,
                            size: 50.0,
                            color: Color.fromRGBO(89, 89, 89,1 ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                  ],
                ),
              ),
              SizedBox(height: 16.0),

              // Image asset
              Image.asset('assets/images/car.png'), // Replace with your image name

              // Row for the four icon buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space buttons evenly
                children: [
                  IconButton(
                    icon: Icon(Icons.lock_outline, size: 30.0, color: Color.fromRGBO(137, 137, 137, 1)), // Adjust color
                    onPressed: () {
                      // Handle button press for lock
                    },

                  ),
                  IconButton(
                    icon: Icon(Icons.ac_unit, size: 30.0, color: Color.fromRGBO(137, 137, 137, 1)), // Adjust color
                    onPressed: () {
                      // Handle button press for climate control
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.battery_charging_full, size: 30.0, color: Color.fromRGBO(137, 137, 137, 1)), // Adjust color
                    onPressed: () {
                      // Handle button press for charging
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.luggage, size: 30.0, color: Color.fromRGBO(137, 137, 137, 1)), // Adjust color
                    onPressed: () {
                      // Handle button press for settings
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),

              // Security row
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '컨트롤',
                                  style: TextStyle(fontSize: 20.0,  fontWeight: FontWeight.bold,color: Color.fromRGBO(240, 240, 240, 1)),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_sharp, color: Color.fromRGBO(137, 137, 137, 1)),

                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // Set desired radius
                        ),
                        padding: EdgeInsets.only(left: 30.0, right: 10.0, top: 16.0, bottom: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.0),
              // Security row
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '실내 온도 \n',
                                  style: TextStyle(fontSize: 20.0,  fontWeight: FontWeight.bold,color: Color.fromRGBO(240, 240, 240, 1)),
                                ),
                                TextSpan(
                                  text: '실내 31℃',
                                  style: TextStyle(fontSize: 16.0, color: Color.fromRGBO(137, 137, 137, 1)),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_sharp, color: Color.fromRGBO(137, 137, 137, 1)),

                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // Set desired radius
                        ),
                        padding: EdgeInsets.only(left: 30.0, right: 10.0, top: 16.0, bottom: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.0),

              // Security row
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '위치 \n',
                                  style: TextStyle(fontSize: 20.0,  fontWeight: FontWeight.bold,color: Color.fromRGBO(240, 240, 240, 1)),
                                ),
                                TextSpan(
                                  text: '대치동 889-45',
                                  style: TextStyle(fontSize: 16.0, color: Color.fromRGBO(137, 137, 137, 1)),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_sharp, color: Color.fromRGBO(137, 137, 137, 1)),

                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // Set desired radius
                        ),
                        padding: EdgeInsets.only(left: 30.0, right: 10.0, top: 16.0, bottom: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '보안 \n',
                                  style: TextStyle(fontSize: 20.0,  fontWeight: FontWeight.bold,color: Color.fromRGBO(240, 240, 240, 1)),
                                ),
                                TextSpan(
                                  text: 'one-연결 해제됨',
                                  style: TextStyle(fontSize: 16.0, color: Color.fromRGBO(137, 137, 137, 1)),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_sharp, color: Color.fromRGBO(137, 137, 137, 1)),

                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // Set desired radius
                        ),
                        padding: EdgeInsets.only(left: 30.0, right: 10.0, top: 16.0, bottom: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.0),
              // Upgrade button
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '업그레이드',
                                  style: TextStyle(fontSize: 20.0,  fontWeight: FontWeight.bold,color: Color.fromRGBO(240, 240, 240, 1)),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_sharp, color: Color.fromRGBO(137, 137, 137, 1)),

                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // Set desired radius
                        ),
                        padding: EdgeInsets.only(left: 30.0, right: 10.0, top: 16.0, bottom: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '정비 \n',
                                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(240, 240, 240, 1)),
                                ),
                                TextSpan(
                                  text: '2021년 9월 17일, 오후 1:00',
                                  style: TextStyle(fontSize: 16.0, color: Color.fromRGBO(137, 137, 137, 1)),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_sharp, color: Color.fromRGBO(137, 137, 137, 1)),

                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // Set desired radius
                        ),
                        padding: EdgeInsets.only(left: 30.0, right: 10.0, top: 16.0, bottom: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.0),

      ],
      ),
      ),
      ),
    );
  }
}