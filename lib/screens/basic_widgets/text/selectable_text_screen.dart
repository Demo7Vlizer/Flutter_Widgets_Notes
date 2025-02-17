import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/example_section.dart';
import '../../../controllers/example_controller.dart';

class SelectableTextScreen extends GetView<ExampleController> {
  const SelectableTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectableText Examples'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ExampleSection(
            title: 'Basic Selectable Text',
            description: 'Simple selectable text with default styling',
            example: SelectableText(
              'This text can be selected, copied, and shared. Try selecting it!',
              style: TextStyle(fontSize: 16),
            ),
            codeSnippet: '''
SelectableText(
  'This text can be selected, copied, and shared. Try selecting it!',
  style: TextStyle(fontSize: 16),
)''',
          ),
          SizedBox(height: 16),
          ExampleSection(
            title: 'Styled Selectable Text',
            description: 'Selectable text with custom styling',
            example: SelectableText(
              'Styled Selectable Text',
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
SelectableText(
  'Styled Selectable Text',
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
            title: 'Customized Selection',
            description:
                'Selectable text with custom cursor and selection controls',
            example: SelectableText(
              'This text has a custom cursor and selection behavior. '
              'Try selecting this text to see the custom cursor!',
              style: TextStyle(fontSize: 16),
              cursorColor: Colors.red,
              cursorWidth: 3,
              cursorRadius: Radius.circular(3),
              showCursor: true,
              toolbarOptions: ToolbarOptions(
                copy: true,
                selectAll: true,
                cut: false,
                paste: false,
              ),
            ),
            codeSnippet: '''
SelectableText(
  'This text has a custom cursor and selection behavior. '
  'Try selecting this text to see the custom cursor!',
  style: TextStyle(fontSize: 16),
  cursorColor: Colors.red,
  cursorWidth: 3,
  cursorRadius: Radius.circular(3),
  showCursor: true,
  toolbarOptions: ToolbarOptions(
    copy: true,
    selectAll: true,
    cut: false,
    paste: false,
  ),
)''',
          ),
          SizedBox(height: 16),
          ExampleSection(
            title: 'Multi-line Selectable Text',
            description:
                'Selectable text with multiple lines and text alignment',
            example: SelectableText(
              'This is a multi-line selectable text example.\n'
              'You can select across multiple lines.\n'
              'The text will wrap when it reaches the edge of its container.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
              maxLines: 5,
            ),
            codeSnippet: '''
SelectableText(
  'This is a multi-line selectable text example.\\n'
  'You can select across multiple lines.\\n'
  'The text will wrap when it reaches the edge of its container.',
  style: TextStyle(fontSize: 16, height: 1.5),
  textAlign: TextAlign.center,
  maxLines: 5,
)''',
          ),
          const SizedBox(height: 16),
          ExampleSection(
            title: 'Colorful Text with Toggle',
            description: 'Selectable text with toggle functionality and colors',
            example: _ColorfulToggleText(),
            codeSnippet: '''
class _ColorfulToggleText extends StatefulWidget {
  @override
  State<_ColorfulToggleText> createState() => _ColorfulToggleTextState();
}

class _ColorfulToggleTextState extends State<_ColorfulToggleText> {
  bool _isColorful = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Toggle Colors:'),
            Switch(
              value: _isColorful,
              onChanged: (value) {
                setState(() {
                  _isColorful = value;
                });
              },
            ),
          ],
        ),
        SelectableText.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Flutter ',
                style: TextStyle(
                  color: _isColorful ? Colors.blue : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'makes it easy ',
                style: TextStyle(
                  color: _isColorful ? Colors.green : Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: 'to develop ',
                style: TextStyle(
                  color: _isColorful ? Colors.orange : Colors.black,
                ),
              ),
              TextSpan(
                text: 'beautiful apps',
                style: TextStyle(
                  color: _isColorful ? Colors.purple : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}''',
          ),
        ],
      ),
    );
  }
}

class _ColorfulToggleText extends StatefulWidget {
  const _ColorfulToggleText({Key? key}) : super(key: key);

  @override
  State<_ColorfulToggleText> createState() => _ColorfulToggleTextState();
}

class _ColorfulToggleTextState extends State<_ColorfulToggleText> {
  bool _isColorful = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Toggle Colors:'),
            Switch(
              value: _isColorful,
              onChanged: (value) {
                setState(() {
                  _isColorful = value;
                });
              },
            ),
          ],
        ),
        SelectableText.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Flutter ',
                style: TextStyle(
                  color: _isColorful ? Colors.blue : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'makes it easy ',
                style: TextStyle(
                  color: _isColorful ? Colors.green : Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: 'to develop ',
                style: TextStyle(
                  color: _isColorful ? Colors.orange : Colors.black,
                ),
              ),
              TextSpan(
                text: 'beautiful apps',
                style: TextStyle(
                  color: _isColorful ? Colors.purple : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
