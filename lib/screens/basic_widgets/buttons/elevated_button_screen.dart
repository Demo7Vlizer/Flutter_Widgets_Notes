import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/example_section.dart';

class ElevatedButtonScreen extends StatelessWidget {
  const ElevatedButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ElevatedButton'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Material Design elevated button',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: null,
                child: const Text('Disabled'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Enabled'),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('With Icon'),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Code', style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('''
ElevatedButton(
  onPressed: null, // Disabled
  child: Text('Disabled'),
),
ElevatedButton(
  onPressed: () {
    // Handle press
  },
  child: Text('Enabled'),
),
ElevatedButton.icon(
  icon: Icon(Icons.add),
  label: Text('With Icon'),
  onPressed: () {
    // Handle press
  },
),'''),
          ),
        ],
      ),
    );
  }
} 