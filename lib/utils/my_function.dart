clearPhoneMask(String phoneNumber) {
  phoneNumber = phoneNumber.replaceAll("(", "");
  phoneNumber = phoneNumber.replaceAll(")", "");
  phoneNumber = phoneNumber.replaceAll("-", "");
  phoneNumber = phoneNumber.replaceAll(" ", "");
  return phoneNumber;
}

clearPasswordMask(String password) {
  password = password.replaceAll("(", "");
  password = password.replaceAll(")", "");
  password = password.replaceAll("-", "");
  password = password.replaceAll(" ", "");
  return password;
}
