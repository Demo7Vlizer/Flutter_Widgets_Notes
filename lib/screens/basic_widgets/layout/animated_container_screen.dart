// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  // State variables for interactive examples
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  double _borderRadius = 8;
  double _rotation = 0;
  bool _isAnimating = false;
  
  // Animation duration
  Duration _duration = const Duration(milliseconds: 500);
  Curve _curve = Curves.easeInOut;
  
  // Random generator for animations
  final _random = math.Random();

  // Add more state variables
  bool _isHovered = false;
  bool _isMenuOpen = false;
  bool _isDarkMode = false;
  double _progress = 0.0;
  bool _isLiked = false;
  bool _isPlaying = false;
  bool _isExpanded = false;
  int _selectedTab = 0;
  double _sliderValue = 0.5;
  bool _isMuted = false;

  void _randomizeContainer() {
    setState(() {
      _width = _random.nextDouble() * 200 + 50;
      _height = _random.nextDouble() * 200 + 50;
      _color = Color.fromRGBO(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        1,
      );
      _borderRadius = _random.nextDouble() * 50;
      _rotation = _random.nextDouble() * 2 * math.pi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
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
          'What is AnimatedContainer?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'AnimatedContainer is a widget that gradually changes its values over a period of time. '
          'The container will automatically animate between the old and new values of properties when they change.',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 16),
        _buildCodePreview(
          title: 'Basic AnimatedContainer Structure',
          code: '''
AnimatedContainer(
  duration: Duration(milliseconds: 500),
  curve: Curves.easeInOut,
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  child: YourWidget(),
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
        
        // Duration Control
        Text('Animation Duration: ${_duration.inMilliseconds}ms'),
        Slider(
          value: _duration.inMilliseconds.toDouble(),
          min: 100,
          max: 2000,
          divisions: 19,
          label: '${_duration.inMilliseconds}ms',
          onChanged: (value) => setState(() {
            _duration = Duration(milliseconds: value.round());
          }),
        ),
        
        // Curve Selection
        Row(
          children: [
            const Text('Animation Curve: '),
            DropdownButton<Curve>(
              value: _curve,
              items: [
                Curves.linear,
                Curves.easeIn,
                Curves.easeOut,
                Curves.easeInOut,
                Curves.bounceIn,
                Curves.bounceOut,
                Curves.elasticIn,
                Curves.elasticOut,
              ].map((curve) {
                return DropdownMenuItem(
                  value: curve,
                  child: Text(curve.toString().split('.').last),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) setState(() => _curve = value);
              },
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Interactive Demo
        Center(
          child: Column(
            children: [
              const Text(
                'Tap the container or use the button below',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _randomizeContainer,
                child: AnimatedContainer(
                  duration: _duration,
                  curve: _curve,
                  width: _width,
                  height: _height,
                  transform: Matrix4.rotationZ(_rotation),
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(_borderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.touch_app,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _randomizeContainer,
                child: const Text('Randomize Container'),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        _buildCodePreview(
          title: 'Interactive Demo Code',
          code: '''
AnimatedContainer(
  duration: Duration(milliseconds: ${_duration.inMilliseconds}),
  curve: $_curve,
  width: $_width,
  height: $_height,
  transform: Matrix4.rotationZ($_rotation),
  decoration: BoxDecoration(
    color: $_color,
    borderRadius: BorderRadius.circular($_borderRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Center(
    child: Icon(
      Icons.touch_app,
      color: Colors.white,
      size: 32,
    ),
  ),
)''',
        ),
      ],
    );
  }

  Widget _buildRealWorldExamples() {
    return SingleChildScrollView(
      child: Column(
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
          
          // Loading Button Example
          _buildLoadingButton(),
          const SizedBox(height: 24),
          
          // Expandable Card Example
          _buildExpandableCard(),
          const SizedBox(height: 24),
          
          // Success/Error State Example
          _buildStateIndicator(),
          const SizedBox(height: 24),

          // New Examples
          _buildHoverCard(),
          const SizedBox(height: 24),

          _buildProgressIndicator(),
          const SizedBox(height: 24),

          _buildThemeToggle(),
          const SizedBox(height: 24),

          _buildFloatingMenu(),
          const SizedBox(height: 24),

          _buildNotificationBadge(),
          const SizedBox(height: 24),

          _buildLikeButton(),
          const SizedBox(height: 24),
          
          _buildMusicPlayer(),
          const SizedBox(height: 24),
          
          _buildTabSelector(),
          const SizedBox(height: 24),
          
          _buildVolumeControl(),
          const SizedBox(height: 24),
          
          _buildImageCard(),
        ],
      ),
    );
  }

  Widget _buildLoadingButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Loading Button',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: GestureDetector(
            onTap: () => setState(() => _isAnimating = !_isAnimating),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _isAnimating ? 50 : 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: _isAnimating
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Loading Button Code',
          code: '''
AnimatedContainer(
  duration: Duration(milliseconds: 300),
  width: isLoading ? 50 : 200,
  height: 50,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(25),
  ),
  child: Center(
    child: isLoading
        ? CircularProgressIndicator(color: Colors.white)
        : Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
  ),
)''',
        ),
      ],
    );
  }

  Widget _buildExpandableCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Expandable Card',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Column(
            children: [
              ListTile(
                title: const Text('Expandable Section'),
                trailing: Icon(
                  _isAnimating ? Icons.expand_less : Icons.expand_more,
                ),
                onTap: () => setState(() => _isAnimating = !_isAnimating),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: _isAnimating ? 100 : 0,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: const [
                      Text(
                        'This is the expandable content that shows or hides '
                        'when the user taps the header.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Expandable Card Code',
          code: '''
Card(
  child: Column(
    children: [
      ListTile(
        title: Text('Expandable Section'),
        trailing: Icon(
          isExpanded ? Icons.expand_less : Icons.expand_more,
        ),
        onTap: () => setState(() => isExpanded = !isExpanded),
      ),
      AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isExpanded ? 100 : 0,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Text('This is the expandable content...'),
            ],
          ),
        ),
      ),
    ],
  ),
)''',
        ),
      ],
    );
  }

  Widget _buildStateIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'State Indicator',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: GestureDetector(
            onTap: () => setState(() => _isAnimating = !_isAnimating),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: _isAnimating ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(_isAnimating ? 100 : 16),
              ),
              child: Center(
                child: Icon(
                  _isAnimating ? Icons.check : Icons.close,
                  color: Colors.white,
                  size: 64,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'State Indicator Code',
          code: '''
