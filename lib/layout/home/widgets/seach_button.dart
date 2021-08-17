import 'package:breakingbad_api/cubit/home/home_cubit.dart';
import 'package:flutter/material.dart';

class SeachButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return IconButton(
        onPressed: () {
          if (!cubit.noData&&!cubit.loading) {
            cubit.changeSearch();
            cubit.searchController.clear();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: cubit.noData?Text('NoData❌❗'):Text('wait data get...'),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ));
          }
        },
        icon: cubit.isSearch ? Icon(Icons.cancel) : Icon(Icons.search));
  }
}
