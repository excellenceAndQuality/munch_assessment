class LoginEvent {}

class PinEntered extends LoginEvent {
  final String enteredPin;
  final String userPin;

  PinEntered({required this.enteredPin, required this.userPin});
}

class PinBackSpace extends LoginEvent {
}

class PinCleared extends LoginEvent {
  final String enteredPin;

  PinCleared({required this.enteredPin});
}
