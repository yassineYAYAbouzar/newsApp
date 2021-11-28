// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, missing_return, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/app/controller/cubit/cubit.dart';
import 'package:newsapp/app/controller/cubit/states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final url ;
   WebViewScreen({this.url});
  @override
  Widget build(BuildContext context) {
  return  BlocConsumer<NewsCubit,NewsState>(
    listener: (context,state){},
    builder: (context, state){
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      )
    );
  }
  );
  }
}
