class LoginState {}

class InitialState extends LoginState {
}

class UpdateState extends LoginState {
  final bool passwordChecked;
  final bool passwordCorrect;
  final String enteredPin;
  UpdateState(this.passwordChecked, this.passwordCorrect, this.enteredPin);
}