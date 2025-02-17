import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/example_section.dart';
import '../../../controllers/example_controller.dart';

class BasicTextScreen extends GetView<ExampleController> {
  const BasicTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Text Examples'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ExampleSection(
            title: 'Simple Text',
            description: 'Basic text widget with default styling',
            example: Text(
              'Hello, World!',
              style: TextStyle(fontSize: 16),
            ),
            codeSnippet: '''
Text(
  'Hello, World!',
  style: TextStyle(fontSize: 16),
)''',
          ),
          SizedBox(height: 16),
          ExampleSection(
            title: 'Styled Text',
            description: 'Text with custom styling',
            example: Text(
              'Styled Text Example',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                letterSpacing: 1.2,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            codeSnippet: '''
Text(
  'Styled Text Example',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    letterSpacing: 1.2,
    shadows: [
      Shadow(
        color: Colors.black26,
        offset: Offset(2, 2),
        blurRadius: 4,
      ),
    ],
  ),
)''',
          ),
          SizedBox(height: 16),
          ExampleSection(
            title: 'Text Alignment',
            description: 'Different text alignment options',
            example: Column(
              children: [
                Text(
                  'Left aligned text (default)',
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8),
                Text(
                  'Center aligned text',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Right aligned text',
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            codeSnippet: '''
Text(
  'Left aligned text',
  textAlign: TextAlign.left,
),
Text(
  'Center aligned text',
  textAlign: TextAlign.center,
),
Text(
  'Right aligned text',
  textAlign: TextAlign.right,
),''',
          ),
          SizedBox(height: 16),
          ExampleSection(
            title: 'Text Overflow',
            description: 'Handling text that exceeds its bounds',
            example: SizedBox(
              width: 200,
              child: Text(
                'This is a very long text that will overflow its container and demonstrate different overflow behaviors.',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            codeSnippet: '''
SizedBox(
  width: 200,
  child: Text(
    'This is a very long text that will overflow...',
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
  ),
)''',
          ),
        ],
      ),
    );
  }
}
