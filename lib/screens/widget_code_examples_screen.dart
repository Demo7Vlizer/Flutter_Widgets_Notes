import 'package:flutter/material.dart';
import '../utils/widget_code_examples.dart';

class WidgetCodeExamplesScreen extends StatelessWidget {
  const WidgetCodeExamplesScreen({super.key});

  Widget _buildSection(String title, Map<String, String> items) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final entry = items.entries.elementAt(index);
              return ListTile(
                title: Text(
                  entry.key,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(entry.value),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCodeSection(String code) {
    return ExpansionTile(
      title: const Text(
        'Example Code',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        // Add copy functionality if needed
                      },
                      tooltip: 'Copy code',
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: SelectableText(
                    code,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExampleContent(String title, Map<String, dynamic> example) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (title == 'ListTile Examples')
            Card(
              margin: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Settings List Example
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    subtitle: const Text('App preferences and configuration'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(),
                  // Notification List Example
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.notifications,
                          color: Colors.white, size: 20),
                    ),
                    title: const Text('New Message'),
                    subtitle: const Text('John: Hey, how are you?'),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('10:30 AM', style: TextStyle(fontSize: 12)),
                        SizedBox(height: 4),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 8,
                          child: Text('2',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  const Divider(),
                  // Music Player Example
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        width: 40,
                        height: 40,
                        color: Colors.purple[200],
                        child: const Icon(Icons.music_note),
                      ),
                    ),
                    title: const Text('Awesome Song'),
                    subtitle: const Text('Famous Artist'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.skip_previous),
                        Icon(Icons.play_arrow),
                        Icon(Icons.skip_next),
                      ],
                    ),
                  ),
                  const Divider(),
                  // Shopping Cart Item Example
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey[200],
                      ),
                      child: const Icon(Icons.shopping_bag),
                    ),
                    title: const Text('Premium Headphones'),
                    subtitle: const Text('\$299.99'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () {},
                        ),
                        const Text('1'),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (title == 'ListView Examples')
            Column(
              children: [
                // Horizontal Image List
                Container(
                  height: 180,
                  margin: const EdgeInsets.all(16),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(right: 16),
                        child: SizedBox(
                          width: 140,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.blue[100 * ((index % 3) + 1)],
                                  child: Center(
                                    child: Icon(
                                      Icons.image,
                                      size: 40,
                                      color: Colors.blue[900],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Image ${index + 1}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Chat Messages List',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                // Chat Messages List
                Container(
                  height: 250,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: 5,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      bool isMe = index % 2 == 0;
                      return Row(
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          if (!isMe)
                            const CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text('J'),
                            ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isMe ? Colors.blue : Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'Message ${index + 1}',
                              style: TextStyle(
                                color: isMe ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Grid Layout',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                // Grid Layout
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(16),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.purple[200]!,
                              Colors.blue[200]!,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Interactive List',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                // Interactive List with Swipe Actions
                Container(
                  height: 250,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key('item_$index'),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green[200],
                            child: Icon(Icons.check, color: Colors.green[900]),
                          ),
                          title: Text('Task ${index + 1}'),
                          subtitle: Text('Swipe to delete this task'),
                          trailing: const Icon(Icons.drag_handle),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          _buildCodeSection(example['code'] as String),
          _buildSection(
            'Widget Explanations',
            example['explanation'] as Map<String, String>,
          ),
          if (example['properties'] != null)
            _buildSection(
              'Properties',
              example['properties'] as Map<String, String>,
            ),
          _buildSection(
            'Use Cases',
            example['use_cases'] as Map<String, String>,
          ),
          if (example['styling_features'] != null)
            _buildSection(
              'Styling Features',
              example['styling_features'] as Map<String, String>,
            ),
          if (example['common_patterns'] != null)
            _buildSection(
              'Common Patterns',
              example['common_patterns'] as Map<String, String>,
            ),
          _buildSection(
            'Best Practices',
            example['best_practices'] as Map<String, String>,
          ),
          _buildSection(
            'Styling Tips',
            example['styling_tips'] as Map<String, String>,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 13,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Widget Code Examples'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'AppBar'),
              Tab(text: 'Buttons'),
              Tab(text: 'Card'),
              Tab(text: 'GestureDetector'),
              Tab(text: 'Colors'),
              Tab(text: 'Row/Column'),
              Tab(text: 'Container/SizedBox'),
              Tab(text: 'Custom Widget'),
              Tab(text: 'Icons'),
              Tab(text: 'Images'),
              Tab(text: 'Indicators'),
              Tab(text: 'ListTile'),
              Tab(text: 'ListView'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildExampleContent(
                'AppBar Example', WidgetCodeExamples.appBarExample),
            _buildExampleContent(
                'Button Examples', WidgetCodeExamples.buttonExample),
            _buildExampleContent(
                'Card Example', WidgetCodeExamples.cardExample),
            _buildExampleContent(
                'Gesture Examples', WidgetCodeExamples.gestureDetectorExample),
            _buildExampleContent(
                'Color Examples', WidgetCodeExamples.colorExample),
            _buildExampleContent(
                'Row/Column Examples', WidgetCodeExamples.rowColumnExample),
            _buildExampleContent('Container/SizedBox Examples',
                WidgetCodeExamples.containerSizedBoxExample),
            _buildExampleContent('Custom Widget Examples',
                WidgetCodeExamples.customWidgetExample),
            _buildExampleContent(
                'Icon Examples', WidgetCodeExamples.iconExample),
            _buildExampleContent(
                'Image Examples', WidgetCodeExamples.imageExample),
            _buildExampleContent(
                'Indicator Examples', WidgetCodeExamples.indicatorExample),
            _buildExampleContent(
                'ListTile Examples', WidgetCodeExamples.listTileExample),
            _buildExampleContent(
                'ListView Examples', WidgetCodeExamples.listViewExample),
          ],
        ),
      ),
    );
  }
}
