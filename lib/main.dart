// ignore_for_file: prefer_const_constructors, missing_return
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapp/app/controller/appCubit/cubit.dart';
import 'package:newsapp/app/controller/appCubit/states.dart';
import 'package:newsapp/app/controller/cubit/cubit.dart';
import 'package:newsapp/app/service/remote/cache_helper.dart';
import 'package:newsapp/app/service/remote/dio_helper.dart';
import 'package:newsapp/app/view/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await GetStorage.init();
  await CachHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
     providers: [
       BlocProvider(
         create: (context)=> AppCubit()..seTisLight(
             fromStoreg:CachHelper.RedeTheme()
         ),
       ),
       BlocProvider(
           create: (context)=> NewsCubit()..getBusinessList()..getsearchList()
       ),
     ],
       child: BlocConsumer<AppCubit , AppState>(
            listener: (context,state){},
            builder: (context,state){
              var cubit = AppCubit.get(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  textTheme: TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    titleTextStyle: TextStyle(
                      color:Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    iconTheme:IconThemeData(
                      color: Colors.black
                    ) ,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark
                    )
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange
                  ),
                  primarySwatch: Colors.deepOrange,
                ),
                darkTheme:ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )
                  ),
                scaffoldBackgroundColor: Colors.black12,
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color:Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  iconTheme:IconThemeData(
                      color: Colors.white
                  ) ,
                  backgroundColor: Colors.black12,
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black12,
                  statusBarIconBrightness: Brightness.light
                  )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.black12,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange
                ),
                  primarySwatch: Colors.deepOrange,
                ) ,
                themeMode: cubit.isLight != true ? ThemeMode.dark : ThemeMode.light,
                home: HomePage(),
              );
            }
      ));


  }
}
