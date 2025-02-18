import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../../widgets/example_section.dart';

class IconButtonScreen extends StatelessWidget {
  const IconButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IconButton'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'A button with an icon',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: null, // Disabled state
              ),
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  Get.snackbar(
                    'Pressed!',
                    'You pressed the favorite icon',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Get.snackbar(
                    'Pressed!',
                    'You pressed the add icon',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  Get.snackbar(
                    'Pressed!',
                    'You pressed the delete icon',
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
IconButton(
  icon: Icon(Icons.favorite),
  onPressed: null, // Disabled
),
IconButton(
  icon: Icon(Icons.favorite),
  onPressed: () {
    // Handle press
  },
),
IconButton(
  icon: Icon(Icons.add),
  onPressed: () {
    // Handle press
  },
),
IconButton(
  icon: Icon(Icons.delete),
  color: Colors.red,
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