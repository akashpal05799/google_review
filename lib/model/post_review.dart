// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ReviewResponse welcomeFromJson(String str) => ReviewResponse.fromJson(json.decode(str));

String welcomeToJson(ReviewResponse data) => json.encode(data.toJson());

class ReviewResponse {
  ReviewResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) => ReviewResponse(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.reviewerName,
    required this.review,
    required this.stars,
    required this.platform,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String reviewerName;
  String review;
  String stars;
  String platform;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        reviewerName: json["reviewer_name"],
        review: json["review"],
        stars: json["stars"],
        platform: json["platform"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "reviewer_name": reviewerName,
        "review": review,
        "stars": stars,
        "platform": platform,
      };
}
