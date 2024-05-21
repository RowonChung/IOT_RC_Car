import 'dart:ui' as ui;
import 'dart:html';

import 'package:flutter/material.dart';

class ControlPage extends StatefulWidget {
  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
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
      body: SafeArea(
        child: Stack(
          children: [
            // Naver Map to fill the entire screen
            Positioned.fill(
              child: HtmlElementView(viewType: 'naver-map'),
            ),
            // Row for icon buttons (first row)
            Positioned(
              bottom: 120.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // Align to the right
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_upward_sharp),
                    onPressed: () {
                      print('Icon button 1 pressed!');
                    },
                    iconSize: 48.0, // Set icon size to 48.0 (2x)
                  ),
                  SizedBox(width: 40.0),
                ],
              ),
            ),
            // Row for icon buttons (second row)
            Positioned(
              bottom: 80.0, // Adjust the position
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the left
                children: [
                  SizedBox(width: 20.0),
                  IconButton(
                    icon: Icon(Icons.arrow_back_sharp),
                    onPressed: () {
                      print('Icon button 2 pressed!');
                    },
                    iconSize: 48.0, // Set icon size to 48.0 (2x)
                  ),
                  SizedBox(width: 8.0), // Add spacing between icons
                  IconButton(
                    icon: Icon(Icons.circle_outlined),
                    onPressed: () {
                      print('Icon button 3 pressed!');
                    },
                    iconSize: 48.0, // Set icon size to 48.0 (2x)
                  ),
                  SizedBox(width: 8.0), // Add spacing between icons
                  IconButton(
                    icon: Icon(Icons.arrow_forward_sharp),
                    onPressed: () {
                      print('Icon button 4 pressed!');
                    },
                    iconSize: 48.0, // Set icon size to 48.0 (2x)
                  ),
                ],
              ),
            ),
            // Row for icon buttons (third row)
            Positioned(
              bottom: 40.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // Align to the right
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_downward_sharp),
                    onPressed: () {
                      print('Icon button 5 pressed!');
                    },
                    iconSize: 48.0, // Set icon size to 48.0 (2x)
                  ),
                  SizedBox(width: 40.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}