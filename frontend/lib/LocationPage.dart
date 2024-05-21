import 'dart:ui' as ui;
import 'dart:html';

import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  void _registerNaverMapViewFactory() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'naver-map',
          (int viewId) => IFrameElement()
        ..style.width = '100%'
        ..style.height = '100%' // Set height to 100% for full screen
        ..src = 'assets/map.html' // Replace with your Naver Map HTML file path
        ..style.border = 'none',
    );
  }

  @override
  void initState() {
    _registerNaverMapViewFactory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(22, 22, 24, 1),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(240, 240, 243, 1), // Set the desired color for icons
        ),
        title: Text(
          '위치',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(240, 240, 243, 1),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(22, 22, 24, 1),
      body: SafeArea( // Use SafeArea to avoid overlapping with status bar/notch
        child: Stack( // Use Stack for positioning
          children: [
            // Naver Map to fill the entire screen
            Positioned.fill(
              child: HtmlElementView(viewType: 'naver-map'),
            ),
            // Full-width button at the bottom with padding
            Positioned(
              bottom: 20.0, // Adjust button position as needed
              left: 16.0, // Add left padding
              right: 16.0, // Add right padding
              child: TextButton(
                onPressed: () {
                  // Handle button press event (add your action here)
                  print('Button pressed!');
                },
                child: Text(
                  '호출', // Replace with your desired button text
                  style: TextStyle(
                    fontSize: 20.0, // Adjust font size as needed
                    color: Colors.white, // Set button text color
                    decoration: TextDecoration.underline, // Add underline decoration
                    decorationThickness: 2.0, // Adjust underline thickness
                  ),
                ),
                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(89, 89, 89, 1), // Set button background color
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Adjust padding
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