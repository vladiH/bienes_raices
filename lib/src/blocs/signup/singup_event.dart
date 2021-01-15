part of 'singup_bloc.dart';

class SingupEvent extends Equatable {
  @override
  List<Object> get props => [];
}

//Email Validate - Cambio del email
class EmailValidate extends SingupEvent {
  final String email;

  EmailValidate({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailValidate {email: $email}';
}

//Password Validate - Cambio del password
class PasswordValidate extends SingupEvent {
  final String password;

  PasswordValidate({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordValidate {password: $password}';
}

//Name Validate - Cambio de nombre
class NameValidate extends SingupEvent {
  final String name;

  NameValidate({@required this.name});

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'NameValidate {name: $name}';
}

//Lastname Validate - Cambio de apellido
class LastNameValidate extends SingupEvent {
  final String lastName;

  LastNameValidate({@required this.lastName});

  @override
  List<Object> get props => [lastName];

  @override
  String toString() => 'LastNameValidate {lastName: $lastName}';
}

//Name Validate - Cambio de nombre
class PhoneValidate extends SingupEvent {
  final String phone;

  PhoneValidate({@required this.phone});

  @override
  List<Object> get props => [phone];

  @override
  String toString() => 'PhoneValidate {lastName: $phone}';
}

//Submitted - presionar el boton registrar
class Submitted extends SingupEvent {
  final String email;
  final String password;
  final String name;
  final String lastName;
  final String phone;
  final String birthdate;
  final String gender;

  Submitted(
      {@required this.email,
      @required this.password,
      @required this.name,
      @required this.lastName,
      @required this.phone,
      @required this.birthdate,
      @required this.gender});
  @override
  List<Object> get props =>
      [email, password, name, lastName, phone, birthdate, gender];

  @override
  String toString() =>
      'Submitted{email:$email, password:$password, name:$name, lastName:$lastName, phone:$phone, birthdate:$birthdate, gender:$gender}';
}