AnimatedContainer(
  duration: Duration(milliseconds: 300),
  width: 200,
  height: 200,
  decoration: BoxDecoration(
    color: isSuccess ? Colors.green : Colors.red,
    borderRadius: BorderRadius.circular(isSuccess ? 100 : 16),
  ),
  child: Center(
    child: Icon(
      isSuccess ? Icons.check : Icons.close,
      color: Colors.white,
      size: 64,
    ),
  ),
)''',
        ),
      ],
    );
  }

  Widget _buildHoverCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hover Effect Card',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: InkWell(
            onHover: (value) => setState(() => _isHovered = value),
            onTap: () {},
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 300,
              height: 100,
              padding: const EdgeInsets.all(16),
              transform: Matrix4.identity()
                ..translate(0.0, _isHovered ? -8.0 : 0.0)
                ..scale(_isHovered ? 1.05 : 1.0),
              decoration: BoxDecoration(
                color: _isHovered ? Colors.blue.shade50 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(_isHovered ? 0.15 : 0.1),
                    blurRadius: _isHovered ? 20 : 10,
                    offset: Offset(0, _isHovered ? 10 : 5),
                    spreadRadius: _isHovered ? 1 : 0,
                  ),
                ],
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.touch_app,
                      color: _isHovered ? Colors.blue : Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Hover or tap me!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _isHovered ? Colors.blue : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Hover Effect Code',
          code: '''
InkWell(
  onHover: (value) => setState(() => isHovered = value),
  onTap: () {},
  child: AnimatedContainer(
    duration: Duration(milliseconds: 200),
    transform: Matrix4.identity()
      ..translate(0.0, isHovered ? -8.0 : 0.0)
      ..scale(isHovered ? 1.05 : 1.0),
    decoration: BoxDecoration(
      color: isHovered ? Colors.blue.shade50 : Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(isHovered ? 0.15 : 0.1),
          blurRadius: isHovered ? 20 : 10,
          offset: Offset(0, isHovered ? 10 : 5),
          spreadRadius: isHovered ? 1 : 0,
        ),
      ],
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.touch_app,
            color: isHovered ? Colors.blue : Colors.grey,
          ),
          SizedBox(width: 8),
          Text(
            'Hover or tap me!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isHovered ? Colors.blue : Colors.black87,
            ),
          ),
        ],
      ),
    ),
  ),
)''',
        ),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Custom Progress Indicator',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      shape: BoxShape.circle,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 200 * _progress,
                    height: 200 * _progress,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${(_progress * 100).toInt()}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Slider(
                value: _progress,
                onChanged: (value) => setState(() => _progress = value),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Progress Indicator Code',
          code: '''
