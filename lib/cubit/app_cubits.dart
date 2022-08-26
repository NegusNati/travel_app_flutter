// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_app_flutter/cubit/app_cubit_states.dart';
import 'package:travel_app_flutter/services/data_services.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit(
  { required  this.dataNet}
  ) : super(InitalState()) {
    emit(WelcomeState());
  }

final DataServices dataNet;
late final places;
  void getData() async {

    try{
      emit(LoadingState());
      places = await dataNet.getInfo();
      emit(LoadedState(places));

    }catch(e){

    }
  }
}
