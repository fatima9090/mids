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
