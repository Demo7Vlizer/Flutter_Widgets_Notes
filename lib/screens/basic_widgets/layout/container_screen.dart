import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Map<String, bool> _showCode = {};
  bool _isAnimating = true;
  bool _isPressed = false;
  double _scale = 1.0;
  Offset _position = Offset.zero;
  bool _showMargin = false;
  bool _showPadding = false;
  double _marginValue = 8.0;
  double _paddingValue = 16.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCodeSection(String code, String sectionKey) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _showCode[sectionKey] = !(_showCode[sectionKey] ?? false);
            });
          },
          child: Row(
            children: [
              const Text(
                'View Code',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Icon(
                (_showCode[sectionKey] ?? false) 
                    ? Icons.keyboard_arrow_up 
                    : Icons.keyboard_arrow_down,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        if (_showCode[sectionKey] ?? false)
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Text(code),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
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
                  'What is a Container?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Container is a convenience widget that combines common painting, positioning, and sizing features. '
                  'It can include padding, margins, borders, background color, and other decorations.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Key Features:',
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
                      Text('• Padding and margins'),
                      Text('• Decorations (background, border, shadow)'),
                      Text('• Background color'),
                      Text('• Size constraints'),
                      Text('• Positioning and alignment'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // ... existing basic container example ...
          
          // Decoration Example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Container with Decoration',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Using BoxDecoration for advanced styling',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text('Container with decoration'),
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
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: Colors.blue),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: Text('Container with decoration'),
),'''),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          
          // Margin vs Padding Example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Margin vs Padding',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Interactive demo to understand the difference',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 300,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => setState(() => _showMargin = !_showMargin),
                            icon: Icon(_showMargin ? Icons.visibility : Icons.visibility_off),
                            label: const Text('Toggle Margin'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[300],
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () => setState(() => _showPadding = !_showPadding),
                            icon: Icon(_showPadding ? Icons.visibility : Icons.visibility_off),
                            label: const Text('Toggle Padding'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[300],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: Stack(
                          children: [
                            // Background Grid
                            GridPattern(gridSize: 20),
                            Center(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.all(_showMargin ? _marginValue : 0),
                                child: Stack(
                                  children: [
                                    // Margin Indicator
                                    if (_showMargin)
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.2),
                                          border: Border.all(
                                            color: Colors.blue,
                                            width: 1,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Margin Area',
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      ),
                                    // Main Container
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      padding: EdgeInsets.all(_showPadding ? _paddingValue : 0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Stack(
                                        children: [
                                          // Padding Indicator
                                          if (_showPadding)
                                            Positioned.fill(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: Colors.green.withOpacity(0.2),
                                                  border: Border.all(
                                                    color: Colors.green,
                                                    width: 1,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Padding Area',
                                                    style: TextStyle(color: Colors.green),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          const Center(
                                            child: Text(
                                              'Content',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Sliders
                      if (_showMargin)
                        Column(
                          children: [
                            const Text('Margin Size'),
                            Slider(
                              value: _marginValue,
                              min: 0,
                              max: 50,
                              activeColor: Colors.blue,
                              label: _marginValue.round().toString(),
                              onChanged: (value) => setState(() => _marginValue = value),
                            ),
                          ],
                        ),
                      if (_showPadding)
                        Column(
                          children: [
                            const Text('Padding Size'),
                            Slider(
                              value: _paddingValue,
                              min: 0,
                              max: 50,
                              activeColor: Colors.green,
                              label: _paddingValue.round().toString(),
                              onChanged: (value) => setState(() => _paddingValue = value),
                            ),
                          ],
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
                  '• Margin (blue) creates space outside the container\n'
                  '• Padding (green) creates space inside the container\n'
                  '• Toggle buttons show/hide the spacing areas\n'
                  '• Use sliders to adjust the spacing size',
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ),
          // ... existing code ...

          // Animated Container Example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Animated Container',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Container with animated properties',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _controller.value * 2.0 * math.pi,
                        child: Container(
                          width: 100 + (50 * math.sin(_controller.value * math.pi)),
                          height: 100 + (50 * math.sin(_controller.value * math.pi)),
                          decoration: BoxDecoration(
                            color: Color.lerp(
                              Colors.blue[100],
                              Colors.purple[100],
                              _controller.value,
                            ),
                            borderRadius: BorderRadius.circular(
                              8 + (8 * math.sin(_controller.value * math.pi)),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5 + (5 * math.sin(_controller.value * math.pi)),
                                offset: Offset(0, 3 + (2 * math.sin(_controller.value * math.pi))),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text('Animated!'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isAnimating = !_isAnimating;
                          if (_isAnimating) {
                            _controller.repeat();
                          } else {
                            _controller.stop();
                          }
                        });
                      },
                      child: Text(_isAnimating ? 'Stop' : 'Start'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildCodeSection('''
AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    return Transform.rotate(
      angle: _controller.value * 2.0 * math.pi,
      child: Container(
        width: 100 + (50 * math.sin(_controller.value * math.pi)),
        height: 100 + (50 * math.sin(_controller.value * math.pi)),
        decoration: BoxDecoration(
          color: Color.lerp(
            Colors.blue[100],
            Colors.purple[100],
            _controller.value,
          ),
          borderRadius: BorderRadius.circular(
            8 + (8 * math.sin(_controller.value * math.pi)),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5 + (5 * math.sin(_controller.value * math.pi)),
              offset: Offset(0, 3 + (2 * math.sin(_controller.value * math.pi))),
            ),
          ],
        ),
        child: Center(
          child: Text('Animated!'),
        ),
      ),
    );
  },
),''', 'animated_container'),
              ],
            ),
          ),
          const Divider(height: 1),

          // Interactive Container Transform
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Interactive Container',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Try these interactions:\n• Tap and hold\n• Drag around\n• Double tap',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: GestureDetector(
                      onTapDown: (details) => setState(() {
                        _isPressed = true;
                        _scale = 0.95;
                      }),
                      onTapUp: (details) => setState(() {
                        _isPressed = false;
                        _scale = 1.0;
                      }),
                      onTapCancel: () => setState(() {
                        _isPressed = false;
                        _scale = 1.0;
                      }),
                      onDoubleTap: () => setState(() {
                        _position = Offset.zero;
                        _scale = 1.0;
                      }),
                      onPanUpdate: (details) => setState(() {
                        _position += details.delta;
                      }),
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          transform: Matrix4.identity()
                            ..translate(_position.dx, _position.dy)
                            ..scale(_scale),
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            color: _isPressed ? Colors.blue[200] : Colors.blue[100],
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: _isPressed ? 1 : 2,
                                blurRadius: _isPressed ? 3 : 7,
                                offset: Offset(0, _isPressed ? 2 : 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Interact with me!',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Drag • Hold • Double-tap to reset',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _buildCodeSection('''
