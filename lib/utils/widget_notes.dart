class WidgetNotes {
  // StatelessWidget vs StatefulWidget comparison
  static const Map<String, Map<String, String>> statelessVsStateful = {
    'State Change': {
      'StatelessWidget': 'Not possible',
      'StatefulWidget': 'Possible',
    },
    'UI Updates': {
      'StatelessWidget': 'Fixed UI',
      'StatefulWidget': 'Can update UI dynamically',
    },
    'Performance': {
      'StatelessWidget': 'Faster',
      'StatefulWidget': 'Slightly heavier',
    },
    'Example': {
      'StatelessWidget': 'Static UI (Text, Icons)',
      'StatefulWidget': 'Forms, Buttons, API calls',
    },
    'Use Case': {
      'StatelessWidget': 'When UI elements do not need to change',
      'StatefulWidget': 'When UI needs to be dynamic (forms, animations)',
    },
  };

  // Expanded vs Flexible comparison
  static const Map<String, Map<String, String>> expandedVsFlexible = {
    'Space Occupation': {
      'Expanded': 'Takes all available space',
      'Flexible': 'Takes only required space',
    },
    'Shrinkability': {
      'Expanded': 'No',
      'Flexible': 'Yes',
    },
    'Example': {
      'Expanded': 'Full-width buttons',
      'Flexible': 'List items inside a row',
    },
    'Use Case': {
      'Expanded': 'When you need to fill entire available space',
      'Flexible': 'When you need dynamic size adjustment',
    },
  };

  // Column vs ListView comparison
  static const Map<String, Map<String, String>> columnVsListView = {
    'Scrolling': {
      'Column': 'No',
      'ListView': 'Yes',
    },
    'Performance': {
      'Column': 'Good for small lists',
      'ListView': 'Better for large lists',
    },
    'Use Case': {
      'Column': 'Forms, Static Layouts',
      'ListView': 'Dynamic Lists (e.g., API data)',
    },
  };

  // SingleChildScrollView vs ListView comparison
  static const Map<String, Map<String, String>>
      singleChildScrollViewVsListView = {
    'Performance': {
      'SingleChildScrollView': 'Slow for large lists',
      'ListView': 'Optimized',
    },
    'Items Management': {
      'SingleChildScrollView': 'All items load at once',
      'ListView': 'Lazy loading (efficient)',
    },
    'Use Case': {
      'SingleChildScrollView': 'Small forms/pages',
      'ListView': 'Large datasets',
    },
  };

  // FutureBuilder vs StreamBuilder comparison
  static const Map<String, Map<String, String>> futureVsStreamBuilder = {
    'Data Type': {
      'FutureBuilder': 'One-time future',
      'StreamBuilder': 'Continuous stream',
    },
    'Use Case': {
      'FutureBuilder': 'API Calls, DB Fetch',
      'StreamBuilder': 'Live Updates, Firebase Streams',
    },
    'Example': {
      'FutureBuilder': 'Fetch user profile',
      'StreamBuilder': 'Live Chat Messages',
    },
  };

  // GetX vs Provider vs Riverpod comparison
  static const Map<String, Map<String, String>> stateManagement = {
    'Complexity': {
      'GetX': 'Simple',
      'Provider': 'Moderate',
      'Riverpod': 'Advanced',
    },
    'Performance': {
      'GetX': 'Fast',
      'Provider': 'Optimized',
      'Riverpod': 'Best',
    },
    'Learning Curve': {
      'GetX': 'Easy',
      'Provider': 'Moderate',
      'Riverpod': 'Steep',
    },
    'Use Case': {
      'GetX': 'Small projects',
      'Provider': 'Mid-size apps',
      'Riverpod': 'Large-scale apps',
    },
  };

  // SharedPreferences vs Hive vs SQLite comparison
  static const Map<String, Map<String, String>> storage = {
    'Data Type': {
      'SharedPreferences': 'Key-value (small data)',
      'Hive': 'NoSQL (fast)',
      'SQLite': 'SQL Database',
    },
    'Performance': {
      'SharedPreferences': 'High',
      'Hive': 'Very High',
      'SQLite': 'Moderate',
    },
    'Offline Support': {
      'SharedPreferences': 'Yes',
      'Hive': 'Yes',
      'SQLite': 'Yes',
    },
    'Use Case': {
      'SharedPreferences': 'Save user settings',
      'Hive': 'Fast NoSQL storage',
      'SQLite': 'Relational data',
    },
  };

  // Bloc vs GetX vs Riverpod comparison (Advanced State Management)
  static const Map<String, Map<String, String>> advancedStateManagement = {
    'Boilerplate Code': {
      'Bloc': 'High',
      'GetX': 'Low',
      'Riverpod': 'Moderate',
    },
    'Performance': {
      'Bloc': 'Good',
      'GetX': 'Best',
      'Riverpod': 'Best',
    },
    'Learning Curve': {
      'Bloc': 'Hard',
      'GetX': 'Easy',
      'Riverpod': 'Moderate',
    },
    'Use Case': {
      'Bloc': 'Large apps',
      'GetX': 'Small/medium apps',
      'Riverpod': 'Scalable apps',
    },
  };

  // HTTP vs Dio comparison
  static const Map<String, Map<String, String>> apiCalls = {
    'Ease of Use': {
      'http': 'Simple',
      'Dio': 'Advanced',
    },
    'Features': {
      'http': 'Basic API calls',
      'Dio': 'Advanced (Interceptors, Multipart, Caching)',
    },
    'Performance': {
      'http': 'Moderate',
      'Dio': 'Fast',
    },
    'Use Case': {
      'http': 'Small apps',
      'Dio': 'Large apps with API requests',
    },
  };

  // GestureDetector vs InkWell comparison
  static const Map<String, Map<String, String>> gestureDetectorVsInkWell = {
    'Tap Handling': {
      'GestureDetector': 'Yes',
      'InkWell': 'Yes',
    },
    'Long Press': {
      'GestureDetector': 'Yes',
      'InkWell': 'Yes',
    },
    'Swipe/Drag': {
      'GestureDetector': 'Yes',
      'InkWell': 'No',
    },
    'Ripple Effect': {
      'GestureDetector': 'No',
      'InkWell': 'Yes',
    },
    'Needs Material Widget': {
      'GestureDetector': 'No',
      'InkWell': 'Yes',
    },
  };

  // SizedBox vs Container comparison
  static const Map<String, Map<String, String>> sizedBoxVsContainer = {
    'Size Control': {
      'SizedBox': 'Yes, with fixed width/height',
      'Container': 'Yes, with constraints',
    },
    'Decoration': {
      'SizedBox': 'No',
      'Container': 'Yes (background color, borders, shadows, etc)',
    },
    'Padding/Margin': {
      'SizedBox': 'No',
      'Container': 'Yes',
    },
    'Performance': {
      'SizedBox': 'Lightweight',
      'Container': 'Heavier (if decorated)',
    },
  };

  // Row vs Column comparison
  static const Map<String, Map<String, String>> rowVsColumn = {
    'Direction': {
      'Row': 'Horizontal (left to right)',
      'Column': 'Vertical (top to bottom)',
    },
    'Main Axis': {
      'Row': 'Horizontal',
      'Column': 'Vertical',
    },
    'Cross Axis': {
      'Row': 'Vertical',
      'Column': 'Horizontal',
    },
    'Use Case': {
      'Row': 'Horizontal list of items (e.g., menu items)',
      'Column': 'Vertical list of items (e.g., form fields)',
    },
  };

  // Stack vs Positioned comparison
  static const Map<String, Map<String, String>> stackVsPositioned = {
    'Purpose': {
      'Stack': 'Layer widgets on top of each other',
      'Positioned': 'Place widget at exact position inside Stack',
    },
    'Usage': {
      'Stack': 'Parent widget that holds multiple children',
      'Positioned': 'Child widget inside Stack with specific position',
    },
    'Example': {
      'Stack': 'Background image with text overlay',
      'Positioned': 'Place a button at bottom-right corner',
    },
  };

  // Center vs Align comparison
  static const Map<String, Map<String, String>> centerVsAlign = {
    'Purpose': {
      'Center': 'Place widget in exact center',
      'Align': 'Place widget at any position',
    },
    'Flexibility': {
      'Center': 'Fixed center position',
      'Align': 'Can align to any position (top, bottom, etc.)',
    },
    'Use Case': {
      'Center': 'Loading spinners, centered text',
      'Align': 'Custom positioning of widgets',
    },
  };

  // Padding vs Margin comparison
  static const Map<String, Map<String, String>> paddingVsMargin = {
    'Location': {
      'Padding': 'Space inside the widget',
      'Margin': 'Space outside the widget',
    },
    'Effect': {
      'Padding': 'Affects internal content spacing',
      'Margin': 'Affects distance from other widgets',
    },
    'Use Case': {
      'Padding': 'Space between border and content',
      'Margin': 'Space between widgets',
    },
  };

  // Image.asset vs Image.network comparison
  static const Map<String, Map<String, String>> imageTypes = {
    'Source': {
      'Image.asset': 'Local files in project',
      'Image.network': 'Internet URLs',
    },
    'Loading Speed': {
      'Image.asset': 'Fast (bundled with app)',
      'Image.network': 'Depends on internet speed',
    },
    'Use Case': {
      'Image.asset': 'App logos, static images',
      'Image.network': 'Dynamic content, user uploads',
    },
  };

  // MaterialApp vs CupertinoApp comparison
  static const Map<String, Map<String, String>> appTypes = {
    'Design': {
      'MaterialApp': 'Android/Google style',
      'CupertinoApp': 'iOS/Apple style',
    },
    'Widgets': {
      'MaterialApp': 'Material Design widgets',
      'CupertinoApp': 'iOS-style widgets',
    },
    'Use Case': {
      'MaterialApp': 'Android-first or cross-platform apps',
      'CupertinoApp': 'iOS-specific apps',
    },
  };

  // TextField vs TextFormField comparison
  static const Map<String, Map<String, String>> textInputTypes = {
    'Validation': {
      'TextField': 'Basic input, manual validation',
      'TextFormField': 'Built-in form validation',
    },
    'Form Integration': {
      'TextField': 'Standalone use',
      'TextFormField': 'Works with Form widget',
    },
    'Use Case': {
      'TextField': 'Simple text input',
      'TextFormField': 'Forms with validation',
    },
  };

  // AlertDialog vs SimpleDialog comparison
  static const Map<String, Map<String, String>> dialogTypes = {
    'Purpose': {
      'AlertDialog': 'Show warnings or get confirmation',
      'SimpleDialog': 'Show list of options',
    },
    'Buttons': {
      'AlertDialog': 'Usually OK/Cancel buttons',
      'SimpleDialog': 'List of clickable options',
    },
    'Use Case': {
      'AlertDialog': 'Confirmations, warnings, errors',
      'SimpleDialog': 'Selection from multiple options',
    },
  };

  // GridView vs ListView comparison
  static const Map<String, Map<String, String>> gridViewVsListView = {
    'Layout': {
      'GridView': 'Items in grid (rows and columns)',
      'ListView': 'Items in single line (vertical/horizontal)',
    },
    'Use Case': {
      'GridView': 'Image galleries, dashboards',
      'ListView': 'Chat messages, settings menu',
    },
    'Scrolling': {
      'GridView': 'Both directions possible',
      'ListView': 'One direction (vertical/horizontal)',
    },
  };

  // PageView vs TabBarView comparison
  static const Map<String, Map<String, String>> pageViewVsTabBarView = {
    'Navigation': {
      'PageView': 'Swipe between pages',
      'TabBarView': 'Tab-based navigation',
    },
    'Controller': {
      'PageView': 'PageController',
      'TabBarView': 'TabController',
    },
    'Use Case': {
      'PageView': 'Onboarding screens, image sliders',
      'TabBarView': 'Category-based content, settings',
    },
  };

  // AnimatedContainer vs Container comparison
  static const Map<String, Map<String, String>> animatedContainerVsContainer = {
    'Animation': {
      'AnimatedContainer': 'Automatic animations',
      'Container': 'No animations',
    },
    'Performance': {
      'AnimatedContainer': 'Slightly heavier',
      'Container': 'Lightweight',
    },
    'Use Case': {
      'AnimatedContainer': 'Smooth size/color transitions',
      'Container': 'Static layouts',
    },
  };

  // FractionallySizedBox vs SizedBox comparison
  static const Map<String, Map<String, String>> fractionallySizedBoxVsSizedBox =
      {
    'Size Type': {
      'FractionallySizedBox': 'Relative (percentage)',
      'SizedBox': 'Absolute (pixels)',
    },
    'Flexibility': {
      'FractionallySizedBox': 'Adapts to parent size',
      'SizedBox': 'Fixed size',
    },
    'Use Case': {
      'FractionallySizedBox': 'Responsive layouts',
      'SizedBox': 'Fixed spacing/sizing',
    },
  };

  // Wrap vs Row comparison
  static const Map<String, Map<String, String>> wrapVsRow = {
    'Overflow': {
      'Wrap': 'Wraps to next line',
      'Row': 'Overflow error if too wide',
    },
    'Layout': {
      'Wrap': 'Multiple lines possible',
      'Row': 'Single line only',
    },
    'Use Case': {
      'Wrap': 'Tags, chips, flexible content',
      'Row': 'Fixed horizontal layouts',
    },
  };

  // ConstrainedBox vs UnconstrainedBox comparison
  static const Map<String, Map<String, String>> constrainedVsUnconstrainedBox =
      {
    'Constraints': {
      'ConstrainedBox': 'Enforces size limits',
      'UnconstrainedBox': 'Removes parent constraints',
    },
    'Child Size': {
      'ConstrainedBox': 'Limited by constraints',
      'UnconstrainedBox': 'Can be any size',
    },
    'Use Case': {
      'ConstrainedBox': 'Limit widget sizes',
      'UnconstrainedBox': 'Override parent constraints',
    },
  };

  // AspectRatio vs FittedBox comparison
  static const Map<String, Map<String, String>> aspectRatioVsFittedBox = {
    'Purpose': {
      'AspectRatio': 'Maintain width/height ratio',
      'FittedBox': 'Scale content to fit',
    },
    'Sizing': {
      'AspectRatio': 'Fixed ratio',
      'FittedBox': 'Flexible scaling',
    },
    'Use Case': {
      'AspectRatio': 'Videos, images with fixed ratio',
      'FittedBox': 'Responsive content scaling',
    },
  };

  // SafeArea vs Padding comparison
  static const Map<String, Map<String, String>> safeAreaVsPadding = {
    'Purpose': {
      'SafeArea': 'Avoid system intrusions',
      'Padding': 'Add space around content',
    },
    'Adaptation': {
      'SafeArea': 'Adapts to device features',
      'Padding': 'Fixed spacing',
    },
    'Use Case': {
      'SafeArea': 'Screen edges, notches, system bars',
      'Padding': 'Custom spacing between widgets',
    },
  };

  // Visibility vs Opacity comparison
  static const Map<String, Map<String, String>> visibilityVsOpacity = {
    'Effect': {
      'Visibility': 'Show/hide (removes from layout)',
      'Opacity': 'Fade in/out (keeps layout space)',
    },
    'Performance': {
      'Visibility': 'Better when hidden',
      'Opacity': 'Uses more resources',
    },
    'Use Case': {
      'Visibility': 'Toggle widget existence',
      'Opacity': 'Fade effects, transitions',
    },
  };

  // ClipRRect vs Card comparison
  static const Map<String, Map<String, String>> clipRRectVsCard = {
    'Purpose': {
      'ClipRRect': 'Round corners of any widget',
      'Card': 'Pre-styled container with elevation',
    },
    'Features': {
      'ClipRRect': 'Only corner rounding',
      'Card': 'Elevation, shadows, rounded corners',
    },
    'Use Case': {
      'ClipRRect': 'Custom image/widget rounding',
      'Card': 'Material design cards, list items',
    },
  };
}
