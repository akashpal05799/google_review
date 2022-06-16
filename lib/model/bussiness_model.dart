import 'dart:convert';

class BussinessReview {
  int? status;
  String? message;
  List<Bussiness> bussiness;

  BussinessReview({this.status, this.message, required this.bussiness});

  factory BussinessReview.fromJson(Map<String, dynamic> json) {
    var list = json['bussiness'] as List;
    List<Bussiness> bussinesslist =
        list.map((i) => Bussiness.fromJson(i)).toList();

    return BussinessReview(
      status: json['status'],
      message: json['message'],
      bussiness: bussinesslist,
    );
  }
}

class Bussiness {
  int? id;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  String? owner_name;
  String? company_name;
  String? company_logo;
  String? email_id;
  // int? phone;
  String? description;
  String? address;

  Bussiness({
    this.id,
    this.created_at,
    this.updated_at,
    this.deleted_at,
    this.owner_name,
    this.company_name,
    this.company_logo,
    this.email_id,
    //this.phone,
    this.description,
    this.address,
  });

  factory Bussiness.fromJson(Map<String, dynamic> json) {
    return Bussiness(
      id: json['id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      deleted_at: json['deleted_at'],
      owner_name: json['owner_name'],
      company_name: json['company_name'],
      company_logo: json['company_logo'],
      email_id: json['email_id'],
      // phone: json[int.parse('phone')],
      description: json['description'],
      address: json['address'],
    );
  }
}
