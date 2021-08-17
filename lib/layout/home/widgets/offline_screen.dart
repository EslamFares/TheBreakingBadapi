import 'package:flutter/material.dart';

class OfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wifi_off,
          size: 100,
        ),
        SizedBox(height: 20),
        Text('Your device is not connected to the Internet'),
        SizedBox(height: 10),
        Text('Please, check your connection'),
        SizedBox(height: 10),
        Text('.......'),
      ],
    ));
  }
}
