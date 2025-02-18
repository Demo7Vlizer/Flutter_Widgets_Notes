import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> with SingleTickerProviderStateMixin {
  // Basic switch values
  bool isEnabled1 = false;
  bool isEnabled2 = false;
  bool isEnabled3 = false;

  // Animated switch values
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isAnimated = false;
  Color _switchColor = Colors.blue;

  // For custom switch
  bool _isCustomEnabled = false;
  double _customSize = 24.0;

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

  Widget _buildSettingsSwitchTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title),
      subtitle: Text(subtitle),
      secondary: Icon(icon),
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
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text(description, style: TextStyle(color: Colors.grey[600])),
          const SizedBox(height: 8),
          example,
        ],
      ),
    );
  }

  Widget _buildThemeToggle() => Switch(
        value: isEnabled1,
        onChanged: (value) => setState(() => isEnabled1 = value),
      );

  Widget _buildFeatureToggle() => Switch(
        value: isEnabled2,
        onChanged: (value) => setState(() => isEnabled2 = value),
      );

  Widget _buildConnectionToggle() => Switch(
        value: isEnabled3,
        onChanged: (value) => setState(() => isEnabled3 = value),
      );

  Widget _buildBestPractice(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(description, style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildAlternative({
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        child,
      ],
    );
  }

  Widget _buildTip(String title, String description, String code) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(description, style: TextStyle(color: Colors.grey[600])),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
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
            'What is Switch?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'A Switch is a Material Design widget that toggles between two states: on and off. '
            'It\'s commonly used for binary settings where users can toggle features or functionalities.',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),

          // Animated Switch
          _buildSection(
            title: 'Animated Switch',
            subtitle: 'Switch with scale and color animations',
            child: Center(
              child: GestureDetector(
                onTapDown: (_) => _controller.forward(),
                onTapUp: (_) => _controller.reverse(),
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Switch(
                    value: _isAnimated,
                    onChanged: (value) {
                      setState(() {
                        _isAnimated = value;
                        _switchColor = value ? Colors.green : Colors.blue;
                      });
                    },
                    activeColor: _switchColor,
                  ),
                ),
              ),
            ),
            codeExample: '''
ScaleTransition(
  scale: _scaleAnimation,
  child: Switch(
    value: isAnimated,
    onChanged: (value) {
      setState(() {
        isAnimated = value;
        switchColor = value ? Colors.green : Colors.blue;
      });
    },
    activeColor: switchColor,
  ),
),''',
          ),

          // Custom Animated Switch
          _buildSection(
            title: 'Custom Animated Switch',
            subtitle: 'Switch with custom animations and effects',
            child: Center(
              child: GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _customSize = 32.0;
                    _isCustomEnabled = !_isCustomEnabled;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _customSize = 24.0;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 52,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _isCustomEnabled ? Colors.green : Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 200),
                        left: _isCustomEnabled ? 24 : 4,
                        top: 4,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            codeExample: '''
AnimatedContainer(
  duration: Duration(milliseconds: 200),
  width: 52,
  height: 32,
  decoration: BoxDecoration(
    color: isEnabled ? Colors.green : Colors.grey[300],
    borderRadius: BorderRadius.circular(16),
  ),
  child: Stack(
    children: [
      AnimatedPositioned(
        duration: Duration(milliseconds: 200),
        left: isEnabled ? 24 : 4,
        top: 4,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),''',
          ),

          // Basic Switch
          _buildSection(
            title: 'Basic Switch',
            subtitle: 'Simple on/off switch',
            child: Row(
              children: [
                Switch(
                  value: isEnabled1,
                  onChanged: (bool value) {
                    setState(() {
                      isEnabled1 = value;
                    });
                  },
                ),
                const Text('Toggle me'),
              ],
            ),
            codeExample: '''
Switch(
  value: isEnabled,
  onChanged: (bool value) {
    setState(() {
      isEnabled = value;
    });
  },
),''',
          ),
          const Divider(height: 1),
          // Colored Switch
          _buildSection(
            title: 'Colored Switch',
            subtitle: 'Switch with custom colors',
            child: Row(
              children: [
                Switch(
                  value: isEnabled2,
                  onChanged: (bool value) {
                    setState(() {
                      isEnabled2 = value;
                    });
                  },
                  activeColor: Colors.green,
                  activeTrackColor: Colors.green[200],
                ),
                const Text('Custom colors'),
              ],
            ),
            codeExample: '''
Switch(
  value: isEnabled,
  onChanged: (bool value) {
    setState(() {
      isEnabled = value;
    });
  },
  activeColor: Colors.green,
  activeTrackColor: Colors.green[200],
),''',
          ),
          const Divider(height: 1),
          // SwitchListTile
          _buildSection(
            title: 'SwitchListTile',
            subtitle: 'Switch with title and subtitle',
            child: SwitchListTile(
              value: isEnabled3,
              onChanged: (bool value) {
                setState(() {
                  isEnabled3 = value;
                });
              },
              title: const Text('Notifications'),
              subtitle: const Text('Enable push notifications'),
              secondary: const Icon(Icons.notifications),
            ),
            codeExample: '''
SwitchListTile(
  value: isEnabled,
  onChanged: (bool value) {
    setState(() {
      isEnabled = value;
    });
  },
  title: Text('Notifications'),
  subtitle: Text('Enable push notifications'),
  secondary: Icon(Icons.notifications),
),''',
          ),

          // Interactive Examples Section
          _buildSection(
            title: 'Theme Settings Example',
            subtitle: 'Interactive settings with switches',
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildSettingsSwitchTile(
                    title: 'Dark Mode',
                    subtitle: 'Enable dark theme',
                    icon: Icons.dark_mode,
                    value: isEnabled1,
                    onChanged: (value) => setState(() => isEnabled1 = value),
                  ),
                  _buildSettingsSwitchTile(
                    title: 'Notifications',
                    subtitle: 'Enable push notifications',
                    icon: Icons.notifications,
                    value: isEnabled2,
                    onChanged: (value) => setState(() => isEnabled2 = value),
                  ),
                  _buildSettingsSwitchTile(
                    title: 'Auto Update',
                    subtitle: 'Update app automatically',
                    icon: Icons.system_update,
                    value: isEnabled3,
                    onChanged: (value) => setState(() => isEnabled3 = value),
                  ),
                ],
              ),
            ),
            codeExample: '''
_buildSettingsSwitchTile(
  title: 'Dark Mode',
  subtitle: 'Enable dark theme',
  icon: Icons.dark_mode,
  value: isEnabled,
  onChanged: (value) => setState(() => isEnabled = value),
),''',
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
                  icon: Icons.dark_mode,
                  title: 'Theme Toggle',
                  description: 'Switch between light and dark themes',
                  example: _buildThemeToggle(),
                ),
                _buildUseCase(
                  icon: Icons.notifications,
                  title: 'Feature Toggle',
                  description: 'Enable/disable app features',
                  example: _buildFeatureToggle(),
                ),
                _buildUseCase(
                  icon: Icons.wifi,
                  title: 'Connection Settings',
                  description: 'Toggle network connections',
                  example: _buildConnectionToggle(),
                ),
              ],
            ),
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
                  '1. Clear Labels',
                  'Always provide clear labels indicating what the switch controls',
                ),
                _buildBestPractice(
                  '2. Immediate Feedback',
                  'Changes should take effect immediately when toggled',
                ),
                _buildBestPractice(
                  '3. Visual Feedback',
                  'Provide visual feedback through colors and animations',
                ),
                _buildBestPractice(
                  '4. Consistent Styling',
                  'Maintain consistent switch styling throughout the app',
                ),
              ],
            ),
          ),

          // Alternative Approaches Section
          _buildSection(
            title: 'Alternative Approaches',
            subtitle: 'Different ways to implement toggles',
            child: Column(
              children: [
                _buildAlternative(
                  title: 'Using Checkbox',
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isCustomEnabled,
                        onChanged: (value) => setState(() => 
                          _isCustomEnabled = value!
                        ),
                      ),
                      const Text('Toggle Option'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildAlternative(
                  title: 'Using IconButton',
                  child: IconButton(
                    icon: Icon(
                      _isCustomEnabled 
                          ? Icons.toggle_on 
                          : Icons.toggle_off,
                      size: 32,
                      color: _isCustomEnabled 
                          ? Colors.blue 
                          : Colors.grey,
                    ),
                    onPressed: () => setState(() => 
                      _isCustomEnabled = !_isCustomEnabled
                    ),
                  ),
                ),
              ],
            ),
            codeExample: '''
// Using Checkbox
Checkbox(
  value: isEnabled,
  onChanged: (value) => setState(() => 
    isEnabled = value!
  ),
),

// Using IconButton
IconButton(
  icon: Icon(
    isEnabled ? Icons.toggle_on : Icons.toggle_off,
    color: isEnabled ? Colors.blue : Colors.grey,
  ),
  onPressed: () => setState(() => 
    isEnabled = !isEnabled
  ),
),''',
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
                  '1. State Management',
                  'Use proper state management for complex switches',
                  '''
// Using GetX for state management
final isEnabled = false.obs;
Switch(
  value: isEnabled.value,
  onChanged: (value) => isEnabled.value = value,
),''',
                ),
                _buildTip(
                  '2. Adaptive Switches',
                  'Use platform-specific switches',
                  '''
Switch.adaptive(
  value: isEnabled,
  onChanged: (value) => setState(() => 
    isEnabled = value
  ),
),''',
                ),
                _buildTip(
                  '3. Custom Colors',
                  'Customize switch colors for better UX',
                  '''
Switch(
  value: isEnabled,
  activeColor: Colors.green,
  activeTrackColor: Colors.green[200],
  inactiveThumbColor: Colors.grey[300],
  inactiveTrackColor: Colors.grey[200],
  onChanged: (value) => setState(() => 
    isEnabled = value
  ),
),''',
                ),
              ],
            ),
          ),

          // Advanced Examples Section
          _buildSection(
            title: 'Advanced Switch Examples',
            subtitle: 'Complex switch implementations',
            child: Column(
              children: [
                // Animated Icon Switch
                _buildAdvancedExample(
                  'Animated Icon Switch',
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Switch(
                      value: isEnabled1,
                      onChanged: (value) => setState(() => isEnabled1 = value),
                      thumbIcon: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return const Icon(Icons.check, size: 16, color: Colors.white);
                        }
                        return const Icon(Icons.close, size: 16, color: Colors.grey);
                      }),
                    ),
                  ),
                ),
                
                // Gradient Switch
                _buildAdvancedExample(
                  'Gradient Switch',
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isEnabled2 
                            ? [Colors.blue, Colors.purple] 
                            : [Colors.grey, Colors.grey[600]!],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Switch(
                      value: isEnabled2,
                      onChanged: (value) => setState(() => isEnabled2 = value),
                    ),
                  ),
                ),

                // Size Animated Switch
                _buildAdvancedExample(
                  'Size Animated Switch',
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isEnabled3 ? 60 : 40,
                    child: Switch(
                      value: isEnabled3,
                      onChanged: (value) => setState(() => isEnabled3 = value),
                    ),
                  ),
                ),
              ],
            ),
            codeExample: '''
// Animated Icon Switch
Switch(
  value: isEnabled,
  onChanged: onChanged,
  thumbIcon: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return Icon(Icons.check, size: 16);
    }
    return Icon(Icons.close, size: 16);
  }),
),

// Gradient Switch
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: isEnabled 
          ? [Colors.blue, Colors.purple] 
          : [Colors.grey, Colors.grey[600]!],
    ),
  ),
  child: Switch(
    value: isEnabled,
    onChanged: onChanged,
  ),
),''',
          ),

          // Real-World Examples Section
          _buildSection(
            title: 'Real-World Examples',
            subtitle: 'Common switch implementations',
            child: Column(
              children: [
                _buildRealWorldExample(
                  'App Settings',
                  [
                    {'title': 'Dark Mode', 'icon': Icons.dark_mode},
                    {'title': 'Notifications', 'icon': Icons.notifications},
                    {'title': 'Location Services', 'icon': Icons.location_on},
                  ],
                ),
                const SizedBox(height: 16),
                _buildRealWorldExample(
                  'Privacy Settings',
                  [
                    {'title': 'Show Online Status', 'icon': Icons.visibility},
                    {'title': 'Read Receipts', 'icon': Icons.done_all},
                    {'title': 'Activity Status', 'icon': Icons.access_time},
                  ],
                ),
              ],
            ),
            codeExample: '''
ListView(
  children: [
    SwitchListTile(
      value: darkMode,
      onChanged: onChanged,
      title: Text('Dark Mode'),
      secondary: Icon(Icons.dark_mode),
    ),
    SwitchListTile(
      value: notifications,
      onChanged: onChanged,
      title: Text('Notifications'),
      secondary: Icon(Icons.notifications),
    ),
  ],
),''',
          ),

          // Animated Switch Variants
          _buildSection(
            title: 'Animated Switch Variants',
            subtitle: 'Different animation styles for switches',
            child: Column(
              children: [
                // Rotating Switch
                _buildAnimatedVariant(
                  'Rotating Switch',
                  TweenAnimationBuilder<double>(
                    tween: Tween(
                      begin: 0,
                      end: isEnabled1 ? 2 * 3.14159 : 0,
                    ),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, child) {
                      return Transform.rotate(
                        angle: value,
                        child: Switch(
                          value: isEnabled1,
                          onChanged: (value) => setState(() => isEnabled1 = value),
                        ),
                      );
                    },
                  ),
                ),

                // Sliding Switch
                _buildAnimatedVariant(
                  'Sliding Switch',
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset.zero,
                      end: const Offset(0.1, 0),
                    ).animate(_controller),
                    child: Switch(
                      value: isEnabled2,
                      onChanged: (value) {
                        setState(() => isEnabled2 = value);
                        _controller.forward(from: 0);
                      },
                    ),
                  ),
                ),

                // Fading Switch
                _buildAnimatedVariant(
                  'Fading Switch',
                  AnimatedOpacity(
                    opacity: isEnabled3 ? 1.0 : 0.5,
                    duration: const Duration(milliseconds: 200),
                    child: Switch(
                      value: isEnabled3,
                      onChanged: (value) => setState(() => isEnabled3 = value),
                    ),
                  ),
                ),
              ],
            ),
            codeExample: '''
// Rotating Switch
TweenAnimationBuilder<double>(
  tween: Tween(
    begin: 0,
    end: isEnabled ? 2 * pi : 0,
  ),
  duration: Duration(milliseconds: 500),
  builder: (context, value, child) {
    return Transform.rotate(
      angle: value,
      child: Switch(
        value: isEnabled,
        onChanged: onChanged,
      ),
    );
  },
),

// Sliding Switch
SlideTransition(
  position: Tween<Offset>(
    begin: Offset.zero,
    end: Offset(0.1, 0),
  ).animate(controller),
  child: Switch(
    value: isEnabled,
    onChanged: onChanged,
  ),
),''',
          ),

          // Interactive Settings Panel
          _buildSection(
            title: 'Interactive Settings Panel',
            subtitle: 'Complete settings panel example',
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSettingsCategory(
                    'Display',
                    [
                      _buildSettingItem(
                        'Dark Mode',
                        Icons.dark_mode,
                        isEnabled1,
                        (value) => setState(() => isEnabled1 = value),
                      ),
                      _buildSettingItem(
                        'Auto Brightness',
                        Icons.brightness_auto,
                        isEnabled2,
                        (value) => setState(() => isEnabled2 = value),
                      ),
                    ],
                  ),
                  _buildSettingsCategory(
                    'Sound',
                    [
                      _buildSettingItem(
                        'Sound Effects',
                        Icons.music_note,
                        isEnabled3,
                        (value) => setState(() => isEnabled3 = value),
                      ),
                      _buildSettingItem(
                        'Haptic Feedback',
                        Icons.vibration,
                        _isCustomEnabled,
                        (value) => setState(() => _isCustomEnabled = value),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            codeExample: '''
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 8,
      ),
    ],
  ),
  child: Column(
    children: [
      _buildSettingsCategory(
        'Display',
        [
          _buildSettingItem(
            'Dark Mode',
            Icons.dark_mode,
            isEnabled,
            onChanged,
          ),
        ],
      ),
    ],
  ),
),''',
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedExample(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: child),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildRealWorldExample(String title, List<Map<String, dynamic>> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const Divider(height: 1),
          ...items.map((item) => SwitchListTile(
            value: isEnabled1,
            onChanged: (value) => setState(() => isEnabled1 = value),
            title: Text(item['title']),
            secondary: Icon(item['icon']),
          )),
        ],
      ),
    );
  }

  Widget _buildAnimatedVariant(String title, Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Center(child: child),
        ],
      ),
    );
  }

  Widget _buildSettingsCategory(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...items,
      ],
    );
  }

  Widget _buildSettingItem(
    String title,
    IconData icon,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        title: Text(title),
        secondary: Icon(icon),
      ),
    );
  }
} 