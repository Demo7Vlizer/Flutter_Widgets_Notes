import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/example_card.dart';
import '../../controllers/example_controller.dart';

class InputWidgetsScreen extends GetView<ExampleController> {
  const InputWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widgets'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ExampleCard(
            title: 'TextField',
            description: 'Basic text input field',
            route: '/input/textfield',
          ),
          ExampleCard(
            title: 'Checkbox & Switch',
            description: 'Toggle input controls',
            route: '/input/checkbox_switch',
          ),
          ExampleCard(
            title: 'Radio Button',
            description: 'Single selection from multiple options',
            route: '/input/radio',
          ),
          ExampleCard(
            title: 'Slider',
            description: 'Select a value from a range',
            route: '/input/slider',
          ),
        ],
      ),
    );
  }
} 