Stack(
  alignment: Alignment.center,
  children: [
    AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        shape: BoxShape.circle,
      ),
    ),
    AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 200 * progress,
      height: 200 * progress,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '\${(progress * 100).toInt()}%',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ],
)''',
        ),
      ],
    );
  }

  Widget _buildThemeToggle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Theme Toggle',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: GestureDetector(
            onTap: () => setState(() => _isDarkMode = !_isDarkMode),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 300,
              height: 150,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isDarkMode ? Colors.grey[850] : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: _isDarkMode ? Colors.white : Colors.black,
                    size: 48,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _isDarkMode ? 'Dark Mode' : 'Light Mode',
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Theme Toggle Code',
          code: '''
AnimatedContainer(
  duration: Duration(milliseconds: 300),
  decoration: BoxDecoration(
    color: isDarkMode ? Colors.grey[850] : Colors.white,
    borderRadius: BorderRadius.circular(16),
  ),
  child: Column(
    children: [
      Icon(
        isDarkMode ? Icons.dark_mode : Icons.light_mode,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      Text(
        isDarkMode ? 'Dark Mode' : 'Light Mode',
        style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    ],
  ),
)''',
        ),
      ],
    );
  }

  Widget _buildFloatingMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Floating Action Menu',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Container(
            height: 300,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                // Menu Items
                ...List.generate(3, (index) {
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    bottom: _isMenuOpen ? 70.0 + (index * 60.0) : 0,
                    right: 0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _isMenuOpen ? 1.0 : 0.0,
                      child: FloatingActionButton(
                        mini: true,
                        onPressed: () {},
                        backgroundColor: Colors.blue[(index + 1) * 100],
                        child: Icon([
                          Icons.edit,
                          Icons.photo_camera,
                          Icons.bookmark,
                        ][index]),
                      ),
                    ),
                  );
                }),
                // Main FAB
                FloatingActionButton(
                  onPressed: () => setState(() => _isMenuOpen = !_isMenuOpen),
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: _isMenuOpen ? 0.125 : 0,
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Floating Menu Code',
          code: '''
Stack(
  alignment: Alignment.bottomRight,
  children: [
    ...List.generate(3, (index) {
      return AnimatedPositioned(
        duration: Duration(milliseconds: 200),
        bottom: isMenuOpen ? 70.0 + (index * 60.0) : 0,
        right: 0,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: isMenuOpen ? 1.0 : 0.0,
          child: FloatingActionButton(
            mini: true,
            onPressed: () {},
            child: Icon(icons[index]),
          ),
        ),
      );
    }),
    FloatingActionButton(
      onPressed: () => setState(() => 
        isMenuOpen = !isMenuOpen
      ),
      child: AnimatedRotation(
        turns: isMenuOpen ? 0.125 : 0,
        child: Icon(Icons.add),
      ),
    ),
  ],
)''',
        ),
      ],
    );
  }

  Widget _buildNotificationBadge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notification Badge',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.notifications, size: 30),
              ),
              Positioned(
                top: -5,
                right: -5,
                child: GestureDetector(
                  onTap: () => setState(() => _isAnimating = !_isAnimating),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.all(_isAnimating ? 8 : 6),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _isAnimating ? 14 : 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Notification Badge Code',
          code: '''
Stack(
  clipBehavior: Clip.none,
  children: [
    Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(Icons.notifications, size: 30),
    ),
    Positioned(
      top: -5,
      right: -5,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(isAnimated ? 8 : 6),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '3',
          style: TextStyle(
            color: Colors.white,
            fontSize: isAnimated ? 14 : 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ],
)''',
        ),
      ],
    );
  }

  Widget _buildLikeButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Like Button Animation',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: GestureDetector(
            onTap: () => setState(() => _isLiked = !_isLiked),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.all(_isLiked ? 8 : 12),
              decoration: BoxDecoration(
                color: _isLiked ? Colors.pink[50] : Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.pink : Colors.grey,
                size: _isLiked ? 32 : 24,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Like Button Code',
          code: '''
AnimatedContainer(
  duration: Duration(milliseconds: 200),
  padding: EdgeInsets.all(isLiked ? 8 : 12),
  decoration: BoxDecoration(
    color: isLiked ? Colors.pink[50] : Colors.grey[100],
    shape: BoxShape.circle,
  ),
  child: Icon(
    isLiked ? Icons.favorite : Icons.favorite_border,
    color: isLiked ? Colors.pink : Colors.grey,
    size: isLiked ? 32 : 24,
  ),
)''',
        ),
      ],
    );
  }

  Widget _buildMusicPlayer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Music Player Controls',
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
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () => setState(() => _isPlaying = !_isPlaying),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: _isPlaying ? 48 : 64,
                      height: _isPlaying ? 48 : 64,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(_isPlaying ? 24 : 32),
                      ),
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: _isPlaying ? 24 : 32,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: _isPlaying ? 0.7 : 0.3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Music Player Code',
          code: '''
AnimatedContainer(
  duration: Duration(milliseconds: 200),
  width: isPlaying ? 48 : 64,
  height: isPlaying ? 48 : 64,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(isPlaying ? 24 : 32),
  ),
  child: Icon(
    isPlaying ? Icons.pause : Icons.play_arrow,
    color: Colors.white,
    size: isPlaying ? 24 : 32,
  ),
)''',
        ),
      ],
    );
  }

  Widget _buildTabSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Animated Tab Selector',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: _selectedTab * (MediaQuery.of(context).size.width - 32) / 3,
                top: 0,
                bottom: 0,
                width: (MediaQuery.of(context).size.width - 32) / 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedTab = i),
                        child: Center(
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            style: TextStyle(
                              color: _selectedTab == i ? Colors.blue : Colors.grey,
                              fontWeight: _selectedTab == i
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            child: Text(['Home', 'Search', 'Profile'][i]),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Tab Selector Code',
          code: '''
Stack(
  children: [
    AnimatedPositioned(
      duration: Duration(milliseconds: 200),
      left: selectedTab * width / 3,
      width: width / 3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
            ),
          ],
        ),
      ),
    ),
    Row(
      children: [
        for (int i = 0; i < 3; i++)
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedTab = i),
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 200),
                style: TextStyle(
                  color: selectedTab == i ? Colors.blue : Colors.grey,
                  fontWeight: selectedTab == i
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
                child: Text(tabNames[i]),
              ),
            ),
          ),
      ],
    ),
  ],
)''',
        ),
      ],
    );
  }

  Widget _buildVolumeControl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Volume Control',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => setState(() => _isMuted = !_isMuted),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _isMuted ? Colors.red[50] : Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _isMuted ? Icons.volume_off : Icons.volume_up,
                      color: _isMuted ? Colors.red : Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 150,
                      height: 4,
                      decoration: BoxDecoration(
                        color: _isMuted ? Colors.grey[300] : Colors.blue[100],
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: _isMuted ? 0 : _sliderValue,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _isMuted ? Colors.grey : Colors.blue,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Slider(
                      value: _isMuted ? 0 : _sliderValue,
                      onChanged: (value) {
                        if (!_isMuted) {
                          setState(() => _sliderValue = value);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Volume Control Code',
          code: '''
