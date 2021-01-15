part of 'code_bloc.dart';

class CodeState extends Equatable {
  final String error;
  CodeState({@required this.error});
  @override
  List<Object> get props => [];
}

class Initial extends CodeState {}

class Loading extends CodeState {}

class Success extends CodeState {}

class Failure extends CodeState {
  final String error;
  Failure({@required this.error});
  @override
  List<Object> get props => [error];
  @override
  String toString() => 'Failure{error:$error}';
}
