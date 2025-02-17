import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/example_card.dart';
import '../../controllers/example_controller.dart';

class LayoutWidgetsScreen extends GetView<ExampleController> {
  const LayoutWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Widgets'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ExampleCard(
            title: 'Container',
            description: 'A convenience widget that combines painting, positioning, and sizing',
            route: '/layout/container',
          ),
          ExampleCard(
            title: 'Row & Column',
            description: 'Arrange widgets horizontally and vertically',
            route: '/layout/row_column',
          ),
          ExampleCard(
            title: 'Stack',
            description: 'Stack widgets on top of each other',
            route: '/layout/stack',
          ),
          ExampleCard(
            title: 'Wrap',
            description: 'Wrap widgets to next line when out of space',
            route: '/layout/wrap',
          ),
        ],
      ),
    );
  }
} 