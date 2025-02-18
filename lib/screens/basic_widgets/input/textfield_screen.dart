import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> 
    with SingleTickerProviderStateMixin {
  bool _isPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _validationMessage = '';
  bool _isValid = true;
  bool _isLoading = false;
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  // For character counter animation
  int _maxLength = 50;
  String _characterCount = '0/50';
  Color _counterColor = Colors.grey;

  // For search animation
  bool _isSearching = false;
  final List<String> _searchResults = [
    'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry',
    'Fig', 'Grape', 'Honeydew', 'Ice Apple', 'Jackfruit'
  ];
  List<String> _filteredResults = [];

  // Add these new variables to the state class
  bool _isTyping = false;
  String _selectedEmoji = '';
  final List<String> _emojis = ['😀', '😍', '🎉', '👍', '🔥', '💡', '🌟', '💪'];
  double _rating = 0;
  Color _ratingColor = Colors.grey;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _shakeAnimation = Tween(begin: 0.0, end: 24.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_shakeController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _shakeController.reverse();
        }
      });

    _searchController.addListener(_onSearchChanged);
    _emailController.addListener(_validateEmail);
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredResults = _searchResults
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
  }

  void _validateEmail() {
    String email = _emailController.text;
    bool emailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(email);
    
    setState(() {
      _isValid = emailValid || email.isEmpty;
      if (!_isValid) {
        _validationMessage = 'Please enter a valid email';
        _shakeController.forward(from: 0.0);
      } else {
        _validationMessage = '';
      }
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _searchController.dispose();
    _emailController.dispose();
    _shakeController.dispose();
    _focusNode.dispose();
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
        title: const Text('TextField'),
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
            'What is TextField?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'TextField is a Material Design text input widget that lets users enter text, '
            'either with hardware keyboard or with an onscreen keyboard. It supports various '
            'features like validation, formatting, and custom styling.',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),

          // Basic TextField
          _buildSection(
            title: 'Basic TextField',
            subtitle: 'Simple text input field',
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            codeExample: '''
TextField(
  decoration: InputDecoration(
    labelText: 'Enter text',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
),''',
          ),

          // Animated Search TextField
          _buildSection(
            title: 'Animated Search Field',
            subtitle: 'Search with real-time filtering and animations',
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _isSearching ? double.infinity : 300,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search fruits...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _isSearching = false;
                                  _filteredResults.clear();
                                });
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onTap: () => setState(() => _isSearching = true),
                  ),
                ),
                if (_searchController.text.isNotEmpty)
                  Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredResults.isEmpty ? 1 : _filteredResults.length,
                      itemBuilder: (context, index) {
                        if (_filteredResults.isEmpty) {
                          return const ListTile(
                            leading: Icon(Icons.search_off, color: Colors.grey),
                            title: Text(
                              'No results found',
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        }
                        return ListTile(
                          leading: const Icon(Icons.search),
                          title: Text(_filteredResults[index]),
                          onTap: () {
                            _searchController.text = _filteredResults[index];
                            setState(() {
                              _isSearching = false;
                              _filteredResults.clear();
                            });
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
            codeExample: '''
AnimatedContainer(
  duration: Duration(milliseconds: 300),
  width: isSearching ? double.infinity : 300,
  child: TextField(
    controller: searchController,
    decoration: InputDecoration(
      hintText: 'Search...',
      prefixIcon: Icon(Icons.search),
      suffixIcon: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => searchController.clear(),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  ),
),''',
          ),

          // Email Validation TextField
          _buildSection(
            title: 'Email Validation',
            subtitle: 'TextField with real-time email validation',
            child: AnimatedBuilder(
              animation: _shakeAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_shakeAnimation.value, 0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      suffixIcon: _emailController.text.isNotEmpty
                          ? Icon(
                              _isValid ? Icons.check_circle : Icons.error,
                              color: _isValid ? Colors.green : Colors.red,
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorText: _validationMessage.isNotEmpty 
                          ? _validationMessage 
                          : null,
                    ),
                  ),
                );
              },
            ),
            codeExample: '''
TextField(
  controller: emailController,
  decoration: InputDecoration(
    labelText: 'Email',
    prefixIcon: Icon(Icons.email),
    suffixIcon: Icon(
      isValid ? Icons.check_circle : Icons.error,
      color: isValid ? Colors.green : Colors.red,
    ),
    errorText: validationMessage,
  ),
),''',
          ),

          // Password TextField
          _buildSection(
            title: 'Password TextField',
            subtitle: 'Secure text input with visibility toggle',
            child: TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible 
                        ? Icons.visibility 
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            codeExample: '''
TextField(
  controller: passwordController,
  obscureText: !isPasswordVisible,
  decoration: InputDecoration(
    labelText: 'Password',
    prefixIcon: Icon(Icons.lock),
    suffixIcon: IconButton(
      icon: Icon(
        isPasswordVisible 
            ? Icons.visibility 
            : Icons.visibility_off,
      ),
      onPressed: () => setState(() {
        isPasswordVisible = !isPasswordVisible;
      }),
    ),
  ),
),''',
          ),

          // Character Counter TextField
          _buildSection(
            title: 'Character Counter',
            subtitle: 'TextField with animated character counter',
            child: TextField(
              maxLength: _maxLength,
              maxLines: 3,
              onChanged: (String value) {
                setState(() {
                  _characterCount = '${value.length}/$_maxLength';
                  _counterColor = value.length > _maxLength * 0.8 
                      ? Colors.red 
                      : Colors.grey;
                });
              },
              decoration: InputDecoration(
                labelText: 'Message',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                counter: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    color: _counterColor,
                    fontWeight: _counterColor == Colors.red 
                        ? FontWeight.bold 
                        : FontWeight.normal,
                  ),
                  child: Text(_characterCount),
                ),
              ),
            ),
            codeExample: '''
TextField(
  maxLength: maxLength,
  maxLines: 3,
  onChanged: (value) {
    setState(() {
      characterCount = '\${value.length}/\$maxLength';
      counterColor = value.length > maxLength * 0.8 
          ? Colors.red 
          : Colors.grey;
    });
  },
  decoration: InputDecoration(
    labelText: 'Message',
    counter: AnimatedDefaultTextStyle(
      style: TextStyle(color: counterColor),
      child: Text(characterCount),
    ),
  ),
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
                  icon: Icons.search,
                  title: 'Search Fields',
                  description: 'For searching and filtering content',
                  example: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                _buildUseCase(
                  icon: Icons.person,
                  title: 'Form Fields',
                  description: 'For user input in forms',
                  example: TextField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                _buildUseCase(
                  icon: Icons.message,
                  title: 'Chat Input',
                  description: 'For messaging and comments',
                  example: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      suffixIcon: const Icon(Icons.send),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
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
                  'Always provide clear labels or hints for text fields',
                ),
                _buildBestPractice(
                  '2. Input Validation',
                  'Validate input in real-time and show clear error messages',
                ),
                _buildBestPractice(
                  '3. Visual Feedback',
                  'Provide visual feedback for user interactions',
                ),
                _buildBestPractice(
                  '4. Keyboard Type',
                  'Use appropriate keyboard types for different inputs',
                ),
              ],
            ),
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
                  '1. Controller Usage',
                  'Use TextEditingController for better control',
                  '''
