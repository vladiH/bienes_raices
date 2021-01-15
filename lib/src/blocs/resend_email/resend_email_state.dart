part of 'resend_email_bloc.dart';

class ResendEmailState extends Equatable {
  ResendEmailState();
  @override
  List<Object> get props => [];
}

class InitialResendEmail extends ResendEmailState {
  InitialResendEmail();
}

class LoadingResendEmail extends ResendEmailState {}

class SuccessResendEmail extends ResendEmailState {
  final String email;
  SuccessResendEmail({@required this.email});
  @override
  List<Object> get props => [email];
  @override
  String toString() => 'Success{email:$email}';
}

class FailureResendEmail extends ResendEmailState {
  final String error;
  FailureResendEmail({@required this.error});
  @override
  List<Object> get props => [error];
  @override
  String toString() => 'Failure{error:$error}';
}

class IsEmailValid extends ResendEmailState {
  final bool isEmailValid;
  IsEmailValid({@required this.isEmailValid});
  @override
  List<Object> get props => [isEmailValid];
  @override
  String toString() => 'IsEmailValid{IsEmailValid:$isEmailValid}';
}
