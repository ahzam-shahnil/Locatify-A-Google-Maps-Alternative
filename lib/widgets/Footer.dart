import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required double width,
    required double height,
    required Color color,
  })  : _width = width,
        _height = height,
        _color = color,
        super(key: key);
  final Color _color;
  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(3, 0), // changes position of shadow
          ),
        ],
      ),
      width: _width,
      height: _height * 0.1,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Built in Flutter',
            style: TextStyle(
              fontFamily: 'Product',
              color: Colors.black,
              fontSize: 19,
            ),
          ),
          SizedBox(width: 7),
          FadeInImage.memoryNetwork(
            image: 'https://designchecker.000webhostapp.com/hbird.png',
            placeholder: kTransparentImage,
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }
}
