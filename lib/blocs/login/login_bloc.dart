import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  bool isPasswordChecked = false, isPasswordCorrect = false;
  String enteredPin = "";

  LoginBloc() : super(InitialState()) {
    on<PinEntered>(onPinEntered);
    on<PinBackSpace>(onPinBackSpace);
    on<PinCleared>(onPinCleared);
    on<ClearState>(onClearState);
  }

  void onPinEntered(PinEntered event, Emitter<LoginState> emit) async {

    if(enteredPin.length < 4){
      enteredPin += event.enteredPin.toString();
      isPasswordChecked = false;
      isPasswordCorrect = false;
    }
    if(enteredPin.length == 4){
      isPasswordChecked = true;
      isPasswordCorrect = false;
      if(enteredPin == event.userPin){
        isPasswordChecked = true;
        isPasswordCorrect = true;
      }else {
        isPasswordChecked = true;
        isPasswordCorrect = false;
      }
    }

    if(event.enteredPin.length < 4) {
      emit(UpdateState(isPasswordChecked, isPasswordCorrect, enteredPin));
    }

  }

  void onPinBackSpace(PinBackSpace event, Emitter<LoginState> emit) async {
    if(enteredPin.isNotEmpty) {
      enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      isPasswordChecked = false;
      isPasswordCorrect = false;
      emit(UpdateState(isPasswordChecked, isPasswordCorrect, enteredPin));
    }
  }

  void onPinCleared(PinCleared event, Emitter<LoginState> emit) async {
    enteredPin = '';
    isPasswordChecked = false;
    isPasswordCorrect = false;
    emit(UpdateState(isPasswordChecked, isPasswordCorrect, enteredPin));
  }

  void onClearState(ClearState event, Emitter<LoginState> emit) async {
    enteredPin = '';
    isPasswordChecked = false;
    isPasswordCorrect = false;
    emit(UpdateState(isPasswordChecked, isPasswordCorrect, ""));
  }


}

