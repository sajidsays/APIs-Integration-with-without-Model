import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotosModel extends StatefulWidget {
  const PhotosModel({super.key});

  @override
  State<PhotosModel> createState() => _PhotosModelState();
}

class _PhotosModelState extends State<PhotosModel> {
  List<Photos> photosList = [];
  Future<List<Photos>> getPhotosApi() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        photosList.add(photos);
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API with Costum Model'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotosApi(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      heightFactor: 12,
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.red),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: photosList.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index].url.toString()),
                            ),
                            title: Text(snapshot.data![index].id.toString()),
                            subtitle:
                                Text(snapshot.data![index].title.toString()),
                          );
                        }));
                  }
                }),
          )
        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  int id;

  Photos({required this.title, required this.url, required this.id});
}