GestureDetector(
  onTapDown: (details) => setState(() {
    _isPressed = true;
    _scale = 0.95;
  }),
  onPanUpdate: (details) => setState(() {
    _position += details.delta;
  }),
  onDoubleTap: () => setState(() {
    _position = Offset.zero;
    _scale = 1.0;
  }),
  child: AnimatedContainer(
    duration: Duration(milliseconds: 150),
    transform: Matrix4.identity()
      ..translate(_position.dx, _position.dy)
      ..scale(_scale),
    decoration: BoxDecoration(
      color: _isPressed ? Colors.blue[200] : Colors.blue[100],
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: _isPressed ? 1 : 2,
          blurRadius: _isPressed ? 3 : 7,
          offset: Offset(0, _isPressed ? 2 : 4),
        ),
      ],
    ),
    child: Center(child: Text('Interact with me!')),
  ),
),''', 'interactive_container'),
              ],
            ),
          ),
          
          // ... rest of your existing examples ...
        ],
      ),
    );
  }
}

class GridPattern extends StatelessWidget {
  final double gridSize;

  const GridPattern({super.key, this.gridSize = 20});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GridPainter(gridSize: gridSize),
      child: Container(),
    );
  }
}

class GridPainter extends CustomPainter {
  final double gridSize;

  GridPainter({required this.gridSize});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 0.5;

    for (double i = 0; i < size.width; i += gridSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += gridSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} 