class BaseModels<T> {
  int status;
  bool code;
  String message;
  T? response;

  BaseModels(
    this.status,
    this.code,
    this.message,
    this.response,
  );
}
