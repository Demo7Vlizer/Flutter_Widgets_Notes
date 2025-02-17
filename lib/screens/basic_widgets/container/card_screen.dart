import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  double _elevation = 1;
  bool _isHovered = false;
  bool _isExpanded = false;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Definition Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What is Card?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Card is a Material Design widget that serves as a container for related information. '
                'It\'s commonly used to group content and actions about a single subject.',
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
                    Text('• Product cards in e-commerce'),
                    Text('• Profile cards'),
                    Text('• News article previews'),
                    Text('• Settings sections'),
                    Text('• Dashboard widgets'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Product Card Example
          const Text(
            'Product Card',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Common e-commerce card layout',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Image.network(
                  'https://picsum.photos/400/200',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Premium Headphones',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              _isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: _isFavorite ? Colors.red : null,
                            ),
                            onPressed: () {
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
                            },
                          ),
                        ],
                      ),
                      const Text(
                        '\$299.99',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'High-quality wireless headphones with noise cancellation',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Add to Cart'),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('Learn More'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Profile Card Example
          const Text(
            'Profile Card',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'User profile information layout',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Senior Developer',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Icon(Icons.location_on,
                                size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text('New York, USA'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.message),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Weather Card Example
          const Text(
            'Weather Card',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Weather information layout',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'New York',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Monday, 10:30 AM',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                      const Icon(Icons.cloud, size: 48, color: Colors.blue),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: const [
                          Text('Temperature'),
                          SizedBox(height: 4),
                          Text(
                            '72°F',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text('Humidity'),
                          SizedBox(height: 4),
                          Text(
                            '65%',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text('Wind'),
                          SizedBox(height: 4),
                          Text(
                            '5 mph',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Interactive Elevation Example
          const Text(
            'Interactive Elevation',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Adjust the slider to see how elevation affects the card shadow',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: _elevation,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('Elevation Demo'),
                  const SizedBox(height: 8),
                  Text('Current elevation: ${_elevation.toStringAsFixed(1)}'),
                  Slider(
                    value: _elevation,
                    min: 0,
                    max: 24,
                    divisions: 24,
                    label: _elevation.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _elevation = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Hover Effect Example
          const Text(
            'Hover Effect Card',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Tap and hold to see the hover effect',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTapDown: (_) => setState(() => _isHovered = true),
            onTapUp: (_) => setState(() => _isHovered = false),
            onTapCancel: () => setState(() => _isHovered = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Card(
                elevation: _isHovered ? 8 : 1,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.touch_app,
                        color: _isHovered ? Colors.blue : Colors.grey,
                        size: 32,
                      ),
                      const SizedBox(width: 16),
                      const Text('Touch and hold me'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Expandable Card Example
          const Text(
            'Expandable Card',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Tap to expand/collapse',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: InkWell(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                    ),
                    title: const Text('Expandable Content'),
                    subtitle: const Text('Tap to see more'),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: _isExpanded ? 100 : 0,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          'This is the expanded content that appears when you tap the card. '
                          'It smoothly animates in and out.',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Basic Card
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Basic Card',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Simple card with text',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'This is a basic card',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
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
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text(
      'This is a basic card',
      style: Theme.of(context).textTheme.bodyLarge,
    ),
  ),
),'''),
              ),
            ],
          ),
          const Divider(height: 32),
          // Elevated Card
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Elevated Card',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Card with custom elevation',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Icon(Icons.cloud, size: 50, color: Colors.blue[300]),
                      const SizedBox(height: 8),
                      const Text('Elevated Card'),
                    ],
                  ),
                ),
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
Card(
  elevation: 8,
  child: Container(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Icon(Icons.cloud, size: 50, color: Colors.blue[300]),
        SizedBox(height: 8),
        Text('Elevated Card'),
      ],
    ),
  ),
),'''),
              ),
            ],
          ),
          const Divider(height: 32),
          // Shaped Card
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shaped Card',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Card with custom shape',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey[300]!),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.info, color: Colors.blue[300]),
                      const SizedBox(width: 8),
                      const Text('Card with custom border'),
                    ],
                  ),
                ),
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
Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
    side: BorderSide(color: Colors.grey[300]!),
  ),
  child: Container(
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        Icon(Icons.info, color: Colors.blue[300]),
        SizedBox(width: 8),
        Text('Card with custom border'),
      ],
    ),
  ),
),'''),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
