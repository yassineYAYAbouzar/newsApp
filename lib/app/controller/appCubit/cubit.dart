


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/app/controller/appCubit/states.dart';
import 'package:newsapp/app/service/remote/cache_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppnitailState());

  static AppCubit get(context) =>BlocProvider.of(context);

  bool isLight = true;

  void seTisLight({bool fromStoreg}) {
    if(fromStoreg != null)
      isLight = fromStoreg;
    else
    isLight = !isLight;
    CachHelper.changeTheme(value: isLight);
    emit(AppChangeThemeState());
  }

}

