// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> with SingleTickerProviderStateMixin {
  // Basic radio values
  int selectedValue1 = 1;
  String selectedValue2 = 'option1';
  int selectedValue3 = 1;

  // Animated radio values
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  int _animatedValue = 0;
  Color _selectedColor = Colors.blue;

  // For custom radio
  int _customValue = 0;
  // ignore: unused_field
  double _customSize = 24.0;

  // For interactive example
  final List<RadioOption> _options = [
    RadioOption(
      value: 1, 
      title: 'Light Theme', 
      subtitle: 'Clean and bright interface',
      icon: Icons.light_mode,
    ),
    RadioOption(
      value: 2, 
      title: 'Dark Theme', 
      subtitle: 'Easy on the eyes',
      icon: Icons.dark_mode,
    ),
    RadioOption(
      value: 3, 
      title: 'System Theme', 
      subtitle: 'Follows system settings',
      icon: Icons.settings_system_daydream,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildSection({
    required String title,
    required String subtitle,
    required Widget child,
    required String codeExample,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: child,
          ),
          const SizedBox(height: 8),
          ExpansionTile(
            title: const Text(
              'View Code',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: SelectableText(
                  codeExample,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Definition Section
          const Text(
            'What is Radio?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Radio buttons let users select one option from a set. Use radio buttons when the user needs to see all available options. If available options can be collapsed, consider using a dropdown menu instead.',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),

          // Animated Radio
          _buildSection(
            title: 'Animated Radio',
            subtitle: 'Radio with scale and color animations',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                return GestureDetector(
                  onTapDown: (_) {
                    if (_animatedValue != index) {
                      _controller.forward(from: 0);
                    }
                  },
                  child: ScaleTransition(
                    scale: _animatedValue == index ? _scaleAnimation : const AlwaysStoppedAnimation(1.0),
                    child: Radio<int>(
                      value: index,
                      groupValue: _animatedValue,
                      onChanged: (value) {
                        setState(() {
                          _animatedValue = value!;
                          _selectedColor = [
                            Colors.blue,
                            Colors.green,
                            Colors.purple,
                          ][value];
                        });
                      },
                      activeColor: _selectedColor,
                    ),
                  ),
                );
              }),
            ),
            codeExample: '''
ScaleTransition(
  scale: _animatedValue == index ? _scaleAnimation : const AlwaysStoppedAnimation(1.0),
  child: Radio<int>(
    value: index,
    groupValue: _animatedValue,
    onChanged: (value) {
      setState(() {
        _animatedValue = value!;
        _selectedColor = colors[value];
      });
    },
    activeColor: _selectedColor,
  ),
),''',
          ),

          // Theme Selection Example
          _buildSection(
            title: 'Theme Selection',
            subtitle: 'Interactive radio list with animations',
            child: Column(
              children: _options.map((option) => _buildAnimatedRadioTile(option)).toList(),
            ),
            codeExample: '''
RadioListTile<int>(
  value: option.value,
  groupValue: selectedValue,
  onChanged: (value) => setState(() => selectedValue = value!),
  title: Text(option.title),
  subtitle: Text(option.subtitle),
  secondary: AnimatedContainer(
    duration: Duration(milliseconds: 300),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: selectedValue == option.value 
          ? Colors.blue 
          : Colors.grey[200],
      shape: BoxShape.circle,
    ),
    child: Icon(
      option.icon,
      color: selectedValue == option.value 
          ? Colors.white 
          : Colors.grey,
    ),
  ),
),''',
          ),

          // Custom Radio Design
          _buildSection(
            title: 'Custom Radio Design',
            subtitle: 'Radio with custom appearance',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                return GestureDetector(
                  onTap: () => setState(() => _customValue = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: _customValue == index ? 32 : 24,
                    height: _customValue == index ? 32 : 24,
                    decoration: BoxDecoration(
                      color: _customValue == index ? Colors.blue : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                      boxShadow: _customValue == index
                          ? [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ]
                          : null,
                    ),
                    child: _customValue == index
                        ? const Center(
                            child: Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            ),
                          )
                        : null,
                  ),
                );
              }),
            ),
            codeExample: '''
AnimatedContainer(
  duration: Duration(milliseconds: 200),
  width: selected ? 32 : 24,
  height: selected ? 32 : 24,
  decoration: BoxDecoration(
    color: selected ? Colors.blue : Colors.white,
    shape: BoxShape.circle,
    border: Border.all(color: Colors.blue, width: 2),
    boxShadow: selected
        ? [BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          )]
        : null,
  ),
  child: selected
      ? Icon(Icons.check, size: 16, color: Colors.white)
      : null,
),''',
          ),

          // Key Points Section
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Key Points',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 16),
                _buildKeyPoint(
                  icon: Icons.group_work,
                  title: 'Mutually Exclusive',
                  description: 'Only one radio button in a group can be selected at a time',
                ),
                _buildKeyPoint(
                  icon: Icons.visibility,
                  title: 'Always Visible',
                  description: 'All options should be visible to help users make informed choices',
                ),
                _buildKeyPoint(
                  icon: Icons.touch_app,
                  title: 'Selection Behavior',
                  description: 'Cannot be deselected by tapping again, must select another option',
                ),
                _buildKeyPoint(
                  icon: Icons.list_alt,
                  title: 'Use Cases',
                  description: 'Best for small sets of options that need to be all visible at once',
                ),
              ],
            ),
          ),

          // Alternative Approaches Section
          _buildSection(
            title: 'Alternative Approaches',
            subtitle: 'Different ways to implement selection',
            child: Column(
              children: [
                // Dropdown Alternative
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Using Dropdown',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    DropdownButton<int>(
                      value: _customValue,
                      items: List.generate(3, (index) {
                        return DropdownMenuItem(
                          value: index,
                          child: Text('Option ${index + 1}'),
                        );
                      }),
                      onChanged: (value) => setState(() => _customValue = value!),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Segmented Button Alternative
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Using SegmentedButton',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SegmentedButton<int>(
                      segments: const [
                        ButtonSegment(value: 0, label: Text('One')),
                        ButtonSegment(value: 1, label: Text('Two')),
                        ButtonSegment(value: 2, label: Text('Three')),
                      ],
                      selected: {_customValue},
                      onSelectionChanged: (Set<int> value) {
                        setState(() => _customValue = value.first);
                      },
                    ),
                  ],
                ),
              ],
            ),
            codeExample: '''
// Dropdown Alternative
DropdownButton<int>(
  value: selectedValue,
  items: List.generate(3, (index) {
    return DropdownMenuItem(
      value: index,
      child: Text('Option \${index + 1}'),
    );
  }),
  onChanged: (value) => setState(() => 
    selectedValue = value!
  ),
),

// SegmentedButton Alternative
SegmentedButton<int>(
  segments: const [
    ButtonSegment(value: 0, label: Text('One')),
    ButtonSegment(value: 1, label: Text('Two')),
    ButtonSegment(value: 2, label: Text('Three')),
  ],
  selected: {selectedValue},
  onSelectionChanged: (Set<int> value) {
    setState(() => selectedValue = value.first);
  },
),''',
          ),

          // Best Practices Section
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Best Practices',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 16),
                _buildBestPractice(
                  '1. Use RadioListTile for Better UX',
                  'Provides larger touch targets and supports additional content',
                ),
                _buildBestPractice(
                  '2. Logical Grouping',
                  'Group related options together and use clear labels',
                ),
                _buildBestPractice(
                  '3. Default Selection',
                  'Consider providing a default selected option',
                ),
                _buildBestPractice(
                  '4. Visual Feedback',
                  'Use animations and colors to indicate selection state',
                ),
              ],
            ),
          ),

          // Common Use Cases Section
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.purple.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Common Use Cases',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 16),
                _buildUseCase(
                  icon: Icons.settings,
                  title: 'Settings Selection',
                  description: 'Theme selection, language choice, notification preferences',
                  example: _buildSettingsExample(),
                ),
                _buildUseCase(
                  icon: Icons.payment,
                  title: 'Payment Methods',
                  description: 'Credit card, PayPal, or other payment options',
                  example: _buildPaymentExample(),
                ),
                _buildUseCase(
                  icon: Icons.format_size,
                  title: 'Size Selection',
                  description: 'Product sizes, font sizes, or other measurements',
                  example: _buildSizeExample(),
                ),
                _buildUseCase(
                  icon: Icons.calendar_today,
                  title: 'Time Slot Selection',
                  description: 'Booking appointments or scheduling events',
                  example: _buildTimeSlotExample(),
                ),
                _buildUseCase(
                  icon: Icons.delivery_dining,
                  title: 'Delivery Options',
                  description: 'Shipping or delivery method selection',
                  example: _buildDeliveryExample(),
                ),
                _buildUseCase(
                  icon: Icons.star,
                  title: 'Rating Selection',
                  description: 'User rating or feedback collection',
                  example: _buildRatingExample(),
                ),
                _buildUseCase(
                  icon: Icons.language,
                  title: 'Language Selection',
                  description: 'App language or content language preference',
                  example: _buildLanguageExample(),
                ),
                _buildUseCase(
                  icon: Icons.color_lens,
                  title: 'Color Selection',
                  description: 'Choose theme or product colors',
                  example: _buildColorExample(),
                ),
                _buildUseCase(
                  icon: Icons.music_note,
                  title: 'Audio Quality',
                  description: 'Select streaming quality settings',
                  example: _buildAudioQualityExample(),
                ),
                _buildUseCase(
                  icon: Icons.view_agenda,
                  title: 'Layout Selection',
                  description: 'Choose between different view layouts',
                  example: _buildLayoutExample(),
                ),
                _buildUseCase(
                  icon: Icons.speed,
                  title: 'Performance Mode',
                  description: 'Select device performance settings',
                  example: _buildPerformanceExample(),
                ),
              ],
            ),
          ),

          // Tips & Tricks Section
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tips & Tricks',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 16),
                _buildTip(
                  '1. Default Selection',
                  'Always provide a default selected option when possible.',
                  '''
// Initialize with a default value
int selectedValue = 1;  // Instead of leaving it null
''',
                ),
                _buildTip(
                  '2. Enum Usage',
                  'Use enums for type-safe radio values.',
                  '''
enum ThemeMode { light, dark, system }
ThemeMode selectedTheme = ThemeMode.system;
''',
                ),
                _buildTip(
                  '3. Group Organization',
                  'Use RadioListTile.adaptive for platform-specific appearance.',
                  '''
RadioListTile.adaptive(
  value: ThemeMode.system,
  groupValue: selectedTheme,
  onChanged: (value) => setState(() => 
    selectedTheme = value!
  ),
),''',
                ),
              ],
            ),
          ),

          // Continue with Key Points, Best Practices, etc...
        ],
      ),
    );
  }

  Widget _buildAnimatedRadioTile(RadioOption option) {
    bool isSelected = selectedValue3 == option.value;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
        ),
      ),
      child: RadioListTile<int>(
        value: option.value,
        groupValue: selectedValue3,
        onChanged: (value) => setState(() => selectedValue3 = value!),
        title: Text(option.title),
        subtitle: Text(option.subtitle),
        secondary: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(
            option.icon,
            color: isSelected ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildKeyPoint({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBestPractice(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            description,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildUseCase({
    required IconData icon,
    required String title,
    required String description,
    required Widget example,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.purple),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: example,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsExample() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<int>(
          value: 1,
          groupValue: selectedValue1,
          onChanged: (value) => setState(() => selectedValue1 = value!),
        ),
        const Text('Light'),
        Radio<int>(
          value: 2,
          groupValue: selectedValue1,
          onChanged: (value) => setState(() => selectedValue1 = value!),
        ),
        const Text('Dark'),
      ],
    );
  }

  Widget _buildPaymentExample() {
    return Column(
      children: [
        RadioListTile<String>(
          value: 'card',
          groupValue: selectedValue2,
          onChanged: (value) => setState(() => selectedValue2 = value!),
          title: const Text('Credit Card'),
          secondary: const Icon(Icons.credit_card),
        ),
        RadioListTile<String>(
          value: 'paypal',
          groupValue: selectedValue2,
          onChanged: (value) => setState(() => selectedValue2 = value!),
          title: const Text('PayPal'),
          secondary: const Icon(Icons.payment),
        ),
      ],
    );
  }

  Widget _buildSizeExample() {
    return Wrap(
      spacing: 8,
      children: ['S', 'M', 'L', 'XL'].map((size) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selectedValue2 == size 
                ? Colors.purple 
                : Colors.grey[200],
          ),
          child: Radio<String>(
            value: size,
            groupValue: selectedValue2,
            onChanged: (value) => setState(() => 
              selectedValue2 = value!
            ),
            activeColor: Colors.white,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTimeSlotExample() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RadioListTile<String>(
          value: 'morning',
          groupValue: selectedValue2,
          onChanged: (value) => setState(() => selectedValue2 = value!),
          title: const Text('Morning (9:00 - 12:00)'),
          secondary: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: selectedValue2 == 'morning' 
                  ? Colors.orange.withOpacity(0.2) 
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.wb_sunny,
              color: selectedValue2 == 'morning' 
                  ? Colors.orange 
                  : Colors.grey,
            ),
          ),
        ),
        RadioListTile<String>(
          value: 'afternoon',
          groupValue: selectedValue2,
          onChanged: (value) => setState(() => selectedValue2 = value!),
          title: const Text('Afternoon (1:00 - 5:00)'),
          secondary: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: selectedValue2 == 'afternoon' 
                  ? Colors.blue.withOpacity(0.2) 
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.wb_cloudy,
              color: selectedValue2 == 'afternoon' 
                  ? Colors.blue 
                  : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryExample() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var option in [
          {'value': 'standard', 'title': 'Standard', 'subtitle': '3-5 days', 'price': '\$0'},
          {'value': 'express', 'title': 'Express', 'subtitle': '1-2 days', 'price': '\$9.99'},
        ])
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: selectedValue2 == option['value'] 
                    ? Colors.blue 
                    : Colors.grey[300]!,
              ),
            ),
            child: RadioListTile<String>(
              value: option['value']!,
              groupValue: selectedValue2,
              onChanged: (value) => setState(() => selectedValue2 = value!),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(option['title']!),
                  Text(
                    option['price']!,
                    style: TextStyle(
                      color: selectedValue2 == option['value'] 
                          ? Colors.blue 
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              subtitle: Text(option['subtitle']!),
            ),
          ),
      ],
    );
  }

  Widget _buildRatingExample() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        final rating = index + 1;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<int>(
              value: rating,
              groupValue: selectedValue1,
              onChanged: (value) => setState(() => selectedValue1 = value!),
              activeColor: Colors.amber,
            ),
            Icon(
              Icons.star,
              color: selectedValue1 >= rating ? Colors.amber : Colors.grey[300],
            ),
            Text(
              rating.toString(),
              style: TextStyle(
                color: selectedValue1 >= rating ? Colors.amber : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildLanguageExample() {
    final Map<String, Map<String, dynamic>> languages = {
      'en': {
        'name': 'English',
        'native': 'English',
        'flag': '🇺🇸',
      },
      'es': {
        'name': 'Spanish',
        'native': 'Español',
        'flag': '🇪🇸',
      },
      'fr': {
        'name': 'French',
        'native': 'Français',
        'flag': '🇫🇷',
      },
    };

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: languages.entries.map((entry) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: selectedValue2 == entry.key 
                ? Colors.blue.withOpacity(0.1) 
                : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: RadioListTile<String>(
            value: entry.key,
            groupValue: selectedValue2,
            onChanged: (value) => setState(() => selectedValue2 = value!),
            title: Row(
              children: [
                Text(
                  entry.value['flag'],
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 8),
                Text(entry.value['name']),
                const SizedBox(width: 8),
                Text(
                  '(${entry.value['native']})',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTip(String title, String description, String code) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.03),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              code,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorExample() {
    final List<Map<String, dynamic>> colors = [
      {'value': 'blue', 'color': Colors.blue, 'name': 'Ocean'},
      {'value': 'green', 'color': Colors.green, 'name': 'Forest'},
      {'value': 'purple', 'color': Colors.purple, 'name': 'Lavender'},
    ];

    return Wrap(
      spacing: 12,
      children: colors.map((color) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color['color'],
                    shape: BoxShape.circle,
                    boxShadow: [
                      if (selectedValue2 == color['value'])
                        BoxShadow(
                          color: color['color'].withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                    ],
                  ),
                ),
                Radio<String>(
                  value: color['value'],
                  groupValue: selectedValue2,
                  onChanged: (value) => setState(() => selectedValue2 = value!),
                  activeColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              color['name'],
              style: TextStyle(
                color: selectedValue2 == color['value'] 
                    ? color['color'] 
                    : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildAudioQualityExample() {
    final List<Map<String, dynamic>> qualities = [
      {
        'value': 'auto',
        'title': 'Auto',
        'subtitle': 'Adjusts based on connection',
        'icon': Icons.auto_awesome,
        'bitrate': 'Variable',
      },
      {
        'value': 'high',
        'title': 'High',
        'subtitle': 'Best audio quality',
        'icon': Icons.high_quality,
        'bitrate': '320 kbps',
      },
      {
        'value': 'medium',
        'title': 'Medium',
        'subtitle': 'Balanced quality',
        'icon': Icons.music_note,
        'bitrate': '160 kbps',
      },
    ];

    return Column(
      children: qualities.map((quality) {
        bool isSelected = selectedValue2 == quality['value'];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.1),
                      Colors.purple.withOpacity(0.1),
                    ],
                  )
                : null,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey[300]!,
            ),
          ),
          child: RadioListTile<String>(
            value: quality['value'],
            groupValue: selectedValue2,
            onChanged: (value) => setState(() => selectedValue2 = value!),
            title: Row(
              children: [
                Text(quality['title']),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? Colors.blue.withOpacity(0.1) 
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    quality['bitrate'],
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Text(quality['subtitle']),
            secondary: Icon(
              quality['icon'],
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLayoutExample() {
    final List<Map<String, dynamic>> layouts = [
      {
        'value': 'grid' as String,
        'icon': Icons.grid_view as IconData,
        'label': 'Grid' as String,
      },
      {
        'value': 'list' as String,
        'icon': Icons.view_list as IconData,
        'label': 'List' as String,
      },
      {
        'value': 'card' as String,
        'icon': Icons.view_carousel as IconData,
        'label': 'Cards' as String,
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var layout in layouts)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: selectedValue2 == layout['value']
                      ? Colors.blue.withOpacity(0.1)
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Radio<String>(
                  value: layout['value'] as String,
                  groupValue: selectedValue2,
                  onChanged: (value) => setState(() => selectedValue2 = value!),
                ),
              ),
              const SizedBox(height: 8),
              Icon(
                layout['icon'] as IconData,
                color: selectedValue2 == layout['value']
                    ? Colors.blue
                    : Colors.grey,
              ),
              Text(
                layout['label'] as String,
                style: TextStyle(
                  color: selectedValue2 == layout['value']
                      ? Colors.blue
                      : Colors.grey,
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildPerformanceExample() {
    final List<Map<String, dynamic>> modes = [
      {
        'value': 'balanced' as String,
        'title': 'Balanced' as String,
        'description': 'Optimal performance and battery life' as String,
        'icon': Icons.tune as IconData,
      },
      {
        'value': 'performance' as String,
        'title': 'Performance' as String,
        'description': 'Maximum speed, higher battery usage' as String,
        'icon': Icons.speed as IconData,
      },
      {
        'value': 'battery' as String,
        'title': 'Battery Saver' as String,
        'description': 'Extended battery life, reduced performance' as String,
        'icon': Icons.battery_charging_full as IconData,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          for (var mode in modes)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: RadioListTile<String>(
                value: mode['value'] as String,
                groupValue: selectedValue2,
                onChanged: (value) => setState(() => selectedValue2 = value!),
                title: Row(
                  children: [
                    Icon(
                      mode['icon'] as IconData,
                      color: selectedValue2 == mode['value']
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(mode['title'] as String),
                  ],
                ),
                subtitle: Text(mode['description'] as String),
                selected: selectedValue2 == mode['value'],
              ),
            ),
        ],
      ),
    );
  }
}

class RadioOption {
  final int value;
  final String title;
  final String subtitle;
  final IconData icon;

  RadioOption({
    required this.value,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
} 