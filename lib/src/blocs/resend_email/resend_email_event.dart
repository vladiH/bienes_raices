part of 'resend_email_bloc.dart';

class ResendEmailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendEmailEvent extends ResendEmailEvent {
  final String email;
  SendEmailEvent({@required this.email});
  @override
  List<Object> get props => [email];
  @override
  String toString() => 'SendEmailEvent{email:$email}';
}

//Email Validate - Cambio del email
class EmailValidate extends ResendEmailEvent {
  final String email;

  EmailValidate({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailValidate {email: $email}';
}
