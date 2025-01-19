import 'package:flutter/material.dart';

class ActivateCodeModels {
  ActivateCodeResponse models;
  TextEditingController controller;

  ActivateCodeModels({
    required this.models,
    required this.controller,
  });
}

class ActivateCodeResponse {
  int error;
  String code;
  String partnerName;

  ActivateCodeResponse({
    required this.error,
    required this.code,
    required this.partnerName,
  });
}
