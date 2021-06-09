// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

double? lat;
double? lng;

Widget getMap({required double lat, required double lng}) {
  String htmlId = Random().nextInt(1000).toString();
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final myLatlng = LatLng(lat, lng);
    final mapOptions = MapOptions()
      ..zoom = 10
      ..center = myLatlng;

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    final map = GMap(elem, mapOptions);

    final marker = Marker(MarkerOptions()
      ..position = myLatlng
      ..map = map
      ..title = 'Current Location!');
    var contentString = '<div id="content">' +
        '<div id="siteNotice">' +
        '</div>' +
        '<h1 id="firstHeading" class="firstHeading">Lat / Lng $myLatlng</h1>' +
        '<div id="bodyContent">' +
        '</div>' +
        '</div>';
    final infoWindow = InfoWindow(InfoWindowOptions()..content = contentString);
    marker.onClick.listen((event) => infoWindow.open(map, marker));
    return elem;
  });

  return HtmlElementView(viewType: htmlId);
}