final controller = TextEditingController();
TextField(
  controller: controller,
  onChanged: (value) {
    // Handle text changes
  },
),''',
                ),
                _buildTip(
                  '2. Focus Management',
                  'Manage focus for better user experience',
                  '''
final focusNode = FocusNode();
TextField(
  focusNode: focusNode,
  onSubmitted: (value) {
    focusNode.nextFocus();
  },
),''',
                ),
                _buildTip(
                  '3. Input Formatting',
                  'Use input formatters for specific formats',
                  '''
TextField(
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(10),
  ],
),''',
                ),
              ],
            ),
          ),

          // Real-World Examples Section
          _buildSection(
            title: 'Real-World Examples',
            subtitle: 'Common TextField implementations',
            child: Column(
              children: [
                _buildRealWorldExample(
                  'Login Form',
                  [
                    {'title': 'Username', 'icon': Icons.person},
                    {'title': 'Password', 'icon': Icons.lock},
                  ],
                ),
                const SizedBox(height: 16),
                _buildRealWorldExample(
                  'Profile Form',
                  [
                    {'title': 'Full Name', 'icon': Icons.person},
                    {'title': 'Email', 'icon': Icons.email},
                    {'title': 'Phone', 'icon': Icons.phone},
                  ],
                ),
              ],
            ),
            codeExample: '''
