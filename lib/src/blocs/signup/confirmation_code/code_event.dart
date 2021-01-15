part of 'code_bloc.dart';

class CodeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SubmitCode extends CodeEvent {
  final String email;
  final String code;
  SubmitCode({@required this.email, @required this.code});
  @override
  List<Object> get props => [email, code];
  @override
  String toString() {
    return 'SubmitCode{email:$email, code:$code}';
  }
}
