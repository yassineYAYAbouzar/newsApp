import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/app/controller/cubit/states.dart';
import 'package:newsapp/app/service/remote/dio_helper.dart';
import 'package:newsapp/app/view/business_screen.dart';
import 'package:newsapp/app/view/scienece_screen.dart';
import 'package:newsapp/app/view/sport_screen.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewInitailState());

  static NewsCubit get(context) =>BlocProvider.of(context);

  int currentIndex = 0;
  //bottomItems

  List<BottomNavigationBarItem> bottomItems =[
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball),label: 'sports')
  ];

  //screenItems

  List<Widget> screenItems =[
    BusinessScreen(),
    ScienceScreen(),
    SportScreen()
  ];

  //CurentBottomBar

  void changeCurentBottomBar(int index){
    currentIndex = index;
    if(index==1){
      getScienceList();
    }
    if(index==2){
      getSportList();
    }
    emit(NewBottomNavigationBarState());
  }
  //articles
  //business
  List<dynamic> _business =[];
  void getBusinessList(){
    emit(NewGetbusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'ma',
        'category':'business',
        'apikey': '98c60a6b0b874aca94852c563b66f340'
      },
    ).then((value){
      _business = value.data['articles'];
      emit(NewGetbusinessSucsessState());
      print(_business.length);
    }).catchError((onError){
      print(onError.toString());
      emit(NewGetbusinessErrorState(onError.toString()));
    });
  }
  //science
  List<dynamic> _science =[];
  void getScienceList(){
    emit(NewGetscienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'ma',
        'category':'science',
        'apikey': '98c60a6b0b874aca94852c563b66f340'
      },
    ).then((value){
      _science = value.data['articles'];
      emit(NewGetscienceSucsessState());
      print(_science.length);
    }).catchError((onError){
      print(onError.toString());
      emit(NewGetscienceErrorState(onError.toString()));
    });
  }
  //sport
  List<dynamic> _sport =[];
  void getSportList(){
    emit(NewGetsportLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'ma',
        'category':'sports',
        'apikey': '98c60a6b0b874aca94852c563b66f340'
      },
    ).then((value){
      _sport = value.data['articles'];
      emit(NewGetsportSucsessState());
      print(_sport.length);
    }).catchError((onError){
      print(onError.toString());
      emit(NewGetsportErrorState(onError.toString()));
    });
  }  //sport
  List<dynamic> _search =[];
  void getsearchList({q}){
    emit(NewGetsearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q':'$q',
        'apikey': '98c60a6b0b874aca94852c563b66f340'
      },
    ).then((value){
      _search = value.data['articles'];
      emit(NewGetsearchSucsessState());
      print(_search.length);
    }).catchError((onError){
      print(onError.toString());
      emit(NewGetsearchErrorState(onError.toString()));
    });
  }
  //getters
  List<dynamic> get science => _science;
  List<dynamic> get business => _business;
  List<dynamic> get sport => _sport;
  List<dynamic> get search => _search;
}

