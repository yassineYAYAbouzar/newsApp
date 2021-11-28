abstract class NewsState {}
class NewInitailState extends NewsState{}
class NewBottomNavigationBarState extends NewsState{}
class NewGetbusinessLoadingState extends NewsState{}
class NewGetbusinessSucsessState extends NewsState{}
class NewGetbusinessErrorState extends NewsState{
  final String error ;

  NewGetbusinessErrorState(this.error);
}
class NewGetsportLoadingState extends NewsState{}
class NewGetsportSucsessState extends NewsState{}
class NewGetsportErrorState extends NewsState{
  final String error ;

  NewGetsportErrorState(this.error);
}
class NewGetscienceLoadingState extends NewsState{}
class NewGetscienceSucsessState extends NewsState{}
class NewGetscienceErrorState extends NewsState{
  final String error ;

  NewGetscienceErrorState(this.error);
}
class NewGetsearchLoadingState extends NewsState{}
class NewGetsearchSucsessState extends NewsState{}
class NewGetsearchErrorState extends NewsState{
  final String error ;

  NewGetsearchErrorState(this.error);
}