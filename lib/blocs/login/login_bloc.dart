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
  }

  void onPinEntered(PinEntered event, Emitter<LoginState> emit) async {

    if(event.enteredPin.length < 4){
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

    if(enteredPin.length < 4) {
      emit(UpdateState(isPasswordChecked, isPasswordCorrect, enteredPin));
    }

    print("Update State: " + enteredPin.length.toString());

  }

  void onPinBackSpace(PinBackSpace event, Emitter<LoginState> emit) async {
    if(enteredPin.isNotEmpty) {
      enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      isPasswordChecked = false;
      isPasswordCorrect = false;
      emit(UpdateState(isPasswordChecked, isPasswordCorrect, enteredPin));
      print("Back Space first: " + enteredPin.length.toString());
    }else if(enteredPin.isNotEmpty && enteredPin.length == 5){
      enteredPin = enteredPin.substring(0, enteredPin.length - 2);
      isPasswordChecked = false;
      isPasswordCorrect = false;
      emit(UpdateState(isPasswordChecked, isPasswordCorrect, enteredPin));
      print("Back Space second: " + enteredPin.length.toString());
    }



  }

  void onPinCleared(PinCleared event, Emitter<LoginState> emit) async {
    enteredPin = '';
    isPasswordChecked = false;
    isPasswordCorrect = false;
    emit(UpdateState(isPasswordChecked, isPasswordCorrect, enteredPin));
    print("Pin cleared: " + enteredPin.length.toString());
  }

}

