import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserModel extends StatefulWidget {
  const UserModel({super.key});

  @override
  State<UserModel> createState() => _UserModelState();
}

var data;

class _UserModelState extends State<UserModel> {
  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API with No Model'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      heightFactor: 12,
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.red),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                ReusableRow(
                                    title: "Name",
                                    value: data[index]['name'].toString()),
                                ReusableRow(
                                    title: "Username",
                                    value: data[index]['username'].toString()),
                                ReusableRow(
                                    title: "Email",
                                    value: data[index]['email'].toString()),
                                ReusableRow(
                                    title: "Address",
                                    value: data[index]['address']['street']
                                        .toString()),
                                ReusableRow(
                                    title: "Latitute",
                                    value: data[index]['address']['geo']['lat']
                                        .toString()),
                                ReusableRow(
                                    title: "Longitute",
                                    value: data[index]['address']['geo']['lng']
                                        .toString())
                              ],
                            ),
                          );
                        });
                  }
                })),
          )
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}
