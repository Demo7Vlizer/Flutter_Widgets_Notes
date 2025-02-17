import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidgetsScreen extends GetView {
  const ButtonWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Widgets'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        color: Colors.grey[50], // Light background color
        child: ListView(
          children: [
            _buildButtonItem(
              'ElevatedButton',
              'Material Design elevated button',
              '/basic/buttons/elevated',
            ),
            const Divider(height: 1),
            _buildButtonItem(
              'TextButton',
              'Material Design text button',
              '/basic/buttons/text',
            ),
            const Divider(height: 1),
            _buildButtonItem(
              'OutlinedButton',
              'Material Design outlined button',
              '/basic/buttons/outlined',
            ),
            const Divider(height: 1),
            _buildButtonItem(
              'IconButton',
              'A button with an icon',
              '/basic/buttons/icon',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonItem(String title, String subtitle, String route) {
    return Material(
      color: Colors.white,
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Get.toNamed(route),
      ),
    );
  }
} 