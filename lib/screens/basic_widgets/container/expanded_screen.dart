import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandedScreen extends StatefulWidget {
  const ExpandedScreen({super.key});

  @override
  State<ExpandedScreen> createState() => _ExpandedScreenState();
}

class _ExpandedScreenState extends State<ExpandedScreen> {
  double _flexValue1 = 1;
  double _flexValue2 = 1;
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded & Flexible'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children: [
          // Definition Section
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What are Expanded & Flexible?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Expanded and Flexible widgets are used to control how children of Row and Column widgets should '
                  'fill the available space. Expanded is a shorthand for Flexible with fit: FlexFit.tight.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Key Differences:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('• Expanded always fills available space'),
                      Text('• Flexible can fill or not fill space'),
                      Text('• Expanded is more commonly used'),
                      Text('• Both support flex factor for space distribution'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Basic Expanded Example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Basic Expanded',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Equal space distribution',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 100,
                  color: Colors.grey[200],
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.blue[100],
                          child: const Center(child: Text('Expanded 1')),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.green[100],
                          child: const Center(child: Text('Expanded 2')),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.orange[100],
                          child: const Center(child: Text('Expanded 3')),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('''
Row(
  children: [
    Expanded(
      child: Container(
        color: Colors.blue[100],
        child: Center(child: Text('Expanded 1')),
      ),
    ),
    Expanded(
      child: Container(
        color: Colors.green[100],
        child: Center(child: Text('Expanded 2')),
      ),
    ),
    Expanded(
      child: Container(
        color: Colors.orange[100],
        child: Center(child: Text('Expanded 3')),
      ),
    ),
  ],
),'''),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Flex Factor Example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Flex Factor',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Different space distribution using flex',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 100,
                  color: Colors.grey[200],
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.purple[100],
                          child: const Center(child: Text('flex: 1')),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.red[100],
                          child: const Center(child: Text('flex: 2')),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.teal[100],
                          child: const Center(child: Text('flex: 3')),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('''
Row(
  children: [
    Expanded(
      flex: 1,
      child: Container(
        color: Colors.purple[100],
        child: Center(child: Text('flex: 1')),
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        color: Colors.red[100],
        child: Center(child: Text('flex: 2')),
      ),
    ),
    Expanded(
      flex: 3,
      child: Container(
        color: Colors.teal[100],
        child: Center(child: Text('flex: 3')),
      ),
    ),
  ],
),'''),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Interactive Example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Interactive Example',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Adjust sliders to see how flex values affect space distribution',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 150,
                  color: Colors.grey[200],
                  child: Row(
                    children: [
                      Expanded(
                        flex: _flexValue1.round(),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          color: Colors.blue[100],
                          child: Center(
                            child: Text(
                              'flex: ${_flexValue1.round()}',
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: _flexValue2.round(),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          color: Colors.green[100],
                          child: Center(
                            child: Text(
                              'flex: ${_flexValue2.round()}',
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text('First container flex: ${_flexValue1.round()}'),
                Slider(
                  value: _flexValue1,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: _flexValue1.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _flexValue1 = value;
                    });
                  },
                ),
                Text('Second container flex: ${_flexValue2.round()}'),
                Slider(
                  value: _flexValue2,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: _flexValue2.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _flexValue2 = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Flexible vs Expanded Example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Flexible vs Expanded',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Toggle to see the difference',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Use Expanded'),
                    Switch(
                      value: _isExpanded,
                      onChanged: (value) {
                        setState(() {
                          _isExpanded = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  height: 100,
                  color: Colors.grey[200],
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        color: Colors.purple[100],
                        child: const Center(
                          child: Text('Fixed\nWidth'),
                        ),
                      ),
                      if (_isExpanded)
                        Expanded(
                          child: Container(
                            color: Colors.orange[100],
                            child: const Center(
                              child: Text('Expanded'),
                            ),
                          ),
                        )
                      else
                        Flexible(
                          child: Container(
                            color: Colors.orange[100],
                            child: const Center(
                              child: Text('Flexible'),
                            ),
                          ),
                        ),
                      Container(
                        width: 100,
                        color: Colors.purple[100],
                        child: const Center(
                          child: Text('Fixed\nWidth'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Key Points:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  '• Expanded always takes all available space\n'
                  '• Flexible only takes the space it needs\n'
                  '• Use Expanded when you want to fill the space\n'
                  '• Use Flexible when you want natural sizing',
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 