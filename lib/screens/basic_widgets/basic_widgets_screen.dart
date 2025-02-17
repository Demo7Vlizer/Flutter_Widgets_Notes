import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/example_section_card.dart';
import '../../controllers/example_controller.dart';

class BasicWidgetsScreen extends GetView<ExampleController> {
  const BasicWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ExampleController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Widgets'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ExampleSectionCard(
            title: 'Text Widgets',
            description: 'Widgets for displaying and styling text',
            examples: [
              {
                'title': 'Basic Text',
                'route': '/basic/text/basic',
                'description': 'Simple text display with various styles'
              },
              {
                'title': 'Rich Text',
                'route': '/basic/text/rich',
                'description': 'Text with multiple styles in one widget'
              },
              {
                'title': 'SelectableText',
                'route': '/basic/text/selectable',
                'description': 'Text that users can select and copy'
              },
            ],
          ),
          SizedBox(height: 16),
          ExampleSectionCard(
            title: 'Button Widgets',
            description: 'Different types of button widgets',
            examples: [
              {
                'title': 'ElevatedButton',
                'route': '/basic/buttons/elevated',
                'description': 'Material Design elevated button'
              },
              {
                'title': 'TextButton',
                'route': '/basic/buttons/text',
                'description': 'Material Design text button'
              },
              {
                'title': 'OutlinedButton',
                'route': '/basic/buttons/outlined',
                'description': 'Material Design outlined button'
              },
              {
                'title': 'IconButton',
                'route': '/basic/buttons/icon',
                'description': 'A button with an icon'
              },
            ],
          ),
          SizedBox(height: 16),
          ExampleSectionCard(
            title: 'Icon & Image Widgets',
            description: 'Widgets for displaying icons and images',
            examples: const [
              {
                'title': 'Icon',
                'route': '/basic/media/icon',
                'description': 'Material Design icons'
              },
              {
                'title': 'Image',
                'route': '/basic/media/image',
                'description': 'Display images from various sources'
              },
              {
                'title': 'CircleAvatar',
                'route': '/basic/media/circle-avatar',
                'description': 'Circular image or text display'
              },
            ],
          ),
          SizedBox(height: 16),
          ExampleSectionCard(
            title: 'Layout Widgets',
            description: 'Basic widgets for layout structure',
            examples: [
              {
                'title': 'Container',
                'route': '/basic/layout/container',
                'description': 'A convenience widget for common styling needs'
              },
              {
                'title': 'Row & Column',
                'route': '/basic/layout/row-column',
                'description':
                    'Linear layout in horizontal and vertical directions'
              },
              {
                'title': 'Stack',
                'route': '/basic/layout/stack',
                'description': 'Layer multiple widgets on top of each other'
              },
              {
                'title': 'Wrap',
                'route': '/basic/layout/wrap',
                'description': 'Flow widgets to next line when out of space'
              },
              {
                'title': 'AnimatedContainer',
                'route': '/basic/layout/animated-container',
                'description': 'Container that smoothly animates changes'
              },
            ],
          ),
          SizedBox(height: 16),
          ExampleSectionCard(
            title: 'Input Widgets',
            description: 'Widgets for user input',
            examples: [
              {
                'title': 'TextField',
                'route': '/basic/input/textfield',
                'description': 'Input field for text entry'
              },
              {
                'title': 'Checkbox',
                'route': '/basic/input/checkbox',
                'description': 'Toggle selection widget'
              },
              {
                'title': 'Radio',
                'route': '/basic/input/radio',
                'description': 'Single selection from multiple options'
              },
              {
                'title': 'Switch',
                'route': '/basic/input/switch',
                'description': 'On/off toggle switch'
              },
            ],
          ),
          SizedBox(height: 16),
          ExampleSectionCard(
            title: 'Container Widgets',
            description: 'Widgets for containing other widgets',
            examples: [
              {
                'title': 'Card',
                'route': '/basic/container/card',
                'description': 'Material Design card container'
              },
              {
                'title': 'ListTile',
                'route': '/basic/container/listtile',
                'description': 'Single fixed-height row for lists'
              },
              {
                'title': 'Expanded & Flexible',
                'route': '/basic/container/expanded',
                'description': 'Widgets that expand to fill available space'
              },
            ],
          ),
        ],
      ),
    );
  }
}
