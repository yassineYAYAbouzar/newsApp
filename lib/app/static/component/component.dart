// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/app/controller/cubit/cubit.dart';
import 'package:newsapp/app/controller/cubit/states.dart';
import 'package:newsapp/app/view/web_view_screen.dart';

Widget buildeArticeles(dynamic article,context )=> Container(
  child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: (){Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WebViewScreen(url:article['url'])),
        );},
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image:NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(article['title'],
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(article['publishedAt'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
  ),
);

Widget buildCategoryArticle(dynamic category, BuildContext context) => BlocConsumer<NewsCubit,NewsState>(
  listener: (context,state){},
  builder: (context, state){
    var List ;
    if(category == "science") List=NewsCubit.get(context).science;
    if(category == "sport") List=NewsCubit.get(context).sport;
    if(category == "business") List=NewsCubit.get(context).business;
    if(category == "search") List=NewsCubit.get(context).search;

    if(List.isEmpty){
      return Center(child: CircularProgressIndicator());
    }else{
      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context ,index)=>buildeArticeles(List[index],context),
          separatorBuilder:(context , index)=>Divider(height: 2,),
          itemCount: List.length
      );
    }
  },
);