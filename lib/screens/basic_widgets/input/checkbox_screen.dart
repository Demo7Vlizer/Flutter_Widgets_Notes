import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../../widgets/example_section.dart';
class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> with SingleTickerProviderStateMixin {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  // bool _showCode = false;

  // For animated checkbox
  bool _isAnimatedChecked = false;
  // double _checkSize = 24.0; // Default size
  Color _checkColor = Colors.blue;

  // For todo list
  final List<TodoItem> _todos = [
    TodoItem(title: 'Learn Flutter', subtitle: 'Study widgets and animations'),
    TodoItem(title: 'Build App', subtitle: 'Create amazing user experiences'),
    TodoItem(title: 'Share Knowledge', subtitle: 'Help others learn Flutter'),
  ];

  // Add these variables to the state class
  bool _isCustomChecked = false;
  double _customCheckSize = 24.0;
  // bool _isTriState = false;
  bool? _triStateValue = false;
  int _selectedCount = 0;

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
        title: const Text('Checkbox'),
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
            'What is Checkbox?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'A Checkbox is a Material Design widget that lets users select one or more items from a set. '
            'It\'s commonly used in forms, settings, and lists.',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),

          // Animated Checkbox
          _buildSection(
            title: 'Animated Checkbox',
            subtitle: 'Checkbox with scale and color animations',
            child: Center(
              child: GestureDetector(
                onTapDown: (_) => _controller.forward(),
                onTapUp: (_) => _controller.reverse(),
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Checkbox(
                    value: _isAnimatedChecked,
                    onChanged: (value) {
                      setState(() {
                        _isAnimatedChecked = value!;
                        _checkColor = value 
                            ? Colors.green 
                            : Colors.blue;
                        _customCheckSize = value ? 28.0 : 24.0;
                      });
                    },
                    activeColor: _checkColor,
                  ),
                ),
              ),
            ),
            codeExample: '''
ScaleTransition(
  scale: scaleAnimation,
  child: Checkbox(
    value: isChecked,
    onChanged: (value) {
      setState(() {
        isChecked = value!;
        checkColor = value ? Colors.green : Colors.blue;
        customCheckSize = value ? 28.0 : 24.0;
      });
    },
    activeColor: checkColor,
  ),
),''',
          ),

          // Interactive Todo List
          _buildSection(
            title: 'Interactive Todo List',
            subtitle: 'Checkbox list with animations',
            child: Column(
              children: _todos.map((todo) => _buildAnimatedTodoItem(todo)).toList(),
            ),
            codeExample: '''
CheckboxListTile(
  value: todo.isCompleted,
  onChanged: (value) {
    setState(() {
      todo.isCompleted = value!;
    });
  },
  title: AnimatedDefaultTextStyle(
    duration: Duration(milliseconds: 300),
    style: TextStyle(
      decoration: todo.isCompleted 
          ? TextDecoration.lineThrough 
          : TextDecoration.none,
      color: todo.isCompleted 
          ? Colors.grey 
          : Colors.black,
    ),
    child: Text(todo.title),
  ),
  secondary: AnimatedContainer(
    duration: Duration(milliseconds: 300),
    decoration: BoxDecoration(
      color: todo.isCompleted 
          ? Colors.green 
          : Colors.blue,
      shape: BoxShape.circle,
    ),
    child: Icon(
      todo.isCompleted 
          ? Icons.check 
          : Icons.hourglass_empty,
      color: Colors.white,
    ),
  ),
),''',
          ),

          // Color Changing Checkbox
          _buildSection(
            title: 'Color Changing Checkbox',
            subtitle: 'Checkbox with dynamic colors',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildColorCheckbox(Colors.red),
                _buildColorCheckbox(Colors.green),
                _buildColorCheckbox(Colors.blue),
                _buildColorCheckbox(Colors.purple),
              ],
            ),
            codeExample: '''
Checkbox(
  value: isChecked,
  onChanged: (value) {
    setState(() => isChecked = value!);
  },
  activeColor: color,
  checkColor: Colors.white,
),''',
          ),

          // Custom Animated Checkbox
          _buildSection(
            title: 'Custom Animated Checkbox',
            subtitle: 'Checkbox with custom animations and effects',
            child: Center(
              child: GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _customCheckSize = 32.0;
                    _isCustomChecked = !_isCustomChecked;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _customCheckSize = 24.0;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _customCheckSize,
                  height: _customCheckSize,
                  decoration: BoxDecoration(
                    color: _isCustomChecked ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    boxShadow: _isCustomChecked
                        ? [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ]
                        : null,
                  ),
                  child: _isCustomChecked
                      ? Center(
                          child: TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 200),
                            tween: Tween(begin: 0.0, end: 1.0),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              );
                            },
                          ),
                        )
                      : null,
                ),
              ),
            ),
            codeExample: '''
AnimatedContainer(
  duration: Duration(milliseconds: 200),
  width: customCheckSize,
  height: customCheckSize,
  decoration: BoxDecoration(
    color: isCustomChecked ? Colors.blue : Colors.white,
    borderRadius: BorderRadius.circular(6),
    border: Border.all(color: Colors.blue, width: 2),
    boxShadow: isCustomChecked
        ? [BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          )]
        : null,
  ),
  child: isCustomChecked
      ? TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 200),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Icon(Icons.check, color: Colors.white),
            );
          },
        )
      : null,
),''',
          ),

          // Tri-State Checkbox
          _buildSection(
            title: 'Tri-State Checkbox',
            subtitle: 'Checkbox with three states',
            child: Column(
              children: [
                CheckboxListTile(
                  title: const Text('Parent Checkbox'),
                  value: _triStateValue,
                  tristate: true,
                  onChanged: (bool? value) {
                    setState(() {
                      _triStateValue = value;
                      if (value != null) {
                        _selectedCount = value ? 3 : 0;
                      }
                    });
                  },
                ),
                const Divider(),
                ...List.generate(3, (index) {
                  return CheckboxListTile(
                    title: Text('Child Item ${index + 1}'),
                    value: _triStateValue ?? _selectedCount > index,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) {
                          _selectedCount += value ? 1 : -1;
                          _triStateValue = _selectedCount == 0 
                              ? false 
                              : _selectedCount == 3 
                                  ? true 
                                  : null;
                        }
                      });
                    },
                  );
                }),
              ],
            ),
            codeExample: '''
CheckboxListTile(
  title: Text('Parent'),
  value: triStateValue,
  tristate: true,
  onChanged: (bool? value) {
    setState(() {
      triStateValue = value;
      selectedCount = value != null 
          ? (value ? 3 : 0) 
          : selectedCount;
    });
  },
),''',
          ),

          // Animated Checkbox Group
          _buildSection(
            title: 'Animated Checkbox Group',
            subtitle: 'Group of checkboxes with ripple effect',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'Flutter', 'Dart', 'Widgets', 'Animation'
              ].map((label) => _buildRippleCheckbox(label)).toList(),
            ),
            codeExample: '''
Material(
  color: Colors.transparent,
  child: InkWell(
    onTap: () => setState(() => isSelected = !isSelected),
    borderRadius: BorderRadius.circular(8),
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: isSelected,
            onChanged: (value) => setState(() => 
              isSelected = value!
            ),
          ),
          Text(label),
        ],
      ),
    ),
  ),
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
                  icon: Icons.check_circle,
                  title: 'State Management',
                  description: 'Always use setState or state management solutions to update checkbox state',
                ),
                _buildKeyPoint(
                  icon: Icons.design_services,
                  title: 'Customization',
                  description: 'Can be customized using activeColor, checkColor, and shape properties',
                ),
                _buildKeyPoint(
                  icon: Icons.accessibility,
                  title: 'Accessibility',
                  description: 'Provides built-in accessibility support for screen readers',
                ),
                _buildKeyPoint(
                  icon: Icons.touch_app,
                  title: 'User Experience',
                  description: 'Consider using CheckboxListTile for better touch targets',
                ),
              ],
            ),
          ),

          // Alternative Approaches Section
          _buildSection(
            title: 'Alternative Approaches',
            subtitle: 'Different ways to implement checkboxes',
            child: Column(
              children: [
                // Switch Alternative
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Using Switch',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Switch(
                      value: _isCustomChecked,
                      onChanged: (value) => setState(() => _isCustomChecked = value),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Custom Toggle Button
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Custom Toggle Button',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => setState(() => _isCustomChecked = !_isCustomChecked),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _isCustomChecked ? Colors.green : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          _isCustomChecked ? Icons.check : Icons.close,
                          color: _isCustomChecked ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Radio Button Alternative
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Using Radio Buttons',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<bool>(
                          value: true,
                          groupValue: _isCustomChecked,
                          onChanged: (value) => setState(() => _isCustomChecked = value!),
                        ),
                        const Text('Yes'),
                        Radio<bool>(
                          value: false,
                          groupValue: _isCustomChecked,
                          onChanged: (value) => setState(() => _isCustomChecked = value!),
                        ),
                        const Text('No'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            codeExample: '''
