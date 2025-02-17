import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/example_section.dart';
import '../../../controllers/example_controller.dart';
import 'package:flutter/gestures.dart';

class RichTextScreen extends GetView<ExampleController> {
  const RichTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich Text Examples'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ExampleSection(
            title: 'Basic Rich Text',
            description: 'Text with multiple styles in one widget',
            example: Text.rich(
              TextSpan(
                text: 'This is ',
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(
                    text: 'colored ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: 'and '),
                  TextSpan(
                    text: 'styled',
                    style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(text: ' text.'),
                ],
              ),
            ),
            codeSnippet: '''
Text.rich(
  TextSpan(
    text: 'This is ',
    style: TextStyle(fontSize: 16),
    children: [
      TextSpan(
        text: 'colored ',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(text: 'and '),
      TextSpan(
        text: 'styled',
        style: TextStyle(
          color: Colors.red,
          fontStyle: FontStyle.italic,
        ),
      ),
      TextSpan(text: ' text.'),
    ],
  ),
)''',
          ),
          const SizedBox(height: 16),
          ExampleSection(
            title: 'Rich Text with Tap Gestures',
            description: 'Text with clickable sections',
            example: Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 16),
                children: [
                  const TextSpan(text: 'This is '),
                  TextSpan(
                    text: 'colored',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.snackbar(
                          'Tapped!',
                          'You tapped the colored text',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                  ),
                  const TextSpan(text: ' and '),
                  TextSpan(
                    text: 'styled',
                    style: const TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.snackbar(
                          'Tapped!',
                          'You tapped the styled text',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                  ),
                  const TextSpan(text: ' text.'),
                ],
              ),
            ),
            codeSnippet: '''
Text.rich(
  TextSpan(
    style: TextStyle(fontSize: 16),
    children: [
      TextSpan(text: 'This is '),
      TextSpan(
        text: 'colored',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Get.snackbar(
              'Tapped!',
              'You tapped the colored text',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
      ),
      TextSpan(text: ' and '),
      TextSpan(
        text: 'styled',
        style: TextStyle(
          color: Colors.red,
          fontStyle: FontStyle.italic,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Get.snackbar(
              'Tapped!',
              'You tapped the styled text',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
      ),
      TextSpan(text: ' text.'),
    ],
  ),
)''',
          ),
          const SizedBox(height: 16),
          const ExampleSection(
            title: 'Rich Text with Icons',
            description: 'Mixing text with inline icons',
            example: Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.favorite, size: 16, color: Colors.red),
                  ),
                  TextSpan(text: ' with icons '),
                  WidgetSpan(
                    child: Icon(Icons.star, size: 16, color: Colors.yellow),
                  ),
                  TextSpan(text: ' inline'),
                ],
              ),
            ),
            codeSnippet: '''
Text.rich(
  TextSpan(
    children: [
      WidgetSpan(
        child: Icon(Icons.favorite, size: 16, color: Colors.red),
      ),
      TextSpan(text: ' with icons '),
      WidgetSpan(
        child: Icon(Icons.star, size: 16, color: Colors.yellow),
      ),
      TextSpan(text: ' inline'),
    ],
  ),
)''',
          ),
          const SizedBox(height: 16),
          const ExampleSection(
            title: 'Styled Paragraph',
            description: 'Complex paragraph with multiple styles',
            example: Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(
                    text: 'Flutter ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: "is Google\'s UI toolkit for building beautiful, "
                        "natively compiled applications for ",
                  ),
                  TextSpan(
                    text: 'mobile',
                    style: TextStyle(
                      color: Colors.green,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(text: ', '),
                  TextSpan(
                    text: 'web',
                    style: TextStyle(
                      color: Colors.orange,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(text: ', and '),
                  TextSpan(
                    text: 'desktop',
                    style: TextStyle(
                      color: Colors.purple,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(text: ' from a single codebase.'),
                ],
              ),
            ),
            codeSnippet: '''
Text.rich(
  TextSpan(
    style: TextStyle(fontSize: 16),
    children: [
      TextSpan(
        text: 'Flutter ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      TextSpan(
        text: "is Google\'s UI toolkit for building beautiful, "
            "natively compiled applications for ",
      ),
      TextSpan(
        text: 'mobile',
        style: TextStyle(
          color: Colors.green,
          fontStyle: FontStyle.italic,
        ),
      ),
      TextSpan(text: ', '),
      TextSpan(
        text: 'web',
        style: TextStyle(
          color: Colors.orange,
          fontStyle: FontStyle.italic,
        ),
      ),
      TextSpan(text: ', and '),
      TextSpan(
        text: 'desktop',
        style: TextStyle(
          color: Colors.purple,
          fontStyle: FontStyle.italic,
        ),
      ),
      TextSpan(text: ' from a single codebase.'),
    ],
  ),
)''',
          ),
        ],
      ),
    );
  }
}
