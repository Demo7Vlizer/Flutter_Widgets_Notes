import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StackScreen extends StatefulWidget {
  const StackScreen({super.key});

  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isAnimating = false;

  // Add these variables for positioned controls
  double _left = 0;
  double _top = 0;
  double _right = 0;
  double _bottom = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children: [
          // Basic Stack Example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Interactive Stack',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Tap boxes to move them around!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 200,
                  color: Colors.grey[100],
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        left: _isAnimating ? 100 : 0,
                        top: _isAnimating ? 100 : 0,
                        child: GestureDetector(
                          onTap: () =>
                              setState(() => _isAnimating = !_isAnimating),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(child: Text('Tap me!')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildCodePreview(
                  title: 'Interactive Stack',
                  code: '''
Stack(
  children: [
    AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      left: _isAnimating ? 100 : 0,
      top: _isAnimating ? 100 : 0,
      child: GestureDetector(
        onTap: () => setState(() => _isAnimating = !_isAnimating),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text('Tap me!')),
        ),
      ),
    ),
  ],
)''',
                ),
                const SizedBox(height: 32),
                const Text(
                  'Animated Stack',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Watch the continuous animation',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 200,
                  color: Colors.grey[100],
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Stack(
                        children: [
                          Positioned(
                            left: 150 * _controller.value,
                            top: 50 * _controller.value,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.purple[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 150 * _controller.value,
                            bottom: 50 * _controller.value,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.orange[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                _buildCodePreview(
                  title: 'Animated Stack',
                  code: '''
AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    return Stack(
      children: [
        Positioned(
          left: 150 * _controller.value,
          top: 50 * _controller.value,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Positioned(
          right: 150 * _controller.value,
          bottom: 50 * _controller.value,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  },
)''',
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_controller.isAnimating) {
                        _controller.stop();
                      } else {
                        _controller.forward();
                      }
                    },
                    child: Text(_controller.isAnimating
                        ? 'Stop Animation'
                        : 'Start Animation'),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Draggable Stack Elements',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Drag the boxes around!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 200,
                  color: Colors.grey[100],
                  child: Stack(
                    children: [
                      for (var i = 0; i < 3; i++)
                        Draggable(
                          feedback: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.primaries[i][100]!.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          childWhenDragging: Container(),
                          child: Container(
                            width: 80,
                            height: 80,
                            margin: EdgeInsets.all(i * 20.0),
                            decoration: BoxDecoration(
                              color: Colors.primaries[i][100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(child: Text('Drag me!')),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildCodePreview(
                  title: 'Draggable Stack',
                  code: '''
Stack(
  children: [
    for (var i = 0; i < 3; i++)
      Draggable(
        feedback: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.primaries[i][100]!.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        childWhenDragging: Container(),
        child: Container(
          width: 80,
          height: 80,
          margin: EdgeInsets.all(i * 20.0),
          decoration: BoxDecoration(
            color: Colors.primaries[i][100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text('Drag me!')),
        ),
      ),
  ],
)''',
                ),
              ],
            ),
          ),

          // Add this new section after the draggable stack example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Positioned Controls',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Adjust sliders to control position',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 250,
                  color: Colors.grey[100],
                  child: Stack(
                    children: [
                      Positioned(
                        left: _left,
                        top: _top,
                        right: _right,
                        bottom: _bottom,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text('Positioned Box'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 50, child: Text('Left:')),
                    Expanded(
                      child: Slider(
                        value: _left,
                        max: 300,
                        onChanged: (value) => setState(() => _left = value),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text('${_left.toInt()}'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 50, child: Text('Top:')),
                    Expanded(
                      child: Slider(
                        value: _top,
                        max: 200,
                        onChanged: (value) => setState(() => _top = value),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text('${_top.toInt()}'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 50, child: Text('Right:')),
                    Expanded(
                      child: Slider(
                        value: _right,
                        max: 300,
                        onChanged: (value) => setState(() => _right = value),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text('${_right.toInt()}'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 50, child: Text('Bottom:')),
                    Expanded(
                      child: Slider(
                        value: _bottom,
                        max: 200,
                        onChanged: (value) => setState(() => _bottom = value),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text('${_bottom.toInt()}'),
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      _left = 0;
                      _top = 0;
                      _right = 0;
                      _bottom = 0;
                    }),
                    child: const Text('Reset Position'),
                  ),
                ),
              ],
            ),
          ),

          // Add this new example section
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Stack vs Positioned: Understanding the Difference',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                // Basic Stack Example
                const Text(
                  '1. Basic Stack (Z-index layering)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Elements are simply layered on top of each other',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 150,
                  color: Colors.grey[100],
                  child: Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue.withOpacity(0.5),
                        child: const Center(child: Text('Bottom')),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsets.all(20),
                        color: Colors.red.withOpacity(0.5),
                        child: const Center(child: Text('Middle')),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.all(40),
                        color: Colors.green.withOpacity(0.5),
                        child: const Center(child: Text('Top')),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Positioned Example
                const Text(
                  '2. Positioned Stack (Precise positioning)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Elements can be positioned precisely within the stack',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 150,
                  color: Colors.grey[100],
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.purple.withOpacity(0.5),
                          child: const Center(child: Text('Top-Left')),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.orange.withOpacity(0.5),
                          child: const Center(child: Text('Bottom-Right')),
                        ),
                      ),
                      const Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Text('Center\n(Stretched)'),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Real-world Example
                const Text(
                  '3. Real-world Example: Social Media Post',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Combining Stack and Positioned for a practical layout',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Background Image
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(child: Text('Post Image')),
                      ),
                      // Overlay Gradient
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      // Profile Picture
                      Positioned(
                        left: 16,
                        top: 16,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(Icons.person, color: Colors.grey[800]),
                        ),
                      ),
                      // Username
                      const Positioned(
                        left: 66,
                        top: 24,
                        child: Text(
                          '@username',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Like Button
                      Positioned(
                        right: 16,
                        bottom: 16,
                        child: Row(
                          children: const [
                            Icon(Icons.favorite_border, color: Colors.white),
                            SizedBox(width: 4),
                            Text(
                              '1.2k',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      // Caption
                      const Positioned(
                        left: 16,
                        right: 16,
                        bottom: 16,
                        child: Text(
                          'This is a caption for the post...',
                          style: TextStyle(color: Colors.white),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Add this new section after the social media post example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '4. Notification Badge Example',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Common UI pattern using Stack and Positioned',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),

                // Shopping Cart with Badge
                Container(
                  height: 100,
                  color: Colors.grey[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Shopping Cart Icon with Badge
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.shopping_cart,
                              size: 30,
                              color: Colors.blue,
                            ),
                          ),
                          Positioned(
                            right: -5,
                            top: -5,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: const Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Message Icon with Badge
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.message,
                              size: 30,
                              color: Colors.green,
                            ),
                          ),
                          Positioned(
                            right: -3,
                            top: -3,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Profile Icon with Status
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.purple,
                            ),
                          ),
                          Positioned(
                            right: -2,
                            bottom: -2,
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  'Common Use Cases:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('• Shopping cart item count'),
                      Text('• Unread message indicators'),
                      Text('• Online/Offline status badges'),
                      Text('• Notification counters'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildCodePreview(
                  title: 'Notification Badge Example',
                  code: '''
Stack(
  clipBehavior: Clip.none,
  children: [
    Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Icon(Icons.shopping_cart),
    ),
    Positioned(
      right: -5,
      top: -5,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text('3'),
      ),
    ),
  ],
)''',
                ),
              ],
            ),
          ),

          // Add this new section after the notification badge example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '5. Custom Floating Action Menu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Expandable floating action button using Stack',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),

                // Custom FAB Menu
                Container(
                  height: 200,
                  color: Colors.grey[100],
                  child: Stack(
                    children: [
                      // Content behind the FAB
                      const Center(
                        child: Text('Main Content Area'),
                      ),

                      // FAB Menu Items
                      Positioned(
                        right: 16,
                        bottom: 80,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: _isAnimating ? 1.0 : 0.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _buildFabMenuItem(
                                icon: Icons.photo_camera,
                                label: 'Camera',
                                color: Colors.green,
                              ),
                              const SizedBox(height: 8),
                              _buildFabMenuItem(
                                icon: Icons.photo,
                                label: 'Gallery',
                                color: Colors.orange,
                              ),
                              const SizedBox(height: 8),
                              _buildFabMenuItem(
                                icon: Icons.file_upload,
                                label: 'Upload',
                                color: Colors.purple,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Main FAB
                      Positioned(
                        right: 16,
                        bottom: 16,
                        child: FloatingActionButton(
                          onPressed: () =>
                              setState(() => _isAnimating = !_isAnimating),
                          backgroundColor: Colors.blue,
                          child: AnimatedRotation(
                            duration: const Duration(milliseconds: 200),
                            turns: _isAnimating ? 0.125 : 0,
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  'Features demonstrated:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('• Animated menu expansion'),
                      Text('• Layered UI elements'),
                      Text('• Precise positioning'),
                      Text('• Interactive elements'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildCodePreview(
                  title: 'Custom Floating Action Menu',
                  code: '''
Stack(
  children: [
    Positioned(
      right: 16,
      bottom: 80,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: _isAnimating ? 1.0 : 0.0,
        child: Column(
          children: [
            _buildFabMenuItem(
              icon: Icons.photo_camera,
              label: 'Camera',
              color: Colors.green,
            ),
            // ... other menu items
          ],
        ),
      ),
    ),
    Positioned(
      right: 16,
      bottom: 16,
      child: FloatingActionButton(
        onPressed: () => setState(() => 
          _isAnimating = !_isAnimating
        ),
        child: AnimatedRotation(
          turns: _isAnimating ? 0.125 : 0,
          child: Icon(Icons.add),
        ),
      ),
    ),
  ],
)''',
                ),
              ],
            ),
          ),

          // Add this new section after the Story Viewer UI example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '7. Video Player Overlay',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Custom video player controls using Stack',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),

                // Video Player UI
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Video Content Placeholder
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          image: const DecorationImage(
                            image:
                                NetworkImage('https://picsum.photos/800/400'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Play/Pause Button Overlay
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            iconSize: 32,
                            icon: Icon(
                              _isAnimating ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: () =>
                                setState(() => _isAnimating = !_isAnimating),
                          ),
                        ),
                      ),

                      // Bottom Controls
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Progress Bar
                              SliderTheme(
                                data: SliderThemeData(
                                  thumbColor: Colors.white,
                                  activeTrackColor: Colors.white,
                                  inactiveTrackColor:
                                      Colors.white.withOpacity(0.3),
                                  overlayColor: Colors.white.withOpacity(0.1),
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 6,
                                  ),
                                  trackHeight: 2,
                                ),
                                child: Slider(
                                  value: 0.7,
                                  onChanged: (value) {},
                                ),
                              ),

                              // Bottom Row Controls
                              Row(
                                children: [
                                  const Text(
                                    '14:22 / 20:45',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(Icons.replay_10,
                                        color: Colors.white),
                                    iconSize: 20,
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.forward_10,
                                        color: Colors.white),
                                    iconSize: 20,
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.fullscreen,
                                        color: Colors.white),
                                    iconSize: 20,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Top Controls
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              const Text(
                                'Video Title',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.settings,
                                    color: Colors.white),
                                iconSize: 20,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  'Features demonstrated:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('• Overlay controls with gradients'),
                      Text('• Interactive video progress bar'),
                      Text('• Custom player controls'),
                      Text('• Multiple positioned elements'),
                      Text('• Responsive layout'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildCodePreview(
                  title: 'Video Player Overlay',
                  code: '''
Stack(
  fit: StackFit.expand,
  children: [
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('video_url'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    Center(
      child: IconButton(
        icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
        onPressed: () {},
      ),
    ),
    Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black54],
          ),
        ),
        child: Column(
          children: [
            Slider(value: 0.7, onChanged: (_) {}),
            Row(
              children: [
                Text('14:22 / 20:45'),
                Spacer(),
                IconButton(icon: Icon(Icons.fullscreen)),
              ],
            ),
          ],
        ),
      ),
    ),
  ],
)''',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFabMenuItem({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 8),
        FloatingActionButton.small(
          onPressed: () {},
          backgroundColor: color,
          child: Icon(icon),
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
        'View Code',
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
