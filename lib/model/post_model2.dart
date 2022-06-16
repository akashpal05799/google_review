import 'dart:convert';

class GoogleReview {
  int? status;
  String? message;
  List<Data> data;
  //this is constructor:

  GoogleReview({this.status, this.message, required this.data});

  factory GoogleReview.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();

    return GoogleReview(
      status: json['status'],
      message: json['message'],
      data: dataList,
    );
  }
}

class Data {
  int? id;
  String? created_at;
  String? updated_at;
  String? reviewer_name;
  String? review;
  String? stars;
  String? platform;

//this is constructor:
  Data(
      {this.id,
      this.created_at,
      this.updated_at,
      this.reviewer_name,
      this.review,
      this.stars,
      this.platform});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      reviewer_name: json['reviewer_name'],
      review: json['review'],
      stars: json['stars'],
      platform: json['platform'],
    );
  }
}
