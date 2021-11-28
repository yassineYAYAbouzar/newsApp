// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, missing_return, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/app/controller/cubit/cubit.dart';
import 'package:newsapp/app/controller/cubit/states.dart';
import 'package:newsapp/app/static/component/component.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var enets ;
  @override
  Widget build(BuildContext context) {
  return  BlocConsumer<NewsCubit,NewsState>(
    listener: (context,state){},
    builder: (context, state){
      var cubit = NewsCubit.get(context);
    return Scaffold(
      appBar: AppBar(),
      body:  ListView(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  validator: (value){
                    if(value.isEmpty){
                      return 'the Value Cant be empty';
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: 'Search',
                  ),
                  onChanged: (value){
                    cubit.getsearchList(q: value);
                  },
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height -60,
              child:  buildCategoryArticle("search",context),
            ),
          ],
        )
    );
  }
  );
  }
}
