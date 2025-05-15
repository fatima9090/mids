import 'package:flutter/material.dart';
import 'file1.dart'; // Make sure file1.dart is in the lib folder

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Navigation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: File1Page(), // Starting page with drawer
    );
  }
}

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

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _subjectController = TextEditingController();
  final _teacherController = TextEditingController();
  final _creditController = TextEditingController();

  String? subject, teacher, credit;

  void _submitData() {
    setState(() {
      subject = _subjectController.text.trim();
      teacher = _teacherController.text.trim();
      credit = _creditController.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Entry'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/edu.jpeg'),
                ),
                const SizedBox(height: 20),
                _buildTextField(_subjectController, 'Subject Name'),
                const SizedBox(height: 10),
                _buildTextField(_teacherController, 'Teacher Name'),
                const SizedBox(height: 10),
                _buildTextField(_creditController, 'Credit Hours', isNumber: true),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _submitData,
                  icon: const Icon(Icons.save),
                  label: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 30),
                if (subject != null && teacher != null && credit != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("📘 Subject: $subject", style: _infoStyle()),
                      Text("👩‍🏫 Teacher: $teacher", style: _infoStyle()),
                      Text("📊 Credit Hours: $credit", style: _infoStyle()),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  TextStyle _infoStyle() => const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87);
}

import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF5F5), // Light background
      appBar: AppBar(
        backgroundColor: const Color(0xFF006400), // Dark green
        elevation: 4,
        title: const Text(
          'Hello First Project',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),  // Drawer yahan add kiya
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF228B22),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Show()),
            );
          },
          child: const Text(
            'View Pakistan Flag',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class Show extends StatelessWidget {
  const Show({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF006400),
        elevation: 4,
        title: const Text(
          'Pakistan Flag',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),  // Drawer yahan bhi add kiya
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Image.asset(
            'assets/images/flag.jpeg',
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

// Drawer Widget - reusable for both screens
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF006400),
            ),
            child: const Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Drawer band karein
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Screen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.flag),
            title: const Text('Flag'),
            onTap: () {
              Navigator.pop(context); // Drawer band karein
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Show()),
              );
            },
          ),
        ],
      ),
    );
  }
}
