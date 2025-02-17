import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowColumnScreen extends StatefulWidget {
  const RowColumnScreen({super.key});

  @override
  State<RowColumnScreen> createState() => _RowColumnScreenState();
}

class _RowColumnScreenState extends State<RowColumnScreen> {
  MainAxisAlignment _rowMainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _rowCrossAxisAlignment = CrossAxisAlignment.center;
  MainAxisAlignment _columnMainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _columnCrossAxisAlignment = CrossAxisAlignment.center;

  List<CrossAxisAlignment> get _availableCrossAxisAlignments => [
    CrossAxisAlignment.start,
    CrossAxisAlignment.center,
    CrossAxisAlignment.end,
    CrossAxisAlignment.stretch,
  ];

  Widget _buildCodePreview({required String title, required String code}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Row(
          children: [
            const Icon(Icons.code, size: 20),
            const SizedBox(width: 8),
            Text(
              'View Code',
              style: TextStyle(
                color: Colors.blue[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row & Column'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children: [
          // Interactive Row Example
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Interactive Row',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Experiment with different alignments',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                
                // MainAxisAlignment Controls
                Text(
                  'MainAxisAlignment (Horizontal)',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: MainAxisAlignment.values.map((alignment) {
                    return ChoiceChip(
                      label: Text(alignment.name),
                      selected: _rowMainAxisAlignment == alignment,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() => _rowMainAxisAlignment = alignment);
                        }
                      },
                    );
                  }).toList(),
                ),
                
                // CrossAxisAlignment Controls
                const SizedBox(height: 8),
                Text(
                  'CrossAxisAlignment (Vertical)',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: _availableCrossAxisAlignments.map((alignment) {
                    return ChoiceChip(
                      label: Text(alignment.name),
                      selected: _rowCrossAxisAlignment == alignment,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() => _rowCrossAxisAlignment = alignment);
                        }
                      },
                    );
                  }).toList(),
                ),
                
                // Row Example
                const SizedBox(height: 16),
                Container(
                  height: 120,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    mainAxisAlignment: _rowMainAxisAlignment,
                    crossAxisAlignment: _rowCrossAxisAlignment,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.green[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),

                _buildCodePreview(
                  title: 'Row Example',
                  code: '''
Row(
  mainAxisAlignment: $_rowMainAxisAlignment,
  crossAxisAlignment: $_rowCrossAxisAlignment,
  children: [
    Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.red[300],
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    Container(
      width: 40,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ],
)''',
                ),

                // Interactive Column Example
                const SizedBox(height: 32),
                const Text(
                  'Interactive Column',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Experiment with different alignments',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                
                // MainAxisAlignment Controls for Column
                Text(
                  'MainAxisAlignment (Vertical)',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: MainAxisAlignment.values.map((alignment) {
                    return ChoiceChip(
                      label: Text(alignment.name),
                      selected: _columnMainAxisAlignment == alignment,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() => _columnMainAxisAlignment = alignment);
                        }
                      },
                    );
                  }).toList(),
                ),
                
                // CrossAxisAlignment Controls for Column
                const SizedBox(height: 8),
                Text(
                  'CrossAxisAlignment (Horizontal)',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: _availableCrossAxisAlignments.map((alignment) {
                    return ChoiceChip(
                      label: Text(alignment.name),
                      selected: _columnCrossAxisAlignment == alignment,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() => _columnCrossAxisAlignment = alignment);
                        }
                      },
                    );
                  }).toList(),
                ),
                
                // Column Example
                const SizedBox(height: 16),
                Container(
                  height: 300,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    mainAxisAlignment: _columnMainAxisAlignment,
                    crossAxisAlignment: _columnCrossAxisAlignment,
                    children: [
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.orange[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.purple[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.teal[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),

                _buildCodePreview(
                  title: 'Column Example',
                  code: '''
Column(
  mainAxisAlignment: $_columnMainAxisAlignment,
  crossAxisAlignment: $_columnCrossAxisAlignment,
  children: [
    Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    Container(
      width: 150,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.purple[300],
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.teal[300],
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ],
)''',
                ),

                // Real-world Examples
                const SizedBox(height: 32),
                const Text(
                  'Real-world Examples',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Card Layout Example
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Card Layout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'John Doe',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Software Developer',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                _buildCodePreview(
                  title: 'Card Layout Example',
                  code: '''
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card Layout',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Software Developer',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ),
  ),
)''',
                ),

                // List Item Example
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'List Item',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.image),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Product Title',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Product description goes here',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Text(
                                        '\$99.99',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      const Spacer(),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text('Add to Cart'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                _buildCodePreview(
                  title: 'List Item Example',
                  code: '''
Row(
  children: [
    Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.image),
    ),
    SizedBox(width: 16),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Title',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Product description goes here',
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                '\$99.99',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
)''',
                ),

                // Form Layout Example
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Form Layout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('First Name'),
                                  const SizedBox(height: 8),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Last Name'),
                                  const SizedBox(height: 8),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                _buildCodePreview(
                  title: 'Form Layout Example',
                  code: '''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Form Layout',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(height: 16),
    Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('First Name'),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Last Name'),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    SizedBox(height: 16),
    Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Submit'),
          ),
        ),
      ],
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
} 