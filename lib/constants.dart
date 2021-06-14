import 'package:flutter/material.dart';

const kHomeRoute = '/';
const kThinkReadUrl =
    'https://api.thingspeak.com/channels/1414842/fields/1.json?api_key=9QFST2QPKRDU49Q9&results=2';
const kSearchScreen = '/searchMap';
const kTextInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);
