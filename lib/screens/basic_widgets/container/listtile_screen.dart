import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTileScreen extends StatefulWidget {
  const ListTileScreen({super.key});

  @override
  State<ListTileScreen> createState() => _ListTileScreenState();
}

class _ListTileScreenState extends State<ListTileScreen> {
  bool isSelected = false;
  bool isExpanded = false;
  bool isSwiped = false;
  double swipeOffset = 0;
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTile'),
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
                  'What is ListTile?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ListTile is a specialized row widget designed for building lists and menus. '
                  'It contains up to 3 lines of text and optional leading and trailing icons. '
                  'Commonly used in drawers, lists, and menu items.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Common Use Cases:',
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
                      Text('• Navigation menu items'),
                      Text('• Settings screens'),
                      Text('• Contact lists'),
                      Text('• Message/email lists'),
                      Text('• Selection lists'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Interactive Examples Section
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Interactive Examples',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Selection Effect Example
                const Text(
                  'Selection Effect',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Tap to see the selection animation',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue.withOpacity(0.1) : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        Icons.star,
                        color: isSelected ? Colors.white : Colors.grey[600],
                      ),
                    ),
                    title: const Text('Interactive ListTile'),
                    subtitle: const Text('Tap me to see the animation'),
                    trailing: AnimatedRotation(
                      duration: const Duration(milliseconds: 200),
                      turns: isSelected ? 0.25 : 0,
                      child: Icon(
                        Icons.chevron_right,
                        color: isSelected ? Colors.blue : Colors.grey,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Expandable ListTile Example
                const Text(
                  'Expandable ListTile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Tap to expand/collapse',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: AnimatedRotation(
                          duration: const Duration(milliseconds: 200),
                          turns: isExpanded ? 0.25 : 0,
                          child: const Icon(Icons.chevron_right),
                        ),
                        title: const Text('Expandable Content'),
                        subtitle: const Text('Tap to see more details'),
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: isExpanded ? 100 : 0,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          color: Colors.grey[100],
                          child: const Text(
                            'This is the expanded content that appears when you tap the ListTile. '
                            'It smoothly animates in and out.',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Swipeable ListTile Example
                const Text(
                  'Swipeable ListTile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Swipe left/right to reveal actions',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onHorizontalDragStart: (_) {
                    setState(() {
                      isDragging = true;
                    });
                  },
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      swipeOffset += details.delta.dx;
                      swipeOffset = swipeOffset.clamp(-100.0, 100.0);
                    });
                  },
                  onHorizontalDragEnd: (_) {
                    setState(() {
                      isDragging = false;
                      if (swipeOffset.abs() > 50) {
                        isSwiped = swipeOffset > 0;
                      }
                      swipeOffset = 0;
                    });
                  },
                  child: AnimatedContainer(
                    duration: isDragging 
                        ? Duration.zero 
                        : const Duration(milliseconds: 200),
                    transform: Matrix4.translationValues(swipeOffset, 0, 0),
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: const Text('Swipeable ListTile'),
                        subtitle: const Text('Swipe me left or right'),
                        trailing: const Icon(Icons.swap_horiz),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Social Media Style ListTile
                const Text(
                  'Social Media Style',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Common social media list item layout',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                  title: const Text('John Doe'),
                  subtitle: const Text('Posted a new photo • 2h ago'),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ),

                const SizedBox(height: 24),

                // Settings Style ListTile
                const Text(
                  'Settings Style',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Common settings menu item layout',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.settings, color: Colors.blue),
                  ),
                  title: const Text('Settings'),
                  subtitle: const Text('App preferences and more'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Properties Showcase Section
          const Text(
            'ListTile Properties',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Different ways to customize ListTile',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),

          // Dense ListTile
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Dense ListTile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const ListTile(
                  dense: true,
                  leading: Icon(Icons.info),
                  title: Text('Compact Layout'),
                  subtitle: Text('Uses less vertical space'),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[50],
                  child: const Text('''
ListTile(
  dense: true,
  leading: Icon(Icons.info),
  title: Text('Compact Layout'),
  subtitle: Text('Uses less vertical space'),
)'''),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Three-Line ListTile
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Three-Line ListTile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(child: Text('3L')),
                  title: Text('Three-Line Title'),
                  subtitle: Text(
                    'This is a long subtitle that demonstrates how a three-line ListTile looks. '
                    'Notice how it wraps to multiple lines.',
                  ),
                  trailing: Icon(Icons.more_vert),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[50],
                  child: const Text('''
ListTile(
  isThreeLine: true,
  leading: CircleAvatar(child: Text('3L')),
  title: Text('Three-Line Title'),
  subtitle: Text(
    'This is a long subtitle that demonstrates how a '
    'three-line ListTile looks. Notice how it wraps.',
  ),
  trailing: Icon(Icons.more_vert),
)'''),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Custom Styled ListTile
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Custom Styled ListTile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  tileColor: Colors.blue[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.brush, color: Colors.blue),
                  ),
                  title: const Text(
                    'Custom Styling',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text('With custom colors and shapes'),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Action'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[50],
                  child: const Text('''
ListTile(
  tileColor: Colors.blue[50],
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  leading: Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.blue[100],
      shape: BoxShape.circle,
    ),
    child: Icon(Icons.brush, color: Colors.blue),
  ),
  title: Text(
    'Custom Styling',
    style: TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  subtitle: Text('With custom colors and shapes'),
  trailing: ElevatedButton(
    onPressed: () {},
    child: Text('Action'),
  ),
)'''),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Selected ListTile
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Selected State',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  selected: true,
                  selectedTileColor: Colors.blue.withOpacity(0.1),
                  selectedColor: Colors.blue,
                  leading: const Icon(Icons.check_circle),
                  title: const Text('Selected ListTile'),
                  subtitle: const Text('Shows selected state styling'),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[50],
                  child: const Text('''
ListTile(
  selected: true,
  selectedTileColor: Colors.blue.withOpacity(0.1),
  selectedColor: Colors.blue,
  leading: Icon(Icons.check_circle),
  title: Text('Selected ListTile'),
  subtitle: Text('Shows selected state styling'),
)'''),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ListTile with Custom Content Padding
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Custom Content Padding',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  leading: const Icon(Icons.padding),
                  title: const Text('Custom Padding'),
                  subtitle: const Text('With modified content padding'),
                  trailing: const Icon(Icons.arrow_forward),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[50],
                  child: const Text('''
ListTile(
  contentPadding: EdgeInsets.symmetric(
    horizontal: 32,
    vertical: 16,
  ),
  leading: Icon(Icons.padding),
  title: Text('Custom Padding'),
  subtitle: Text('With modified content padding'),
  trailing: Icon(Icons.arrow_forward),
)'''),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 