import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
import 'model/post_model2.dart';

class GoogleReview extends StatefulWidget {
  const GoogleReview({Key? key}) : super(key: key);

  @override
  State<GoogleReview> createState() => _GetDataState();
}

class _GetDataState extends State<GoogleReview> {
  Future<List<Data>> fetchPost() async {
    final response = await http
        .get(Uri.parse('http://212.24.96.194/api/reviews?platform=google'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var result = (data['data'] as List).map((e) => Data.fromJson(e)).toList();
      print(result);
      return result;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GOOGLE REVIEW',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xffEA8C17),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
        ),
      ),
      body: Container(
        child: FutureBuilder<List<Data>>(
          future: fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                        border: const Border(
                            bottom: const BorderSide(
                                color: Colors.grey, width: 1.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/google.png',
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "${snapshot.data![index].reviewer_name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text("${snapshot.data![index].review}"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
