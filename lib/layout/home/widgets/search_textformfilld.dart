import 'package:breakingbad_api/cubit/home/home_cubit.dart';
import 'package:flutter/material.dart';

class SearchTextFormFilld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return Hero(
      tag: 'searchBar',
      child: TextFormField(
        controller: cubit.searchController,
        onChanged: (value) {
          cubit.serch(value);
        },
      ),
    );
  }
}
