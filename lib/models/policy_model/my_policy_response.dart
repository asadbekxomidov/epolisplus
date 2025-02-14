import 'package:epolisplus/models/policy_model/driver_summary_response.dart';

import 'company_model.dart';

class MyPolicyModel {
  int? status;
  int? policy_type;
  String? anketa_id;
  int? id;
  String? policy;
  CompanyModel? company;
  String? links;
  String? start_date;
  String? end_date;
  String? marka;
  String? gov_number;
  String? program;
  String? payment_sum;
  String? insurance_sum;
  String? app_full_name;
  String? activity;
  String? warranty_name;
  String? phone;
  List<String>? services;
  List<String>? countries;
  List<DriverResponseMyPolicy>? drivers;

  MyPolicyModel({
    this.anketa_id = "",
    this.status = 0,
    this.id = 0,
    this.policy = "",
    this.company,
    this.start_date = "",
    this.end_date = "",
    this.policy_type = 0,
    this.marka = "",
    this.gov_number = "",
    this.program = "",
    this.links = "",
    this.payment_sum = "",
    this.insurance_sum = "",
    this.app_full_name = "",
    this.activity = "",
    this.warranty_name = "",
    this.phone = "",
    this.services,
    this.countries,
    this.drivers,
  });

  factory MyPolicyModel.fromJson(Map<String, dynamic> json) {
    return MyPolicyModel(
      anketa_id: json['anketa_id'],
      status: json['status'],
      id: json['id'],
      policy: json['policy'],
      company: CompanyModel.fromJson(json['company']),
      start_date: json['start_date'],
      end_date: json['end_date'],
      policy_type: json['policy_type'],
      marka: json['marka'],
      gov_number: json['gov_number'],
      program: json['program'],
      links: json['links'],
      app_full_name: json['app_full_name'],
      payment_sum: json['payment_sum'],
      insurance_sum: json['insurance_sum'],
      activity: json['activity'],
      warranty_name: json['warranty_name'],
      phone: json['phone'],
      services: json['services'] == null
          ? []
          : (json['services'] as List).map((e) => e as String).toList(),
      countries: json['countries'] == null
          ? []
          : (json['countries'] as List).map((e) => e as String).toList(),
      drivers: json['drivers'] == null
          ? []
          : DriverResponseMyPolicy.fromListJson(json['drivers']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['anketa_id'] = this.anketa_id;
    data['status'] = this.status;
    data['id'] = this.id;
    data['policy'] = this.policy;
    data['company'] = this.company;
    data['start_date'] = this.start_date;
    data['end_date'] = this.end_date;
    data['policy_type'] = this.policy_type;
    data['marka'] = this.marka;
    data['gov_number'] = this.gov_number;
    data['program'] = this.program;
    data['links'] = this.links;
    data['payment_sum'] = this.payment_sum;
    data['insurance_sum'] = this.insurance_sum;
    data['services'] = this.services;
    data['countries'] = this.countries;
    data['activity'] = this.activity;
    data['warranty_name'] = this.warranty_name;
    data['phone'] = this.phone;
    data['app_full_name'] = this.app_full_name;
    data['drivers'] = this.drivers!.map((v) => v.toJson()).toList();
    return data;
  }
}
