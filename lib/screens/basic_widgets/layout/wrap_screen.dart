import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrapScreen extends StatefulWidget {
  const WrapScreen({super.key});

  @override
  State<WrapScreen> createState() => _WrapScreenState();
}

class _WrapScreenState extends State<WrapScreen> {
  // State variables for interactive examples
  List<String> selectedSizes = [];
  List<Color> selectedColors = [];
  double spacing = 8.0;
  double runSpacing = 8.0;
  WrapAlignment alignment = WrapAlignment.start;
  Axis direction = Axis.horizontal;

  // Sample data
  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
  ];

  final List<String> skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'REST API',
    'GraphQL',
    'State Management',
    'UI/UX',
    'Git',
    'CI/CD',
    'Testing',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Definition Section
          _buildDefinitionSection(),
          const SizedBox(height: 24),

          // Interactive Controls Section
          _buildInteractiveControlsSection(),
          const SizedBox(height: 24),

          // Real-world Examples
          _buildRealWorldExamples(),
        ],
      ),
    );
  }

  Widget _buildDefinitionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What is Wrap?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Wrap is a widget that displays its children in multiple horizontal or vertical runs. '
          'Unlike Row or Column, Wrap will automatically flow to the next line when it runs out of space.',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 16),
        _buildCodePreview(
          title: 'Basic Wrap Structure',
          code: '''
Wrap(
  spacing: 8.0,      // Space between children horizontally
  runSpacing: 8.0,   // Space between runs vertically
  direction: Axis.horizontal,  // Main axis direction
  alignment: WrapAlignment.start,  // Alignment along the main axis
  children: [
    Widget1(),
    Widget2(),
    // More widgets...
  ],
)''',
        ),
      ],
    );
  }

  Widget _buildInteractiveControlsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Interactive Controls',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // Spacing Control
        Text('Spacing: ${spacing.toStringAsFixed(1)}'),
        Slider(
          value: spacing,
          min: 0,
          max: 32,
          onChanged: (value) => setState(() => spacing = value),
        ),

        // Run Spacing Control
        Text('Run Spacing: ${runSpacing.toStringAsFixed(1)}'),
        Slider(
          value: runSpacing,
          min: 0,
          max: 32,
          onChanged: (value) => setState(() => runSpacing = value),
        ),

        // Direction Toggle
        Row(
          children: [
            const Text('Direction: '),
            SegmentedButton<Axis>(
              segments: const [
                ButtonSegment(
                  value: Axis.horizontal,
                  label: Text('Horizontal'),
                ),
                ButtonSegment(
                  value: Axis.vertical,
                  label: Text('Vertical'),
                ),
              ],
              selected: {direction},
              onSelectionChanged: (Set<Axis> selected) {
                setState(() => direction = selected.first);
              },
            ),
          ],
        ),

        // Alignment Control
        Row(
          children: [
            const Text('Alignment: '),
            DropdownButton<WrapAlignment>(
              value: alignment,
              items: WrapAlignment.values.map((align) {
                return DropdownMenuItem(
                  value: align,
                  child: Text(align.toString().split('.').last),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) setState(() => alignment = value);
              },
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Interactive Demo
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Interactive Demo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: direction == Axis.horizontal ? null : 200,
                child: Wrap(
                  spacing: spacing,
                  runSpacing: runSpacing,
                  direction: direction,
                  alignment: alignment,
                  children: List.generate(12, (index) {
                    return Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.blue[100 * ((index % 6) + 1)],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: Text('${index + 1}')),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRealWorldExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Real-world Examples',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // E-commerce Size Selector
        _buildSizeSelector(),
        const SizedBox(height: 24),

        // Color Palette Selector
        _buildColorPalette(),
        const SizedBox(height: 24),

        // Skill Tags
        _buildSkillTags(),
        const SizedBox(height: 24),

        // Social Media Hashtags
        _buildSocialHashtags(),
      ],
    );
  }

  Widget _buildSizeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size Selector (E-commerce)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: sizes.map((size) {
            final isSelected = selectedSizes.contains(size);
            return InkWell(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedSizes.remove(size);
                  } else {
                    selectedSizes.add(size);
                  }
                });
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.white,
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    size,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Size Selector Code',
          code: '''
Wrap(
  spacing: 8,
  runSpacing: 8,
  children: sizes.map((size) {
    final isSelected = selectedSizes.contains(size);
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedSizes.remove(size);
          } else {
            selectedSizes.add(size);
          }
        });
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }).toList(),
)''',
        ),
      ],
    );
  }

  Widget _buildColorPalette() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color Palette Selector',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: colors.map((color) {
            final isSelected = selectedColors.contains(color);
            return InkWell(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedColors.remove(color);
                  } else {
                    selectedColors.add(color);
                  }
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.white : Colors.transparent,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Color Palette Code',
          code: '''
Wrap(
  spacing: 12,
  runSpacing: 12,
  children: colors.map((color) {
    final isSelected = selectedColors.contains(color);
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedColors.remove(color);
          } else {
            selectedColors.add(color);
          }
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
        child: isSelected
            ? Icon(Icons.check, color: Colors.white)
            : null,
      ),
    );
  }).toList(),
)''',
        ),
      ],
    );
  }

  Widget _buildSkillTags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skill Tags (Profile)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((skill) {
            return Chip(
              label: Text(skill),
              avatar: const Icon(Icons.code, size: 16),
              backgroundColor: Colors.blue[50],
              side: BorderSide(color: Colors.blue[200]!),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Skill Tags Code',
          code: '''
Wrap(
  spacing: 8,
  runSpacing: 8,
  children: skills.map((skill) {
    return Chip(
      label: Text(skill),
      avatar: Icon(Icons.code, size: 16),
      backgroundColor: Colors.blue[50],
      side: BorderSide(color: Colors.blue[200]!),
    );
  }).toList(),
)''',
        ),
      ],
    );
  }

  Widget _buildSocialHashtags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Social Media Hashtags',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Flutter Developer Community Post',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Just launched my new Flutter app! Check it out! 🚀',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [
                  '#FlutterDev',
                  '#MobileApp',
                  '#CrossPlatform',
                  '#DartLang',
                  '#CodeCommunity',
                  '#AppDevelopment',
                  '#Programming',
                ].map((tag) {
                  return InkWell(
                    onTap: () {},
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Social Hashtags Code',
          code: '''
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.grey[100],
    borderRadius: BorderRadius.circular(12),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Flutter Developer Community Post',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        'Just launched my new Flutter app! Check it out! 🚀',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 8),
      Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          '#FlutterDev',
          '#MobileApp',
          '#CrossPlatform',
          '#DartLang',
          '#CodeCommunity',
          '#AppDevelopment',
          '#Programming',
        ].map((tag) {
          return InkWell(
            onTap: () {},
            child: Text(
              tag,
              style: TextStyle(
                color: Colors.blue[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }).toList(),
      ),
    ],
  ),
)''',
        ),
      ],
    );
  }

  Widget _buildCodePreview({
    required String title,
    required String code,
  }) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.blue[700],
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: SelectableText(
            code,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              color: Colors.grey[800],
            ),
          ),
        ),
      ],
    );
  }
}
