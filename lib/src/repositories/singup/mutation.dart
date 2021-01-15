String mutationSingUp() {
  return (r"""
      mutation createUser($usuario:InputUserPerson!){
      signUp(usuario:$usuario){
        success,
        message,
        updates,
        token,
        errors{
          message,
          path
        }
      }
    }
    """);
}

String mutationConfirmationCode(String email, String emailToken) {
  return ("""
  mutation{
  confirmEmail(email:"$email", email_token:"$emailToken"){
    success,
    message,
    updates,
    token,
    errors{
      message,
      path
    },
    data{
      id_usuario,
      id_rol,
      password,
      email,
      estado,
      fecha_creacion,
      fecha_actualizacion,
      email_token,
    }
  }
 }""");
}

String mutationChangeEmailToken(String email) {
  return ("""mutation {
    changeEmailToken(email:"$email"){
      success,
      message,
      updates,
      token,
      errors{
        message,
        path
      },
      data{
        id_usuario,
        id_rol,
        password,
        email,
        estado,
        fecha_creacion,
        fecha_actualizacion,
        email_token,
      }
    }
  }""");
}
