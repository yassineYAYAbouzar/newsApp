import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/app/controller/appCubit/cubit.dart';
import 'package:newsapp/app/controller/cubit/cubit.dart';
import 'package:newsapp/app/controller/cubit/states.dart';
import 'package:newsapp/app/view/search_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
     BlocConsumer<NewsCubit , NewsState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: Text('News App'),
              actions: [
                IconButton(onPressed: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );}, icon: Icon(Icons.search)),
                IconButton(onPressed: (){AppCubit.get(context).seTisLight() ; }, icon: Icon(Icons.brightness_4_outlined)),
              ],
            ),
           bottomNavigationBar: BottomNavigationBar(
             currentIndex:cubit.currentIndex ,
             onTap: (index){
               cubit.changeCurentBottomBar(index);
             },
             items: cubit.bottomItems,
           ),
            body: cubit.screenItems[cubit.currentIndex],
          );
        },
      );

  }
}
