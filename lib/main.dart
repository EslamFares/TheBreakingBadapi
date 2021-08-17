import 'package:breakingbad_api/cubit/home/home_cubit.dart';
import 'package:breakingbad_api/cubit/home/home_state.dart';
import 'package:breakingbad_api/shared/themes/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/bloc_observer.dart';
import 'layout/home/home_view.dart';
import 'shared/network/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getData()),
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: darkTheme(),
          home: HomeView(),
        ),
      ),
    );
  }
}
