import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_projects/constants.dart';
import 'package:flutter_projects/widgets/Footer.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatelessWidget {
  final int _itemCount = 1;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: 'https://designchecker.000webhostapp.com/locatify_logo.png',
          fit: BoxFit.contain,
          height: _height > 560 ? _height * 0.1 : _height * 0.14,
          width: _width > 500 ? _width * 0.1 : _width * 0.14,
        ),
        elevation: 10,
        shadowColor: Colors.blueGrey,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
                onSurface: Colors.grey,
                minimumSize: Size(MediaQuery.of(context).size.width * 0.09, 40),
              ),
              onPressed: () => Navigator.pushNamed(context, kSearchScreen),
              child: Text(
                'Try Now',
                style: TextStyle(
                  fontFamily: 'Product',
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          )
        ],
      ),
      //? body of ui
      body: ListView.builder(
        itemCount: _itemCount,
        itemBuilder: (context, index) => Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Container(
                height: _height * 0.85,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:
                      'https://designchecker.000webhostapp.com/navigateworld.png',
                ),
              ),
              Text(
                'Explore and navigate your world',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Product',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Locatify is a Blind Stick project of GOS Tracking System With Ultrasonic Sensors.",
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: TextStyle(
                  fontFamily: 'Product',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 30,
              ),

              //?    Footer
              Footer(
                width: _width,
                height: _height,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
