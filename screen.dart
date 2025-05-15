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
