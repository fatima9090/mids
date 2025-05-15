import 'package:flutter/material.dart';
import 'screen.dart';
import 'home.dart';

class File1Page extends StatelessWidget {
  const File1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer App'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.indigo),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Screen()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/edu.jpeg'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Go to Data Screen',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to Drawer App!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
