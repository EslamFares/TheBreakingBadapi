
import 'package:breakingbad_api/cubit/home/home_cubit.dart';
import 'package:flutter/material.dart';

class NoInternetRefresh extends StatefulWidget {
  @override
  _NoInternetRefreshState createState() => _NoInternetRefreshState();
}

class _NoInternetRefreshState extends State<NoInternetRefresh> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              HomeCubit.get(context).checkConnection()();
            },
            child: Text('Resfesh')));
  }
}
