import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool isEnabled1 = false;
  bool isEnabled2 = false;
  bool isEnabled3 = false;

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
        children: [
          // Basic Switch
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Basic Switch',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Simple on/off switch',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
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
Switch(
  value: isEnabled,
  onChanged: (bool value) {
    setState(() {
      isEnabled = value;
    });
  },
),'''),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Colored Switch
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Colored Switch',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Switch with custom colors',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
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
Switch(
  value: isEnabled,
  onChanged: (bool value) {
    setState(() {
      isEnabled = value;
    });
  },
  activeColor: Colors.green,
  activeTrackColor: Colors.green[200],
),'''),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // SwitchListTile
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SwitchListTile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Switch with title and subtitle',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                SwitchListTile(
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
),'''),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 