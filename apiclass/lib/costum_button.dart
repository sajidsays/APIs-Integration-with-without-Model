import 'package:apiclass/home.dart';
import 'package:apiclass/photos_model.dart';
import 'package:apiclass/user_model.dart';
import 'package:flutter/material.dart';

class Costumbutton extends StatelessWidget {
  const Costumbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation to APIs'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text('API with Plugin Model')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhotosModel()));
                },
                child: const Text('API with Costum Model')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserModel()));
                },
                child: const Text('API with No Model'))
          ],
        ),
      ),
    );
  }
}
