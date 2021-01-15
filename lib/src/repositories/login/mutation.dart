String login() {
  return (r"""
      mutation User($usuario:InputUser!){
        logIn(usuario:$usuario){
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
            persona{
              id_usuario,
              nombres,
              apellidos,
              sexo,
              fecha_nacimiento
            }
          }
        }
      }
    """);
}
