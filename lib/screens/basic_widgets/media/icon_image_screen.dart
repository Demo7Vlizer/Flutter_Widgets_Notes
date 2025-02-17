import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconImageScreen extends GetView {
  const IconImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon & Image Widgets'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        color: Colors.grey[50],
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Widgets for displaying icons and images',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            _buildMediaItem(
              'Icon',
              'Material Design icons',
              '/basic/media/icon',
            ),
            const Divider(height: 1),
            _buildMediaItem(
              'Image',
              'Display images from various sources',
              '/basic/media/image',
            ),
            const Divider(height: 1),
            _buildMediaItem(
              'CircleAvatar',
              'Circular image or text display',
              '/basic/media/circle-avatar',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaItem(String title, String subtitle, String route) {
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