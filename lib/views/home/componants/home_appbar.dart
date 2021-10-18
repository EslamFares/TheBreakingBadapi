import 'package:breakingbad_api/views/home/cubits/home_cubit.dart';
import 'package:breakingbad_api/views/home/widgets/seach_button.dart';
import 'package:breakingbad_api/views/home/widgets/search_textformfilld.dart';
import 'package:flutter/material.dart';

AppBar homeAppBar(context) {
  HomeCubit cubit = HomeCubit.get(context);
  // final x = (cubit.state is HomeInitialState);
  return AppBar(
    title: cubit.isSearch
        ? SearchTextFormFilld()
        : Hero(
            tag: 'searchBar',
            child: Text('The Breaking Bad'),
          ),
    centerTitle: false,
    actions: [SeachButton()],
  );
}
