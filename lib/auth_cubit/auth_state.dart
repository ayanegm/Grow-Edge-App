abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final Map<String, dynamic>? data;
  AuthSuccessState({this.data});
}

class AuthFailureState extends AuthState {
  final String message;

  AuthFailureState({required this.message});
}
