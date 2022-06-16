import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'model/bussiness_model.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BusinessScreen(),
  ));
}

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);
  @override
  State<BusinessScreen> createState() => _BusinessScreen();
}

class _BusinessScreen extends State<BusinessScreen> {
  Future<List<Bussiness>> fetchPost() async {
    final response =
        await http.get(Uri.parse('http://212.24.96.194/api/business'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var result =
          (data['data'] as List).map((e) => Bussiness.fromJson(e)).toList();
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
          backgroundColor: Colors.orangeAccent,
          title: Text(
            "BUSINESS",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
        ),
        body: Container(
          child: FutureBuilder<List<Bussiness>>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage("assets/Rectangle -1.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data![index].owner_name}",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("${snapshot.data![index].company_name}"),
                          Text("${snapshot.data![index].address}"),
                          Text("${snapshot.data![index].email_id}"),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
