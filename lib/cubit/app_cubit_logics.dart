
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_flutter/cubit/app_cubit_states.dart';
import 'package:travel_app_flutter/cubit/app_cubits.dart';
import 'package:travel_app_flutter/pages/detail_page.dart';
import 'package:travel_app_flutter/pages/home_page.dart';
import 'package:travel_app_flutter/pages/navPages/main_page.dart';
import 'package:travel_app_flutter/pages/welcome_page.dart';

class AppLogicStates extends StatefulWidget {
  const AppLogicStates({Key? key}) : super(key: key);

  @override
  State<AppLogicStates> createState() => _AppLogicStatesState();
}

class _AppLogicStatesState extends State<AppLogicStates> {
  get builder => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit,CubitStates>(builder:(context,state){
          if(state is WelcomeState){
            return const WelcomePage();
          }if(state is LoadingState){

            return const Center(child: CircularProgressIndicator());
          }if(state is LoadedState){

            return const MainPage();
          }if(state is DetailState){

            return const DeatilPage();
          }else{
            return Container();
          }

      }),


    );
  }
}