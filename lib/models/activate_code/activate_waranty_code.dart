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
  int id;
  String info;
  int status;
  String code;
  String status_label;
  List<ActivateCodePartnersResponse> partners;

  ActivateCodeResponse({
    required this.id,
    required this.info,
    required this.status,
    required this.code,
    required this.status_label,
    required this.partners,
  });

  factory ActivateCodeResponse.fromJson(Map<String, dynamic> json) {
    return ActivateCodeResponse(
      id: json['id'],
      info: json['info'],
      status: json['status'],
      code: json['code'],
      status_label: json['status_label'],
      partners: (json['partners'] as List<dynamic>)
          .map((partner) => ActivateCodePartnersResponse.fromJson(partner))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'info': info,
      'status': status,
      'code': code,
      'status_label': status_label,
      'partners': partners.map((partner) => partner.toJson()).toList(),
    };
  }
}

class ActivateCodePartnersResponse {
  int partner_id;
  String partner_name;

  ActivateCodePartnersResponse({
    required this.partner_id,
    required this.partner_name,
  });

  factory ActivateCodePartnersResponse.fromJson(Map<String, dynamic> json) {
    return ActivateCodePartnersResponse(
      partner_id: json['partner_id'],
      partner_name: json['partner_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'partner_id': partner_id,
      'partner_name': partner_name,
    };
  }
}
