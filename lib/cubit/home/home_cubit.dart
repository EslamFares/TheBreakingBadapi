import 'package:breakingbad_api/cubit/home/home_state.dart';
import 'package:breakingbad_api/model/character_model.dart';
import 'package:breakingbad_api/shared/network/dio_helper.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  //====================================
  bool loading = true;
  bool noData = false;
  List<CharacterModel>? characterList;

  getData() async {
    print('goooooooooooo');
    loading = true;
    emit(LoadingGetDataState());

    try {
      var response = await DioHelper.getData(url: '/api/characters', query: {});
      if (response.statusCode == 200) {
        characterList = (response.data as List)
            .map((e) => CharacterModel.fromJson(e))
            .toList();
        loading = false;
        emit(LoadingGetDataState());
        noData = false;
        emit(NODataState());
        print(response.statusCode);
        print('characterList num ======> ${characterList!.length}');
      }
      //----------------------
      else {
        print(response.statusCode);
        loading = false;
        emit(LoadingGetDataState());
        noData = true;
        emit(NODataState());
        print('Eroooooooooooooor in getting data');
      }
    } catch (e) {
      if (e is DioError) {
        internetConnect = false;
        emit(InternertConnectionState());
        print('Dio Errror no internet');
      }
      loading = false;
      emit(LoadingGetDataState());
      noData = true;
      emit(NODataState());
      print('Catch Error in getting data');
    }
  }

  //====================== Search =====================
  bool isSearch = false;
  changeSearch() {
    isSearch = !isSearch;
    emit(SearchState());
  }

  final searchController = TextEditingController();
  List<CharacterModel>? searchList = [];
  serch(value) {
    searchList!.clear();

    characterList!.forEach((element) {
      if (element.name!.toLowerCase().contains(value) ||
          element.name!.toUpperCase().contains(value)) {
        print(true);
        searchList!.add(element);
      }
    });
    emit(ListChangeState());
  }

  //===============================
  bool internetConnect = true;
  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      internetConnect = true;
      emit(InternertConnectionState());
      getData();
    } else {
      internetConnect = false;
      emit(InternertConnectionState());
      print('no internet');
    }
  }
}
