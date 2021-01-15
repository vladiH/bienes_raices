part of 'singup_bloc.dart';

class SingupState extends Equatable {
  // Definir variables
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isNameValid;
  final bool isLastNameValid;
  final bool isPhoneValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  bool get isFormValid =>
      isEmailValid &&
      isPasswordValid &&
      isNameValid &&
      isLastNameValid &&
      isPhoneValid;
  // Constructor
  SingupState({
    @required this.isEmailValid,
    @required this.isPasswordValid,
    @required this.isNameValid,
    @required this.isLastNameValid,
    @required this.isPhoneValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  SingupState copyWith(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isNameValid,
      bool isLastNameValid,
      bool isPhoneValid,
      bool isSubmitting,
      bool isSuccess,
      bool isFailure,
      String error,
      String email}) {
    return SingupState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isNameValid: isNameValid ?? this.isNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  factory SingupState.initial() {
    return SingupState(
      isEmailValid: true,
      isPasswordValid: true,
      isNameValid: true,
      isLastNameValid: true,
      isPhoneValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  SingupState loading() {
    return copyWith(
        /*isEmailValid: true,
        isPasswordValid: true,
        isNameValid: true,
        isLastNameValid: true,
        isPhoneValid: true,*/
        isSubmitting: true,
        isSuccess: false,
        isFailure: false);
  }

  SingupState success() {
    return copyWith(
      /*isEmailValid: true,
        isPasswordValid: true,
        isNameValid: true,
        isLastNameValid: true,
        isPhoneValid: true,*/
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  SingupState failure() {
    return copyWith(
      /*isEmailValid: true,
        isPasswordValid: true,
        isNameValid: true,
        isLastNameValid: true,
        isPhoneValid: true,*/
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  @override
  List<Object> get props => [
        isEmailValid,
        isPasswordValid,
        isNameValid,
        isLastNameValid,
        isPhoneValid,
        isSubmitting,
        isSuccess,
        isFailure,
      ];
}
