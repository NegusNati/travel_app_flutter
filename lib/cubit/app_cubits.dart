import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_flutter/cubit/app_cubit_states.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit() : super(InitalState()) {
    emit(WelcomeState());
  }
}
