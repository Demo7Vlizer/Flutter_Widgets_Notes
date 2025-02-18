import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'dart:math' as math;
import 'dart:async';

class ElevatedButtonScreen extends StatefulWidget {
  const ElevatedButtonScreen({super.key});

  @override
  State<ElevatedButtonScreen> createState() => _ElevatedButtonScreenState();
}

class _ElevatedButtonScreenState extends State<ElevatedButtonScreen>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  double _buttonSize = 1.0;
  Color _buttonColor = Colors.blue;
  // bool _showCode = false;
  bool _isHovered = false;
  double _elevation = 4.0;
  double _scale = 1.0;
  
  // Animation controllers
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;
  late final Animation<Color?> _colorAnimation;

  // Add these new variables to the state class
  bool _isExpanded = false;
  double _rotationAngle = 0;
  final List<Color> _colorList = [
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.orange,
    Colors.red,
  ];
  int _colorIndex = 0;
  int _clickCount = 0;
  int _targetCount = 5;
  double _timeRemaining = 3.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    
    // Initialize pulse animation controller
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    // Create pulse animation
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    // Create color animation
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.purple,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ElevatedButton'),
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
            'What is ElevatedButton?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'ElevatedButton is a Material Design raised button. It\'s a filled button '
            'that lifts when pressed, creating a 3D effect. Commonly used for primary actions.',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),

          // Basic States Example
          const Text(
            'Basic States',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Different states of ElevatedButton',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: null,
                child: const Text('Disabled'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Enabled'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('With Icon'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Interactive Loading Button
          const Text(
            'Interactive Loading Button',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Button with loading state and animation',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.identity()..scale(_buttonSize),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _buttonColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                onPressed: _isLoading
                    ? null
                    : () async {
                        setState(() {
                          _isLoading = true;
                          _buttonSize = 0.95;
                          _buttonColor = Colors.grey;
                        });
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          _isLoading = false;
                          _buttonSize = 1.0;
                          _buttonColor = Colors.green;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() {
                          _buttonColor = Colors.blue;
                        });
                      },
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Click to Load'),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Styled Buttons Example
          const Text(
            'Styled Buttons',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Custom styled elevated buttons',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () {},
                child: const Text('Rounded'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  elevation: 8,
                ),
                onPressed: () {},
                child: const Text('Square'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text('Custom Shape'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Gradient Button Example
          const Text(
            'Gradient Button',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'ElevatedButton with gradient background',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                onPressed: () {},
                child: const Text('Gradient Button'),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Interactive Elevation Example
          const Text(
            'Interactive Elevation',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Adjust button elevation with slider',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 100,
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: _elevation,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Elevation Demo'),
                    ),
                  ),
                ),
                Slider(
                  value: _elevation,
                  min: 0,
                  max: 20,
                  divisions: 20,
                  label: _elevation.round().toString(),
                  onChanged: (value) => setState(() => _elevation = value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Animated Pulse Button
          const Text(
            'Animated Pulse Button',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Button with pulsing animation effect',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Center(
            child: AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _pulseAnimation.value,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _colorAnimation.value,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    onPressed: () {
                      if (_pulseController.isAnimating) {
                        _pulseController.stop();
                      } else {
                        _pulseController.repeat(reverse: true);
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Pulse Effect'),
                        const SizedBox(width: 8),
                        Icon(
                          _pulseController.isAnimating 
                              ? Icons.pause 
                              : Icons.play_arrow,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Interactive Hover Effects
          const Text(
            'Interactive Hover Effects',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Buttons with different hover animations',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              // Scale Effect
              MouseRegion(
                onEnter: (_) => setState(() => _scale = 1.1),
                onExit: (_) => setState(() => _scale = 1.0),
                child: AnimatedScale(
                  scale: _scale,
                  duration: const Duration(milliseconds: 200),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Scale on Hover'),
                  ),
                ),
              ),
              // Color Shift Effect
              MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      colors: _isHovered
                          ? [Colors.purple, Colors.blue]
                          : [Colors.blue, Colors.purple],
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: const Text('Color Shift'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Button States Showcase
          const Text(
            'Button States Showcase',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Interactive demonstration of button states',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStateButton(
                      'Hover Me',
                      onHover: true,
                    ),
                    _buildStateButton(
                      'Press Me',
                      onPress: true,
                    ),
                    _buildStateButton(
                      'Disabled',
                      isDisabled: true,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Interact with buttons to see different states',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Code Section
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Basic Button:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('''
ElevatedButton(
  onPressed: () {},
  child: Text('Click Me'),
),'''),
                    SizedBox(height: 16),
                    Text(
                      'Styled Button:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('''
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.purple,
    shape: StadiumBorder(),
    padding: EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 12,
    ),
  ),
  onPressed: () {},
  child: Text('Rounded Button'),
),'''),
                    SizedBox(height: 16),
                    Text(
                      'Loading Button:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('''
ElevatedButton(
  onPressed: _isLoading ? null : () async {
    setState(() => _isLoading = true);
    await Future.delayed(Duration(seconds: 2));
    setState(() => _isLoading = false);
  },
  child: _isLoading
      ? CircularProgressIndicator()
      : Text('Click to Load'),
),'''),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Key Points
          const Text(
            'Key Points:',
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
                Text('• Use for primary actions in your app'),
                Text('• Provides visual feedback with elevation'),
                Text('• Supports icons and custom styling'),
                Text('• Can be disabled when needed'),
                Text('• Follows Material Design guidelines'),
              ],
            ),
          ),

          // Add this new section for a Ripple Effect Button
          const SizedBox(height: 24),
          const Text(
            'Ripple Effect Button',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Custom ripple animation on tap',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Center(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                customBorder: const StadiumBorder(),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue[400]!, Colors.blue[700]!],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Tap for Ripple',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Expandable Action Button
          const SizedBox(height: 24),
          const Text(
            'Expandable Action Button',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Button that expands to show more options',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _isExpanded ? 200 : 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => setState(() => _isExpanded = !_isExpanded),
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: _isExpanded 
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.center,
                          children: [
                            Icon(
                              _isExpanded ? Icons.close : Icons.add,
                              color: Colors.white,
                            ),
                            if (_isExpanded)
                              const Text(
                                'Add New Item',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Rotating Button
          const SizedBox(height: 24),
          const Text(
            'Rotating Button',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Button with rotation animation',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: _rotationAngle),
              duration: const Duration(milliseconds: 500),
              builder: (context, double value, child) {
                return Transform.rotate(
                  angle: value,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      setState(() {
                        _rotationAngle += 3.14159 / 2; // 90 degrees
                      });
                    },
                    child: const Icon(Icons.refresh),
                  ),
                );
              },
            ),
          ),

          // Color Cycling Button
          const SizedBox(height: 24),
          const Text(
            'Color Cycling Button',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Button that cycles through colors',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Center(
            child: TweenAnimationBuilder(
              tween: ColorTween(
                begin: _colorList[(_colorIndex - 1) % _colorList.length],
                end: _colorList[_colorIndex % _colorList.length],
              ),
              duration: const Duration(milliseconds: 500),
              builder: (context, Color? color, child) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _colorIndex++;
                    });
                  },
                  child: const Text('Cycle Color'),
                );
              },
            ),
          ),

          // Success/Error Game Button
          const SizedBox(height: 24),
          const Text(
            'Button Tapping Game',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Tap 5 times within 3 seconds to win!',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                Text(
                  'Taps: $_clickCount / $_targetCount',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Time: ${_timeRemaining.toStringAsFixed(1)}s',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isLoading 
                        ? Colors.grey 
                        : _buttonColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  onPressed: _isLoading
                      ? null
                      : () {
                          if (_clickCount == 0) {
                            // Start the timer on first click
                            _startTimer();
                          }
                          
                          setState(() {
                            _clickCount++;
                            
                            if (_clickCount >= _targetCount) {
                              _isLoading = true;
                              _timer?.cancel();
                              
                              // Check if completed within time limit
                              if (_timeRemaining > 0) {
                                _buttonColor = Colors.green;
                                _showResult('Success! You won! 🎉');
                              } else {
                                _buttonColor = Colors.red;
                                _showResult('Too slow! Try again! ⏰');
                              }
                              
                              // Reset after delay
                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  _isLoading = false;
                                  _buttonColor = Colors.blue;
                                  _clickCount = 0;
                                  _timeRemaining = 3.0;
                                });
                              });
                            }
                          });
                        },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _buttonColor == Colors.blue
                                    ? 'Tap Me Fast!'
                                    : _buttonColor == Colors.green
                                        ? 'Success!'
                                        : 'Failed!',
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                _buttonColor == Colors.blue
                                    ? Icons.touch_app
                                    : _buttonColor == Colors.green
                                        ? Icons.check_circle
                                        : Icons.error,
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStateButton(String label, {
    bool onHover = false,
    bool onPress = false,
    bool isDisabled = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StatefulBuilder(
          builder: (context, setState) {
            bool isHovered = false;
            bool isPressed = false;

            return MouseRegion(
              onEnter: onHover ? (_) => setState(() => isHovered = true) : null,
              onExit: onHover ? (_) => setState(() => isHovered = false) : null,
              child: GestureDetector(
                onTapDown: onPress ? (_) => setState(() => isPressed = true) : null,
                onTapUp: onPress ? (_) => setState(() => isPressed = false) : null,
                onTapCancel: onPress ? () => setState(() => isPressed = false) : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.identity()
                    ..scale(isHovered ? 1.1 : 1.0)
                    ..scale(isPressed ? 0.95 : 1.0),
                  child: ElevatedButton(
                    onPressed: isDisabled ? null : () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isHovered ? Colors.blue[700] : null,
                    ),
                    child: Text(label),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        Text(
          isDisabled ? 'Disabled State' :
          onHover ? 'Hover State' :
          onPress ? 'Pressed State' : '',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _timeRemaining -= 0.1;
        if (_timeRemaining <= 0) {
          _timeRemaining = 0;
          timer.cancel();
          if (_clickCount > 0 && _clickCount < _targetCount) {
            _isLoading = true;
            _buttonColor = Colors.red;
            _showResult('Time\'s up! Try again! ⏰');
            
            // Reset after delay
            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                _isLoading = false;
                _buttonColor = Colors.blue;
                _clickCount = 0;
                _timeRemaining = 3.0;
              });
            });
          }
        }
      });
    });
  }

  void _showResult(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: _buttonColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }
} 