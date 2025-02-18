import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../../widgets/example_section.dart';

class OutlinedButtonScreen extends StatelessWidget {
  const OutlinedButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OutlinedButton'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Material Design outlined button',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(
                onPressed: null,
                child: const Text('Disabled'),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  Get.snackbar(
                    'Pressed!',
                    'You pressed the outlined button',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: const Text('Enabled'),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('With Icon'),
                onPressed: () {
                  Get.snackbar(
                    'Pressed!',
                    'You pressed the icon outlined button',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
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
OutlinedButton(
  onPressed: null, // Disabled
  child: Text('Disabled'),
),
OutlinedButton(
  onPressed: () {
    // Handle press
  },
  child: Text('Enabled'),
),
OutlinedButton.icon(
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