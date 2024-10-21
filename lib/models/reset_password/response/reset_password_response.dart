class ResetPasswordResponse {
  String phone;
  String code;
  String password;
  String password_repeat;

  ResetPasswordResponse(
    this.phone,
    this.code,
    this.password,
    this.password_repeat,
  );
}
