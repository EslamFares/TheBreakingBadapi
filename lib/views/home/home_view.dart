import 'package:breakingbad_api/views/home/cubits/home_cubit.dart';
import 'package:breakingbad_api/views/home/states/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'componants/home_appbar.dart';
import 'componants/child_conditions.dart';
import '../offlineScreen/offline_screen.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return BlocProvider(
         create: (context)=>HomeCubit()..checkConnection(),
         child: BlocConsumer<HomeCubit, HomeStates>(
             listener: (context, state) {},
             builder: (context, state) => Scaffold(
            appBar: homeAppBar(context),
            body: OfflineBuilder(
                connectivityBuilder: (
                  BuildContext context,
                  ConnectivityResult connectivity,
                  Widget child,
                ) {
                  final bool connected = connectivity != ConnectivityResult.none;
       
                  if (connected) {
                    return ChildConditions();
                  } else {
                    return OfflineScreen();
                  }
                },
                child: ChildConditions())),
           ),
       );
  }
}