Row(
  children: [
    AnimatedContainer(
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isMuted ? Colors.red[50] : Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        isMuted ? Icons.volume_off : Icons.volume_up,
        color: isMuted ? Colors.red : Colors.blue,
      ),
    ),
    AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 150,
      height: 4,
      decoration: BoxDecoration(
        color: isMuted ? Colors.grey[300] : Colors.blue[100],
        borderRadius: BorderRadius.circular(2),
      ),
      child: FractionallySizedBox(
        widthFactor: isMuted ? 0 : volume,
        child: Container(
          color: isMuted ? Colors.grey : Colors.blue,
        ),
      ),
    ),
  ],
)''',
        ),
      ],
    );
  }

  Widget _buildImageCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Expandable Image Card',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _isExpanded ? double.infinity : 200,
              height: _isExpanded ? 400 : 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(_isExpanded ? 0 : 16),
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/400'),
                  fit: BoxFit.cover,
                ),
              ),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _isExpanded ? 1 : 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Beautiful Landscape',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Tap to minimize',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildCodePreview(
          title: 'Expandable Image Card Code',
          code: '''
AnimatedContainer(
  duration: Duration(milliseconds: 300),
  width: isExpanded ? double.infinity : 200,
  height: isExpanded ? 400 : 200,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(isExpanded ? 0 : 16),
    image: DecorationImage(
      image: NetworkImage('image_url'),
      fit: BoxFit.cover,
    ),
  ),
  child: AnimatedOpacity(
    duration: Duration(milliseconds: 200),
    opacity: isExpanded ? 1 : 0,
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black.withOpacity(0.7), Colors.transparent],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Title', style: TextStyle(color: Colors.white)),
          Text('Subtitle', style: TextStyle(color: Colors.white70)),
        ],
      ),
    ),
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

  Widget _buildAnimatedWidget() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          duration: _duration,
          curve: _curve,
          width: _width.clamp(50, constraints.maxWidth),
          height: _height.clamp(50, constraints.maxHeight),
          constraints: BoxConstraints(
            minWidth: 50,
            maxWidth: constraints.maxWidth,
            minHeight: 50,
            maxHeight: constraints.maxHeight,
          ),
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          child: const Center(
            child: Icon(
              Icons.animation,
              color: Colors.white,
              size: 32,
            ),
          ),
        );
      },
    );
  }
} 