// Switch Alternative
Switch(
  value: isChecked,
  onChanged: (value) => setState(() => isChecked = value),
),

// Custom Toggle Button
InkWell(
  onTap: () => setState(() => isChecked = !isChecked),
  child: AnimatedContainer(
    duration: Duration(milliseconds: 300),
    decoration: BoxDecoration(
      color: isChecked ? Colors.green : Colors.grey[200],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(
      isChecked ? Icons.check : Icons.close,
      color: isChecked ? Colors.white : Colors.grey,
    ),
  ),
),

// Radio Button Alternative
Row(
  children: [
    Radio<bool>(
      value: true,
      groupValue: isChecked,
      onChanged: (value) => setState(() => isChecked = value!),
    ),
    Text('Yes'),
    Radio<bool>(
      value: false,
      groupValue: isChecked,
      onChanged: (value) => setState(() => isChecked = value!),
    ),
    Text('No'),
  ],
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
                  '1. Use CheckboxListTile for list items',
                  'Provides better touch target and supports additional content',
                ),
                _buildBestPractice(
                  '2. Provide Visual Feedback',
                  'Use animations and color changes to indicate state changes',
                ),
                _buildBestPractice(
                  '3. Group Related Checkboxes',
                  'Use logical grouping for related options',
                ),
                _buildBestPractice(
                  '4. Consider Accessibility',
                  'Ensure proper labeling and sufficient touch targets',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedTodoItem(TodoItem todo) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: todo.isCompleted ? Colors.grey[100] : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: todo.isCompleted ? Colors.grey[300]! : Colors.grey[200]!,
        ),
      ),
      child: CheckboxListTile(
        value: todo.isCompleted,
        onChanged: (value) {
          setState(() => todo.isCompleted = value!);
        },
        title: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            decoration: todo.isCompleted 
                ? TextDecoration.lineThrough 
                : TextDecoration.none,
            color: todo.isCompleted ? Colors.grey : Colors.black,
          ),
          child: Text(todo.title),
        ),
        subtitle: Text(todo.subtitle),
        secondary: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: todo.isCompleted ? Colors.green : Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Icon(
            todo.isCompleted ? Icons.check : Icons.hourglass_empty,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildColorCheckbox(Color color) {
    bool isChecked = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() => isChecked = value!);
          },
          activeColor: color,
          checkColor: Colors.white,
        );
      },
    );
  }

  Widget _buildRippleCheckbox(String label) {
    bool isSelected = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => setState(() => isSelected = !isSelected),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: (value) => setState(() => isSelected = value!),
                  ),
                  Text(label),
                ],
              ),
            ),
          ),
        );
      },
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
}

class TodoItem {
  String title;
  String subtitle;
  bool isCompleted;

  TodoItem({
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
  });
} 