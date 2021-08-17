import 'package:breakingbad_api/cubit/home/home_cubit.dart';
import 'package:flutter/material.dart';

class NoDataRefresh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('NoData'),
        ElevatedButton(
            onPressed: () {
              cubit.getData();
            },
            child: Text('Resfesh'))
      ],
    ));
  }
}