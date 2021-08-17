import 'package:breakingbad_api/cubit/home/home_cubit.dart';
import 'package:breakingbad_api/cubit/home/home_state.dart';
import 'package:breakingbad_api/layout/home/widgets/search_textformfilld.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'widgets/data_view_grid.dart';
import 'widgets/nodata_refresh.dart';
import 'widgets/offline_screen.dart';
import 'widgets/seach_button.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: cubit.isSearch
                ? SearchTextFormFilld()
                : Hero(
                    tag: 'searchBar',
                    child: Text('The Breaking Bad'),
                  ),
            centerTitle: false,
            actions: [SeachButton()],
          ),
          body: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;

              if (connected) {
                // cubit.getData();
                return Container(
                  padding: EdgeInsets.all(10),
                  child: cubit.loading
                      ? Center(child: CupertinoActivityIndicator())
                      : cubit.noData
                          ? NoDataRefresh()
                          : DataViewGrid(),
                );
              } else {
                return OfflineScreen();
              }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: cubit.loading
                  ? Center(child: CupertinoActivityIndicator())
                  : cubit.noData
                      ? NoDataRefresh()
                      : DataViewGrid(),
            ),
          )),
    );
  }
}
