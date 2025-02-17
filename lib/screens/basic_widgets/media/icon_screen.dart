import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/example_section.dart';

class IconScreen extends StatelessWidget {
  const IconScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Material Design icons',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          ExampleSection(
            title: 'Basic Icons',
            description: 'Simple icon examples with different sizes',
            example: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                Icon(Icons.favorite),
                Icon(Icons.favorite, size: 30),
                Icon(Icons.favorite, size: 40),
              ],
            ),
            codeSnippet: '''
Icon(Icons.favorite),
Icon(Icons.favorite, size: 30),
Icon(Icons.favorite, size: 40),''',
          ),
          const SizedBox(height: 16),
          ExampleSection(
            title: 'Colored Icons',
            description: 'Icons with different colors',
            example: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.favorite, color: Colors.red),
                Icon(Icons.thumb_up, color: Colors.blue),
                Icon(Icons.check_circle, color: Colors.green),
              ],
            ),
            codeSnippet: '''
Icon(Icons.star, color: Colors.yellow),
Icon(Icons.favorite, color: Colors.red),
Icon(Icons.thumb_up, color: Colors.blue),
Icon(Icons.check_circle, color: Colors.green),''',
          ),
          const SizedBox(height: 16),
          ExampleSection(
            title: 'Common Icons',
            description: 'Frequently used Material icons',
            example: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                Icon(Icons.home),
                Icon(Icons.settings),
                Icon(Icons.search),
                Icon(Icons.person),
                Icon(Icons.notifications),
                Icon(Icons.menu),
                Icon(Icons.share),
                Icon(Icons.delete),
                Icon(Icons.edit),
                Icon(Icons.add),
                Icon(Icons.close),
                Icon(Icons.more_vert),
              ],
            ),
            codeSnippet: '''
Icon(Icons.home),
Icon(Icons.settings),
Icon(Icons.search),
Icon(Icons.person),
Icon(Icons.notifications),
Icon(Icons.menu),
Icon(Icons.share),
Icon(Icons.delete),
Icon(Icons.edit),
Icon(Icons.add),
Icon(Icons.close),
Icon(Icons.more_vert),''',
          ),
        ],
      ),
    );
  }
} 