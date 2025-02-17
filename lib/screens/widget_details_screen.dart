import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/widget_data.dart';
import '../utils/api_url_builder.dart';
import '../controllers/widget_controller.dart';
import 'package:flutter/rendering.dart';

class WidgetDetailsScreen extends GetView<WidgetController> {
  const WidgetDetailsScreen({super.key});

  Future<void> _openDocs(String href) async {
    final url = ApiUrlBuilder.buildUrl(href);
    final uri = Uri.parse(url);
    
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        Get.snackbar(
          'Error',
          'Could not open documentation',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to open documentation',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final widgetData = Get.arguments as WidgetData;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widgetData.name),
            const Text(' class', style: TextStyle(color: Colors.grey)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              // TODO: Implement theme switching
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Description section
              Text(
                'description',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widgetData.description ?? 'No description available',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),

              // Category section
              if (widgetData.category != null) ...[
                Text(
                  'Category',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widgetData.category!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
              ],

              // API Documentation Link
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        ApiUrlBuilder.buildUrl(widgetData.href),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      tooltip: 'Copy URL',
                      onPressed: () {
                        final url = ApiUrlBuilder.buildUrl(widgetData.href);
                        Clipboard.setData(ClipboardData(text: url));
                        Get.snackbar(
                          'Success',
                          'URL copied to clipboard',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.open_in_new),
                      tooltip: 'Open in browser',
                      onPressed: () => _openDocs(widgetData.href),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 