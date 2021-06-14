import 'package:flutter/material.dart';
import 'package:flutter_projects/constants.dart';
import 'package:flutter_projects/controller/PlaceController.dart';
import 'package:flutter_projects/widgets/GMapBack.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:flutter/rendering.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //* Text editing Controller
  final TextEditingController latTextController = TextEditingController();
  final TextEditingController lngTextController = TextEditingController();

  //* Getx Controller for Lat / Lng
  final PlaceController latLngController =
      Get.put(PlaceController(), permanent: true, tag: 'placeControl');

  //* UI Starts here
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      //* App Bar for Search Screen
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
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 2,
            children: [
              SizedBox(
                width: _width * 0.17,
                child: TextFormField(
                  controller: latTextController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: kTextInputDecoration.copyWith(
                    hintText: _width > 500 ? "Enter Latitude here" : 'Lat Here',
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                width: _width * 0.17,
                child: TextFormField(
                  controller: lngTextController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: kTextInputDecoration.copyWith(
                    hintText:
                        _width > 500 ? "Enter Longitude here" : 'Lng Here',
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    onSurface: Colors.grey,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.09, 40),
                  ),
                  onPressed: () {
                    //* to Check if text is not empty
                    if (lngTextController.text.isNotEmpty &&
                        lngTextController.text.isNotEmpty) {
                      double lat = double.parse(latTextController.text.trim());
                      double lng = double.parse(lngTextController.text.trim());

                      latLngController.updateValue(
                        latV: lat,
                        lngV: lng,
                      );
                    }
                  },
                  child: Text(
                    'Search',
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
        ],
      ),

      //* Body of the Website
      body: Stack(
        children: <Widget>[
          //* Map as background
          Container(
            height: _height,
            width: _width,
            child: Obx(
              () => getMap(
                  lat: latLngController.place[0],
                  lng: latLngController.place[1]),
            ),
          ),
        ],
      ),
    );
  }
}
