import 'package:flutter/material.dart';
import 'package:flutter_projects/services/NetworkHelper.dart';

class DataScreen extends StatefulWidget {
  DataScreen({Key? key}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  NetworkHelper networkHelper = NetworkHelper();

  Future<dynamic> saveData() {
    final urlRes = networkHelper.getData();
    return urlRes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
              primary: Colors.white, backgroundColor: Colors.blue),
          onPressed: () async {
            final res = await networkHelper.getData();
            print(res['feeds']);
          },
          child: Text('Get Data'),
        ),
      ),
    );
  }
}
