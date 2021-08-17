import 'package:breakingbad_api/cubit/home/home_cubit.dart';
import 'package:breakingbad_api/cubit/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/data_view_grid.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    HomeCubit cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: cubit.isSearch
                ? Hero(tag: 'searchBar', child: SearchTextFormFilld())
                : Hero(
                    tag: 'searchBar',
                    child: Text('The Breaking Bad'),
                  ),
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {
                    cubit.changeSearch();
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: cubit.loading
                ? Center(child: CircularProgressIndicator())
                : cubit.noData
                    ? Text('NoData')
                    : DataViewGrid(),
          )),
    );
  }
}

class SearchTextFormFilld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    HomeCubit cubit = HomeCubit.get(context);
    return TextFormField(
      controller: cubit.searchController,
      onChanged: (value) {
        cubit.serch(value);
      },
    );
  }
}
