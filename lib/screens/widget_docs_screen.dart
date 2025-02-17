import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/api_url_builder.dart';

class WidgetDocsScreen extends StatelessWidget {
  const WidgetDocsScreen({super.key});

  Future<void> _openDocs(String url) async {
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
    final href = Get.arguments as String;
    final url = ApiUrlBuilder.buildUrl(href);

    // Automatically try to open the URL when screen is shown
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openDocs(url);
      Get.back(); // Go back after launching URL
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
} 