Column(
  children: [
    TextField(
      decoration: InputDecoration(
        labelText: 'Username',
        prefixIcon: Icon(Icons.person),
      ),
    ),
    TextField(
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
      ),
      obscureText: true,
    ),
  ],
),''',
          ),

          // Interactive Typing Effect
          _buildSection(
            title: 'Interactive Typing Effect',
            subtitle: 'TextField with typing animation and effects',
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _isTyping ? 120 : 60,
                  curve: Curves.easeInOut,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _isTyping = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Type something...',
                      floatingLabelStyle: TextStyle(
                        color: _isTyping ? Colors.blue : Colors.grey,
                        fontSize: _isTyping ? 24 : 16,
                        fontWeight: _isTyping ? FontWeight.bold : FontWeight.normal,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_isTyping ? 16 : 8),
                        borderSide: BorderSide(
                          color: _isTyping ? Colors.blue : Colors.grey,
                          width: _isTyping ? 2 : 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_isTyping ? 16 : 8),
                        borderSide: BorderSide(
                          color: _isTyping ? Colors.blue : Colors.grey,
                          width: _isTyping ? 2 : 1,
                        ),
                      ),
                    ),
                  ),
                ),
                if (_isTyping)
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Typing...',
                      style: TextStyle(
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
              ],
            ),
            codeExample: '''
AnimatedContainer(
  duration: Duration(milliseconds: 300),
  height: isTyping ? 120 : 60,
  child: TextField(
    onChanged: (value) {
      setState(() {
        isTyping = value.isNotEmpty;
      });
    },
    decoration: InputDecoration(
      labelText: 'Type something...',
      floatingLabelStyle: TextStyle(
        color: isTyping ? Colors.blue : Colors.grey,
        fontSize: isTyping ? 24 : 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(isTyping ? 16 : 8),
      ),
    ),
  ),
),''',
          ),

          // Interactive Chat Input
          _buildSection(
            title: 'Interactive Chat Input',
            subtitle: 'Animated chat input with emoji selector',
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey[300]!),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        setState(() {
                          _selectedEmoji = _emojis[
                            (_emojis.indexOf(_selectedEmoji) + 1) % _emojis.length
                          ];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _selectedEmoji.isEmpty ? '😊' : _selectedEmoji,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _isTyping = value.isNotEmpty;
                          });
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Type a message',
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _isTyping ? 0.0 : 1.0,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: _isTyping ? null : () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.attach_file,
                                color: Colors.grey[600],
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child: _isTyping
                            ? Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.blue[600],
                                      size: 20,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(width: 36),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            codeExample: '''
Container(
  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  decoration: BoxDecoration(
    color: Colors.grey[100],
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: Colors.grey[300]!),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      InkWell(
        onTap: () {
          setState(() {
            selectedEmoji = emojis[
              (emojis.indexOf(selectedEmoji) + 1) % emojis.length
            ];
          });
        },
        child: Text(selectedEmoji, style: TextStyle(fontSize: 20)),
      ),
      Expanded(
        child: TextField(
          onChanged: (value) {
            setState(() {
              isTyping = value.isNotEmpty;
            });
          },
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Type a message',
            border: InputBorder.none,
          ),
        ),
      ),
      AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: isTyping
            ? IconButton(
                icon: Icon(Icons.send, color: Colors.blue),
                onPressed: () {},
              )
            : IconButton(
                icon: Icon(Icons.attach_file, color: Colors.grey),
                onPressed: () {},
              ),
      ),
    ],
  ),
),''',
          ),

          // Interactive Form Validation
          _buildSection(
            title: 'Interactive Form Validation',
            subtitle: 'Real-time form validation with animations',
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    if (value.length < 6) {
                      setState(() {
                        _validationMessage = 'Password must be at least 6 characters';
                        _isValid = false;
                        _shakeController.forward(from: 0.0);
                      });
                    } else if (!value.contains(RegExp(r'[A-Z]'))) {
                      setState(() {
                        _validationMessage = 'Include at least one uppercase letter';
                        _isValid = false;
                        _shakeController.forward(from: 0.0);
                      });
                    } else if (!value.contains(RegExp(r'[0-9]'))) {
                      setState(() {
                        _validationMessage = 'Include at least one number';
                        _isValid = false;
                        _shakeController.forward(from: 0.0);
                      });
                    } else {
                      setState(() {
                        _validationMessage = '';
                        _isValid = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    helperText: 'Min 6 chars, 1 uppercase, 1 number',
                    errorText: _validationMessage.isNotEmpty ? _validationMessage : null,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _isValid
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.error, color: Colors.red),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 8,
                  decoration: BoxDecoration(
                    color: _isValid ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: _isValid ? MediaQuery.of(context).size.width : 100,
                ),
              ],
            ),
            codeExample: '''
