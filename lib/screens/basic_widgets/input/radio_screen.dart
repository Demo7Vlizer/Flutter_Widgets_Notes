import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int selectedValue1 = 1;
  String selectedValue2 = 'option1';
  int selectedValue3 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children: [
          // Basic Radio Buttons
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Basic Radio Buttons',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Simple radio button group',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: selectedValue1,
                      onChanged: (int? value) {
                        setState(() {
                          selectedValue1 = value!;
                        });
                      },
                    ),
                    const Text('Option 1'),
                    Radio<int>(
                      value: 2,
                      groupValue: selectedValue1,
                      onChanged: (int? value) {
                        setState(() {
                          selectedValue1 = value!;
                        });
                      },
                    ),
                    const Text('Option 2'),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('''
Radio<int>(
  value: 1,
  groupValue: selectedValue,
  onChanged: (int? value) {
    setState(() {
      selectedValue = value!;
    });
  },
),'''),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Colored Radio Buttons
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Colored Radio Buttons',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Radio buttons with custom colors',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Radio<String>(
                      value: 'option1',
                      groupValue: selectedValue2,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue2 = value!;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    const Text('Green'),
                    Radio<String>(
                      value: 'option2',
                      groupValue: selectedValue2,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue2 = value!;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    const Text('Blue'),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('''
Radio<String>(
  value: 'option1',
  groupValue: selectedValue,
  onChanged: (String? value) {
    setState(() {
      selectedValue = value!;
    });
  },
  activeColor: Colors.green,
),'''),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // RadioListTile
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'RadioListTile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Radio button with title and subtitle',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                RadioListTile<int>(
                  value: 1,
                  groupValue: selectedValue3,
                  onChanged: (int? value) {
                    setState(() {
                      selectedValue3 = value!;
                    });
                  },
                  title: const Text('Option One'),
                  subtitle: const Text('This is option one'),
                  secondary: const Icon(Icons.looks_one),
                ),
                RadioListTile<int>(
                  value: 2,
                  groupValue: selectedValue3,
                  onChanged: (int? value) {
                    setState(() {
                      selectedValue3 = value!;
                    });
                  },
                  title: const Text('Option Two'),
                  subtitle: const Text('This is option two'),
                  secondary: const Icon(Icons.looks_two),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('''
RadioListTile<int>(
  value: 1,
  groupValue: selectedValue,
  onChanged: (int? value) {
    setState(() {
      selectedValue = value!;
    });
  },
  title: Text('Option One'),
  subtitle: Text('This is option one'),
  secondary: Icon(Icons.looks_one),
),'''),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 