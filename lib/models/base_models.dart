class BaseModels<T> {
  int? status;
  bool? code;
  String? message;
  T? response;

  BaseModels({
    required this.status,
    required this.code,
    required this.message,
    this.response,
  });
}
