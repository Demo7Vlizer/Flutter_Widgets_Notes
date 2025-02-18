import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../../widgets/example_section.dart';

class TextButtonScreen extends StatelessWidget {
  const TextButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextButton'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Material Design text button',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: null,
                child: const Text('Disabled'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: const Text('Enabled'),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
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
TextButton(
  onPressed: null, // Disabled
  child: Text('Disabled'),
),
TextButton(
  onPressed: () {
    // Handle press
  },
  child: Text('Enabled'),
),
TextButton.icon(
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