TextField(
  onChanged: (value) {
    if (value.length < 6) {
      setState(() {
        validationMessage = 'Password must be at least 6 characters';
        isValid = false;
        shakeController.forward(from: 0.0);
      });
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      setState(() {
        validationMessage = 'Include at least one uppercase letter';
        isValid = false;
        shakeController.forward(from: 0.0);
      });
    } else {
      setState(() {
        validationMessage = '';
        isValid = true;
      });
    }
  },
  decoration: InputDecoration(
    labelText: 'Password',
    errorText: validationMessage.isNotEmpty ? validationMessage : null,
    suffixIcon: AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: isValid
          ? Icon(Icons.check_circle, color: Colors.green)
          : Icon(Icons.error, color: Colors.red),
    ),
  ),
),''',
          ),

          // Floating Label Animation
          _buildSection(
            title: 'Floating Label Animation',
            subtitle: 'Custom animated floating label',
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 80,
                  child: TextField(
                    focusNode: _focusNode,
                    onChanged: (value) => setState(() => _isTyping = value.isNotEmpty),
                    decoration: InputDecoration(
                      labelText: 'Animated Label',
                      floatingLabelStyle: TextStyle(
                        color: _focusNode.hasFocus ? Colors.purple : Colors.grey,
                        fontSize: _isTyping ? 24 : 16,
                        fontWeight: _isTyping ? FontWeight.bold : FontWeight.normal,
                        shadows: _focusNode.hasFocus
                            ? [
                                Shadow(
                                  color: Colors.purple.withOpacity(0.3),
                                  offset: const Offset(0, 3),
                                  blurRadius: 4,
                                ),
                              ]
                            : [],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: _focusNode.hasFocus ? Colors.purple : Colors.grey,
                          width: _focusNode.hasFocus ? 2 : 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: _isTyping ? Colors.purple : Colors.grey,
                          width: _isTyping ? 2 : 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            codeExample: '''
TextField(
  focusNode: focusNode,
  onChanged: (value) => setState(() => 
    isTyping = value.isNotEmpty
  ),
  decoration: InputDecoration(
    labelText: 'Animated Label',
    floatingLabelStyle: TextStyle(
      color: focusNode.hasFocus ? Colors.purple : Colors.grey,
      fontSize: isTyping ? 24 : 16,
      fontWeight: isTyping ? FontWeight.bold : FontWeight.normal,
      shadows: focusNode.hasFocus
          ? [
              Shadow(
                color: Colors.purple.withOpacity(0.3),
                offset: Offset(0, 3),
                blurRadius: 4,
              ),
            ]
          : [],
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: focusNode.hasFocus ? Colors.purple : Colors.grey,
        width: focusNode.hasFocus ? 2 : 1,
      ),
    ),
  ),
),''',
          ),
        ],
      ),
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

  Widget _buildRealWorldExample(String title, List<Map<String, dynamic>> fields) {
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
          ...fields.map((field) => Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                labelText: field['title'],
                prefixIcon: Icon(field['icon']),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              obscureText: field['title'] == 'Password',
            ),
          )),
        ],
      ),
    );
  }
} 