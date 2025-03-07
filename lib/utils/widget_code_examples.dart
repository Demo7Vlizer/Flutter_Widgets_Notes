class WidgetCodeExamples {
  static const Map<String, dynamic> appBarExample = {
    'code': '''
import 'package:flutter/material.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({Key? key}) : super(key: key);
  final String _title = 'Welcome Learn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mark_email_unread_sharp),
          ),
          const Center(child: CircularProgressIndicator()),
        ],
      ),
      body: Column(children: const []),
    );
  }
}''',
    'explanation': {
      'AppBar':
          'Top navigation bar widget that typically contains a title, leading widget, and actions',
      'title':
          'Widget displayed in center of AppBar, usually Text widget showing current screen name',
      'leading':
          'Widget displayed at start of AppBar (left in LTR), typically back button or menu icon',
      'actions':
          'List of widgets displayed at end of AppBar (right in LTR), often containing icons for additional functionality',
      'IconButton':
          'Material design button with an icon, handles tap/click events',
      'CircularProgressIndicator':
          'Spinning circular loading indicator showing ongoing process',
      'backgroundColor': 'Sets the background color of the AppBar',
      'elevation': 'Controls the shadow depth below the AppBar',
      'centerTitle':
          'Boolean to center the title widget (default is platform specific)',
      'toolbarHeight': 'Sets the height of the AppBar (default is 56.0)',
      'shape': 'Customizes the shape of the AppBar and its shadow',
      'flexibleSpace': 'Widget stacked behind the toolbar and tab bar',
      'bottom': 'Widget displayed below the AppBar, often TabBar',
      'systemOverlayStyle': 'Controls system UI overlay colors (status bar)',
    },
    'use_cases': {
      'Basic Navigation': 'Simple AppBar with title and back button',
      'Search AppBar': 'AppBar with search functionality in actions',
      'Custom AppBar': 'AppBar with custom styling and widgets',
      'Sliver AppBar': 'Collapsible AppBar for scrolling effects',
      'TabBar AppBar': 'AppBar with tabs for navigation',
      'Menu AppBar': 'AppBar with drawer menu and actions',
      'Transparent AppBar': 'AppBar without background for overlay effects',
      'Dynamic AppBar': 'AppBar that changes based on scroll or state',
    },
    'best_practices': {
      'Consistency': 'Keep AppBar style consistent across app',
      'Title Length': 'Keep titles short and descriptive',
      'Action Items': 'Limit to 2-3 most important actions',
      'Navigation': 'Use standard icons for familiar navigation patterns',
      'Spacing': 'Maintain proper spacing between action items',
      'Accessibility': 'Ensure proper contrast and touch target sizes',
      'Responsiveness': 'Handle different screen sizes appropriately',
      'Platform Guidelines': 'Follow platform-specific design guidelines',
    },
    'properties': {
      'automaticallyImplyLeading': 'Auto-adds back button when true (default)',
      'titleSpacing': 'Space between title and leading/actions widgets',
      'leadingWidth': 'Width of leading widget area',
      'toolbarOpacity': 'Opacity of the toolbar part of the AppBar',
      'bottomOpacity': 'Opacity of the bottom part of the AppBar',
      'foregroundColor': 'Color for icons and text in the AppBar',
      'shadowColor': 'Color of the shadow below the AppBar',
      'scrolledUnderElevation':
          'Elevation when content scrolls under the AppBar',
    },
    'common_patterns': {
      'Navigation Pattern':
          'Leading: Back button, Title: Current screen, Actions: Related functions',
      'Search Pattern':
          'Leading: Menu/Back, Title: Search field, Actions: Filter/Sort',
      'Dashboard Pattern':
          'Leading: Menu, Title: App name, Actions: Notifications/Profile',
      'Detail Pattern':
          'Leading: Back, Title: Item name, Actions: Edit/Share/More',
      'Form Pattern': 'Leading: Cancel, Title: Form name, Actions: Save/Submit',
      'Settings Pattern': 'Leading: Back, Title: Settings, Actions: Reset/Help',
    },
    'styling_tips': {
      'Material 3': 'Use surfaceTint and colorScheme for modern look',
      'Elevation': 'Use appropriate elevation for visual hierarchy',
      'Typography': 'Follow material design text styles',
      'Colors': 'Maintain sufficient contrast for accessibility',
      'Icons': 'Use consistent icon style and size',
      'Spacing': 'Follow material design spacing guidelines',
      'Transitions': 'Add smooth transitions for dynamic changes',
      'Dark Mode': 'Ensure proper appearance in both light and dark themes',
    },
  };

  static const Map<String, dynamic> buttonExample = {
    'code': '''
import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            child: Text('Save', style: Theme.of(context).textTheme.subtitle1),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.white;
            })),
            onPressed: () {},
          ),
          const ElevatedButton(onPressed: null, child: Text('data')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded)),
          FloatingActionButton(
            onPressed: () {
              // servise istek at
              // sayfanin rengini duzenle
            },
            child: const Icon(Icons.add),
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(backgroundColor: Colors.red, padding: const EdgeInsets.all(10)),
              onPressed: () {},
              child: const SizedBox(width: 200, child: Text('data'))),
          OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.abc), label: const Text('data')),
          InkWell(
            onTap: () {},
            child: const Text('custom'),
          ),
          Container(
            height: 200,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, right: 40, left: 40),
                child: Text(
                  'Place Bid',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ))
        ],
      ),
    );
  }
}''',
    'explanation': {
      'TextButton':
          'Flat button with text label and custom state-based styling',
      'ElevatedButton':
          'Raised button with elevation shadow and background color',
      'IconButton': 'Button with just an icon, no background or elevation',
      'FloatingActionButton':
          'Circular floating button, typically for primary actions',
      'OutlinedButton': 'Button with an outline border and optional background',
      'OutlinedButton.icon': 'Outlined button with both icon and text label',
      'InkWell': 'Custom button behavior with ink splash effect',
      'MaterialStateProperty':
          'Handles different button states (pressed, hovered, etc.)',
    },
    'use_cases': {
      'TextButton': 'Secondary actions, less prominent options',
      'ElevatedButton': 'Primary actions, important calls to action',
      'IconButton': 'Toolbar actions, compact button needs',
      'FloatingActionButton': 'Primary screen action (add, create, etc.)',
      'OutlinedButton': 'Secondary actions with visual boundaries',
      'InkWell': 'Custom button interactions on any widget',
    },
    'styling_features': {
      'MaterialStateProperty': 'Dynamic styling based on button state',
      'ButtonStyle': 'Comprehensive styling for shape, color, elevation',
      'Theme Integration': 'Using theme text styles for consistency',
      'Custom Shapes': 'RoundedRectangleBorder, CircleBorder for custom looks',
      'Padding': 'Custom padding for button content',
      'State Handling': 'Disabled state, pressed state customization',
    },
    'best_practices': {
      'Hierarchy': 'Use appropriate button type for action importance',
      'Consistency': 'Maintain consistent styling across similar actions',
      'Feedback': 'Provide visual feedback for interactions',
      'Accessibility': 'Ensure adequate touch targets and contrast',
      'State Clarity': 'Make button states clear (enabled/disabled)',
      'Spacing': 'Proper padding and margin for touch targets',
    },
    'common_patterns': {
      'Form Submit': 'ElevatedButton for form submission',
      'Navigation': 'TextButton for navigation links',
      'Actions Menu': 'IconButton for menu actions',
      'Create New': 'FloatingActionButton for creation actions',
      'Secondary Actions': 'OutlinedButton for secondary options',
      'Custom Interactions': 'InkWell for custom button behaviors',
    },
    'styling_tips': {
      'Visual Hierarchy': 'Use different button types to show importance',
      'State Design': 'Design for all states (normal, pressed, disabled)',
      'Size Guidelines': 'Minimum 48x48dp touch target size',
      'Color Usage': 'Follow material design color guidelines',
      'Typography': 'Consistent text styling with theme',
      'Elevation': 'Appropriate elevation for button type',
    },
  };

  static const Map<String, dynamic> cardExample = {
    'code': '''
import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: ProjectMargins.cardMargin,
            child: const SizedBox(
              height: 100,
              width: 300,
              child: Center(child: Text('Ali')),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          Card(
            margin: ProjectMargins.cardMargin,
            child: const SizedBox(
              height: 100,
              width: 300,
              child: Center(child: Text('Ali')),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          _CustomCard(
              child: const SizedBox(
            height: 100,
            width: 300,
            child: Center(child: Text('Ali')),
          ))
        ],
      ),
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
  static final roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
}

// Borders
//  StadiumBorder(),CircleBorder(),RoundedRectangeBorder()

class _CustomCard extends StatelessWidget {
  _CustomCard({Key? key, required this.child}) : super(key: key);
  final Widget child;
  final roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.cardMargin,
      child: child,
    );
  }
}''',
    'explanation': {
      'Card': 'Material Design card with elevation and rounded corners',
      'margin': 'Space around the card widget',
      'shape':
          'Defines the card\'s border shape (rounded corners, circle, etc.)',
      'child': 'Content widget inside the card',
      'CustomCard': 'Reusable card widget with predefined styling',
      'ProjectMargins': 'Static class for consistent margin values',
      'RoundedRectangleBorder': 'Border shape with rounded corners',
    },
    'use_cases': {
      'Content Container': 'Group related content with visual separation',
      'List Items': 'Individual items in a list with elevation',
      'Information Cards': 'Display structured information blocks',
      'Custom Cards': 'Reusable styled cards across the app',
      'Interactive Cards': 'Clickable cards for navigation or actions',
      'Media Cards': 'Display images or media with descriptions',
    },
    'styling_features': {
      'Shape': 'RoundedRectangleBorder, StadiumBorder, CircleBorder options',
      'Elevation': 'Shadow depth for visual hierarchy',
      'Margin': 'Spacing around the card',
      'Color': 'Background and surface colors',
      'Border': 'Custom border shapes and styles',
      'Padding': 'Internal spacing for content',
    },
    'best_practices': {
      'Consistency': 'Maintain consistent card styling across the app',
      'Reusability': 'Create custom card widgets for repeated use',
      'Spacing': 'Use consistent margins between cards',
      'Content Layout': 'Organize content clearly within cards',
      'Elevation': 'Use appropriate elevation for hierarchy',
      'Accessibility': 'Ensure sufficient contrast and touch targets',
    },
    'common_patterns': {
      'List Card': 'Card as a list item with consistent styling',
      'Media Card': 'Card with image and description',
      'Action Card': 'Clickable card with specific action',
      'Info Card': 'Card displaying structured information',
      'Custom Card': 'Reusable card with predefined styling',
      'Responsive Card': 'Card that adapts to different screen sizes',
    },
    'styling_tips': {
      'Visual Hierarchy': 'Use elevation to show importance',
      'Spacing': 'Consistent margins for visual rhythm',
      'Shape': 'Choose appropriate border radius for design',
      'Content Padding': 'Adequate internal spacing for content',
      'Theme Integration': 'Use theme colors for consistency',
      'Responsive Design': 'Adapt card size for different screens',
    },
    'properties': {
      'color': 'Background color of the card',
      'shadowColor': 'Color of the card\'s shadow',
      'elevation': 'Height of the card\'s shadow (default is 1.0)',
      'borderOnForeground': 'Whether to paint the border in front of the child',
      'clipBehavior': 'How to clip the card\'s content',
      'semanticContainer': 'Whether card merges semantics of its children',
    },
  };

  static const Map<String, dynamic> gestureDetectorExample = {
    'code': '''
import 'package:flutter/material.dart';

class GestureLearn extends StatelessWidget {
  const GestureLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Basic tap gesture
          GestureDetector(
            onTap: () {
              print('Tapped!');
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blue,
              child: const Text('Tap Me', style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 20),
          // Multiple gestures
          GestureDetector(
            onTap: () => print('Single tap'),
            onDoubleTap: () => print('Double tap'),
            onLongPress: () => print('Long press'),
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.green,
              child: const Text('Multiple Gestures', style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 20),
          // Drag gesture
          GestureDetector(
            onVerticalDragUpdate: (details) {
              print('Dragging: \${details.delta.dy}');
            },
            onHorizontalDragUpdate: (details) {
              print('Dragging: \${details.delta.dx}');
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.orange,
              child: const Text('Drag Me', style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 20),
          // Pan gesture
          GestureDetector(
            onPanStart: (details) => print('Pan started'),
            onPanUpdate: (details) => print('Pan update: \${details.delta}'),
            onPanEnd: (details) => print('Pan ended'),
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.purple,
              child: const Text('Pan Gesture', style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 20),
          // Scale gesture
          GestureDetector(
            onScaleStart: (details) => print('Scale started'),
            onScaleUpdate: (details) => print('Scale update: \${details.scale}'),
            onScaleEnd: (details) => print('Scale ended'),
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.red,
              child: const Text('Scale Me', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}''',
    'explanation': {
      'GestureDetector': 'Widget that detects various gestures on its child',
      'onTap': 'Single tap gesture handler',
      'onDoubleTap': 'Double tap gesture handler',
      'onLongPress': 'Long press gesture handler',
      'onVerticalDragUpdate': 'Vertical drag movement handler',
      'onHorizontalDragUpdate': 'Horizontal drag movement handler',
      'onPanUpdate': 'Pan (any direction) movement handler',
      'onScaleUpdate': 'Pinch to zoom/scale gesture handler',
    },
    'use_cases': {
      'Button Actions': 'Custom buttons with various tap behaviors',
      'Drag and Drop': 'Draggable elements in UI',
      'Zoom Controls': 'Image or map zooming with pinch gesture',
      'Swipe Actions': 'List item swipe actions or page navigation',
      'Custom Interactions': 'Complex gesture-based interactions',
      'Game Controls': 'Touch-based game controls',
    },
    'gesture_types': {
      'Tap Gestures': 'onTap, onDoubleTap, onLongPress',
      'Drag Gestures': 'onVerticalDragUpdate, onHorizontalDragUpdate',
      'Pan Gestures': 'onPanStart, onPanUpdate, onPanEnd',
      'Scale Gestures': 'onScaleStart, onScaleUpdate, onScaleEnd',
      'Force Press': 'onForcePressStart, onForcePressEnd (iOS)',
      'Touch Events':
          'Raw pointer events with onPointerDown, onPointerMove, etc.',
    },
    'best_practices': {
      'Feedback': 'Provide visual feedback for gestures',
      'Error Handling': 'Handle gesture conflicts appropriately',
      'Performance': 'Optimize gesture callbacks for smooth performance',
      'Accessibility': 'Ensure gesture actions are accessible',
      'Documentation': 'Document custom gesture behaviors clearly',
      'Testing': 'Test gesture interactions thoroughly',
    },
    'common_patterns': {
      'Custom Buttons': 'GestureDetector with Container for styled buttons',
      'Swipe to Delete': 'Horizontal drag gesture for list item actions',
      'Pull to Refresh': 'Vertical drag gesture for refresh action',
      'Zoom View': 'Scale gesture for zooming content',
      'Drag and Drop': 'Combination of drag gestures for item movement',
      'Interactive Cards': 'Multiple gestures for card interactions',
    },
    'styling_tips': {
      'Visual Feedback': 'Add visual cues for gesture states',
      'Hit Test Size': 'Ensure adequate touch target size',
      'Animation': 'Add smooth animations for gesture responses',
      'State Indication': 'Show current gesture state clearly',
      'Error States': 'Indicate when gestures are not available',
      'Loading States': 'Show loading state during gesture processing',
    },
  };

  static const Map<String, dynamic> colorExample = {
    'code': '''
import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Using Theme Colors
          Container(
            child: Text(
              'Error Text',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Theme.of(context).errorColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Using Custom Colors
          Container(
            padding: const EdgeInsets.all(16),
            color: ColorsItems.porchase,
            child: const Text('Custom Hex Color'),
          ),
          const SizedBox(height: 20),
          // Using RGBA Colors
          Container(
            padding: const EdgeInsets.all(16),
            color: ColorsItems.sulu,
            child: const Text('Custom RGBA Color'),
          ),
          const SizedBox(height: 20),
          // Using Material Colors
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade200,
            child: const Text('Material Color Shade'),
          ),
          const SizedBox(height: 20),
          // Using Color with Opacity
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.red.withOpacity(0.5),
            child: const Text('Color with Opacity'),
          ),
        ],
      ),
    );
  }
}

class ColorsItems {
  static const Color porchase = Color(0xffEDBF61);  // Hex color
  static const Color sulu = Color.fromRGBO(198, 237, 97, 1);  // RGBA color
}''',
    'explanation': {
      'Theme Colors':
          'Colors from the app\'s theme (errorColor, primaryColor, etc.)',
      'Custom Colors': 'Custom defined colors using hex or RGBA values',
      'Material Colors': 'Pre-defined Material Design color palette',
      'Color Class': 'Flutter\'s Color class for color manipulation',
      'ColorsItems': 'Static class for app-wide color constants',
      'copyWith': 'Method to create a copy of a style with modifications',
    },
    'use_cases': {
      'Theme Integration': 'Using theme colors for consistent styling',
      'Custom Branding': 'Implementing brand-specific colors',
      'State Indication': 'Colors for different states (error, success, etc.)',
      'Visual Hierarchy': 'Using colors to show importance',
      'Accessibility': 'Ensuring proper color contrast',
      'Dynamic Colors': 'Colors that adapt to light/dark mode',
    },
    'color_formats': {
      'Hex Colors': 'Color(0xffEDBF61) - 0xff prefix for opacity',
      'RGBA Colors': 'Color.fromRGBO(r, g, b, opacity)',
      'Material Colors': 'Colors.blue, Colors.red, etc.',
      'Color Shades': 'Colors.blue.shade200, shade500, etc.',
      'Opacity': 'withOpacity(0.5) for transparency',
      'HSL Colors': 'HSLColor for hue-based color manipulation',
    },
    'best_practices': {
      'Consistency': 'Use consistent colors throughout the app',
      'Theme Usage': 'Prefer theme colors over hardcoded values',
      'Color Constants': 'Define colors as static constants',
      'Accessibility': 'Ensure sufficient color contrast',
      'Dark Mode': 'Consider colors in both light and dark themes',
      'Documentation': 'Document color usage and meaning',
    },
    'common_patterns': {
      'Brand Colors': 'Define primary and secondary brand colors',
      'State Colors': 'Colors for success, error, warning states',
      'Text Colors': 'Different colors for various text styles',
      'Background Colors': 'Surface and background color hierarchy',
      'Accent Colors': 'Highlight and emphasis colors',
      'Gradient Colors': 'Color combinations for gradients',
    },
    'styling_tips': {
      'Color System': 'Create a systematic color palette',
      'Contrast': 'Maintain readable text contrast',
      'Color Harmony': 'Use complementary or analogous colors',
      'Semantic Colors': 'Colors that convey meaning',
      'Platform Guidelines': 'Follow platform color guidelines',
      'Color Variables': 'Use semantic color names in code',
    },
    'properties': {
      'value': 'Integer value of the color',
      'opacity': 'Alpha channel value (0.0 to 1.0)',
      'red': 'Red channel value (0-255)',
      'green': 'Green channel value (0-255)',
      'blue': 'Blue channel value (0-255)',
      'alpha': 'Alpha channel value (0-255)',
    },
  };

  static const Map<String, dynamic> rowColumnExample = {
    'code': '''
import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // First section: Row with equal width containers (40% of screen height)
          Expanded(
              flex: 4, // 40% of available space
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.red)),
                  Expanded(child: Container(color: Colors.green)),
                  Expanded(child: Container(color: Colors.blue)),
                  Expanded(child: Container(color: Colors.pink)),
                ],
              )),
          // Middle space (20% of screen height)
          const Spacer(flex: 2),
          // Text row section (20% of screen height)
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('a'),
                  Text('a2'),
                  Text('a3'),
                ],
              )),
          // Fixed height column section
          SizedBox(
            height: ProjectContainerSizes.cardHeight,
            child: Column(
              children: const [
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                Spacer(),
                Expanded(child: Text('data')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProjectContainerSizes {
  static const double cardHeight = 200;
}''',
    'explanation': {
      'Row': 'Horizontal layout widget that arranges children in a row',
      'Column': 'Vertical layout widget that arranges children in a column',
      'Expanded':
          'Widget that expands to fill available space with flex factor',
      'Spacer': 'Empty space widget with flex factor for spacing',
      'mainAxisAlignment': 'How to place children along the main axis',
      'crossAxisAlignment': 'How to place children along the cross axis',
      'mainAxisSize': 'How much space to occupy in the main axis',
      'flex': 'Relative proportion of space for Expanded widgets',
    },
    'use_cases': {
      'Equal Width Layout': 'Using Expanded for equal width distribution',
      'Proportional Layout': 'Using flex factors for proportional spacing',
      'Centered Content': 'Centering items in row or column',
      'Mixed Layouts': 'Combining fixed and flexible sizes',
      'Responsive Design': 'Creating layouts that adapt to screen size',
      'Complex Arrangements': 'Nesting rows and columns for complex layouts',
    },
    'layout_features': {
      'Main Axis':
          'Primary axis of arrangement (horizontal for Row, vertical for Column)',
      'Cross Axis': 'Secondary axis of arrangement',
      'Flex Factor': 'Proportional space distribution with Expanded and Spacer',
      'Size Constraints': 'Fixed size vs flexible size widgets',
      'Alignment Options': 'Various alignment properties for precise control',
      'Spacing Control': 'Managing space between and around children',
    },
    'best_practices': {
      'Performance': 'Avoid deeply nested Row/Column combinations',
      'Flexibility': 'Use Expanded for flexible layouts',
      'Spacing': 'Prefer Spacer over fixed SizedBox when possible',
      'Constraints': 'Handle layout constraints appropriately',
      'Responsiveness': 'Create adaptive layouts for different screen sizes',
      'Organization': 'Keep layout structure clean and maintainable',
    },
    'common_patterns': {
      'Equal Distribution': 'Using Expanded with equal flex factors',
      'Proportional Split': 'Using different flex factors for proportion',
      'Centered Content': 'Using mainAxisAlignment.center',
      'Space Between': 'Using mainAxisAlignment.spaceBetween',
      'Mixed Sizing': 'Combining fixed and flexible sizes',
      'Nested Layout': 'Combining Row and Column for complex layouts',
    },
    'styling_tips': {
      'Visual Balance': 'Maintain consistent spacing and proportions',
      'Responsive Design': 'Use flex factors for adaptable layouts',
      'Alignment': 'Choose appropriate alignment for content type',
      'Spacing': 'Use consistent spacing between elements',
      'Nesting': 'Keep nesting levels manageable',
      'Debug Mode': 'Use debug painting to visualize layout',
    },
    'properties': {
      'mainAxisAlignment':
          'start, end, center, spaceBetween, spaceAround, spaceEvenly',
      'crossAxisAlignment': 'start, end, center, stretch, baseline',
      'mainAxisSize': 'max (default) or min',
      'verticalDirection': 'down (default) or up',
      'textDirection': 'ltr or rtl',
      'textBaseline': 'alphabetic or ideographic',
    },
  };

  static const Map<String, dynamic> containerSizedBoxExample = {
    'code': '''
import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Basic SizedBox with fixed dimensions
          SizedBox(
            width: 300,
            height: 200,
            child: Text('a' * 500),
          ),
          // Empty SizedBox (0x0)
          const SizedBox.shrink(),
          // Square SizedBox
          SizedBox.square(
            dimension: 50,
            child: Text('b' * 50),
          ),
          // Container with constraints and decoration
          Container(
            constraints: const BoxConstraints(
              maxWidth: 200,
              minWidth: 100,
              minHeight: 10,
              maxHeight: 120
            ),
            child: Text('aa' * 100, maxLines: 2),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
          )
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(
      colors: [Colors.red, Colors.black]
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.green,
        offset: Offset(0.1, 1),
        blurRadius: 12
      )
    ],
    border: Border.all(
      width: 10,
      color: Colors.white12
    )
  );
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Colors.red, Colors.black]
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.green,
              offset: Offset(0.1, 1),
              blurRadius: 12
            )
          ],
          border: Border.all(
            width: 10,
            color: Colors.white12
          )
        );
}''',
    'explanation': {
      'SizedBox': 'Widget that forces its child to have specific dimensions',
      'SizedBox.shrink': 'Empty SizedBox with 0x0 dimensions',
      'SizedBox.square': 'SizedBox with equal width and height',
      'Container': 'Multi-purpose widget for styling, positioning, and sizing',
      'BoxConstraints': 'Constraints for minimum and maximum dimensions',
      'BoxDecoration':
          'Visual styling including borders, gradients, and shadows',
      'ProjectUtility': 'Utility class for reusable decorations',
      'ProjectContainerDecoration': 'Custom BoxDecoration subclass',
    },
    'use_cases': {
      'Fixed Dimensions': 'Using SizedBox for specific width/height',
      'Empty Spacing': 'SizedBox.shrink or fixed size for spacing',
      'Styled Container': 'Container with decoration for visual effects',
      'Constrained Box': 'Container with size constraints',
      'Padding and Margin': 'Container for spacing control',
      'Custom Decoration': 'Reusable styling with BoxDecoration',
    },
    'styling_features': {
      'Size Control': 'Fixed dimensions with width and height',
      'Constraints': 'Min/max width and height constraints',
      'Decoration': 'Borders, gradients, shadows, and shapes',
      'Spacing': 'Padding and margin control',
      'Gradient': 'Linear and radial gradient support',
      'Shadow': 'Customizable box shadows',
    },
    'best_practices': {
      'SizedBox Usage': 'Use for fixed dimensions and spacing',
      'Container Usage': 'Use when decoration or constraints needed',
      'Reusable Styles': 'Create utility classes for common decorations',
      'Performance': 'Prefer SizedBox over Container when possible',
      'Constraints': 'Use constraints to handle dynamic sizing',
      'Organization': 'Keep decoration logic separate and reusable',
    },
    'common_patterns': {
      'Spacing Pattern': 'SizedBox for consistent spacing',
      'Card Pattern': 'Container with decoration for card-like widgets',
      'Gradient Pattern': 'Container with gradient decoration',
      'Shadow Pattern': 'Container with box shadow',
      'Border Pattern': 'Container with border decoration',
      'Constraint Pattern': 'Container with size constraints',
    },
    'styling_tips': {
      'Visual Hierarchy': 'Use decoration to create depth',
      'Spacing Control': 'Consistent padding and margin',
      'Gradient Usage': 'Subtle gradients for visual interest',
      'Shadow Effects': 'Light shadows for elevation',
      'Border Styling': 'Rounded corners and border width',
      'Reusability': 'Create custom decoration classes',
    },
    'properties': {
      'width': 'Fixed width (SizedBox)',
      'height': 'Fixed height (SizedBox)',
      'constraints': 'Size constraints (Container)',
      'decoration': 'Visual styling (Container)',
      'padding': 'Inner spacing (Container)',
      'margin': 'Outer spacing (Container)',
      'transform': 'Matrix4 transformation (Container)',
      'alignment': 'Child alignment within container',
    },
  };

  static const Map<String, dynamic> customWidgetExample = {
    'code': '''
import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({Key? key}) : super(key: key);
  final String title = 'Food';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full width custom button with padding
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomFootButton(
                  title: title,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
          // Regular width custom button
          CustomFootButton(
            title: title,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// Utility class for colors
class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color white = Colors.white;
}

// Utility class for padding
class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16.0);
}

// Custom reusable button widget
class CustomFootButton extends StatelessWidget with _ColorsUtility, _PaddingUtility {
  CustomFootButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: redColor,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: normal2xPadding,
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}''',
    'explanation': {
      'CustomWidgetLearn': 'Example screen showing custom widget usage',
      'CustomFootButton':
          'Reusable custom button widget with consistent styling',
      '_ColorsUtility': 'Mixin class for color constants',
      '_PaddingUtility': 'Mixin class for padding constants',
      'MediaQuery': 'Used to get screen dimensions for responsive layout',
      'with keyword': 'Mixin implementation for sharing utility code',
      'required parameters': 'Enforcing necessary widget properties',
      'Theme integration': 'Using app theme for consistent text styling',
    },
    'use_cases': {
      'Reusable Components': 'Creating consistent, reusable UI elements',
      'Branded Widgets': 'Custom widgets with specific brand styling',
      'Complex Widgets': 'Combining multiple widgets into a single component',
      'Utility Sharing': 'Using mixins to share common properties',
      'Responsive Design': 'Adapting widgets to different screen sizes',
      'Theme Integration': 'Consistent styling with app theme',
    },
    'styling_features': {
      'Custom Styling': 'Specific visual styling for the widget',
      'Theme Integration': 'Using and modifying theme styles',
      'Padding Control': 'Consistent spacing through utilities',
      'Color Management': 'Centralized color definitions',
      'Shape Customization': 'Custom shapes for widgets',
      'Typography': 'Text style customization with theme',
    },
    'best_practices': {
      'Code Organization': 'Separate utility classes for better maintenance',
      'Reusability': 'Design widgets for maximum reuse',
      'Required Properties':
          'Clear property requirements with required keyword',
      'Documentation': 'Document widget purpose and usage',
      'Consistency': 'Maintain consistent styling and behavior',
      'Flexibility': 'Allow customization through parameters',
    },
    'common_patterns': {
      'Utility Mixins': 'Sharing common properties through mixins',
      'Theme Extension': 'Extending theme styles for custom needs',
      'Responsive Layout': 'Adapting to different screen sizes',
      'Property Validation': 'Ensuring required properties are provided',
      'Style Encapsulation': 'Keeping styling logic within widget',
      'Event Handling': 'Proper callback implementation',
    },
    'styling_tips': {
      'Theme Usage': 'Leverage app theme for consistency',
      'Color Management': 'Centralize color definitions',
      'Spacing System': 'Use consistent padding utilities',
      'Typography': 'Follow theme text styles',
      'Responsiveness': 'Consider different screen sizes',
      'Maintainability': 'Keep styling organized and reusable',
    },
    'properties': {
      'title': 'Text to display on the button',
      'onPressed': 'Callback function for button press',
      'style': 'Button style configuration',
      'padding': 'Internal spacing configuration',
      'shape': 'Button shape definition',
      'textStyle': 'Text style configuration',
    },
  };

  static const Map<String, dynamic> iconExample = {
    'code': '''
import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({Key? key}) : super(key: key);
  final IconSizes iconSize = IconSizes();
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello')),
      body: Column(
        children: [
          // Using static icon size with theme color
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: Theme.of(context).backgroundColor,
              size: IconSizes.iconSmall2x,
            ),
          ),
          const SizedBox(height: 50),
          // Using instance icon size with custom color
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: iconColors.froly,
              size: iconSize.iconSmall,
            ),
          ),
          // Reusing same icon configuration
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: iconColors.froly,
              size: iconSize.iconSmall,
            ),
          ),
        ],
      ),
    );
  }
}

// Centralized icon size management
class IconSizes {
  final double iconSmall = 40;
  static const double iconSmall2x = 80;
}

// Centralized icon color management
class IconColors {
  final Color froly = const Color(0xffED617A);
}''',
    'explanation': {
      'Icon': 'Widget that displays a glyph from an icon font',
      'IconButton': 'Material design icon button with tap detection',
      'IconSizes': 'Utility class for consistent icon sizing',
      'IconColors': 'Utility class for custom icon colors',
      'Theme Integration': 'Using theme colors for icons',
      'Static Constants': 'Using static values for shared sizes',
      'Instance Properties': 'Using instance properties for flexible values',
      'Color Management': 'Centralized color definitions with semantic names',
    },
    'use_cases': {
      'Navigation Icons': 'Icons for navigation and actions',
      'Status Indicators': 'Icons showing state or status',
      'Button Icons': 'Icons within buttons or as buttons',
      'List Icons': 'Icons in list items or tiles',
      'Form Icons': 'Icons in form fields or labels',
      'Brand Icons': 'Custom brand or app-specific icons',
    },
    'styling_features': {
      'Size Control': 'Consistent icon sizing through utilities',
      'Color Management': 'Theme and custom color integration',
      'Icon Types': 'Outlined, filled, rounded, sharp variants',
      'Custom Icons': 'Support for custom icon fonts',
      'Semantic Names': 'Clear naming for colors and sizes',
      'Theme Integration': 'Using theme colors for consistency',
    },
    'best_practices': {
      'Size Consistency': 'Use predefined sizes for consistency',
      'Color Organization': 'Centralize color definitions',
      'Semantic Naming': 'Use meaningful names for colors',
      'Theme Usage': 'Leverage theme colors when appropriate',
      'Accessibility': 'Ensure adequate touch targets',
      'Documentation': 'Document icon usage and meaning',
    },
    'common_patterns': {
      'Action Icons': 'Icons for interactive elements',
      'Status Icons': 'Icons indicating state or status',
      'Navigation Icons': 'Icons for navigation elements',
      'Indicator Icons': 'Icons showing additional information',
      'Form Icons': 'Icons in form elements',
      'Brand Icons': 'Custom icons for branding',
    },
    'styling_tips': {
      'Size Hierarchy': 'Use size to indicate importance',
      'Color Meaning': 'Use colors to convey purpose',
      'Touch Targets': 'Ensure adequate tap area',
      'Visual Weight': 'Balance icon weight with text',
      'Consistency': 'Maintain consistent style',
      'Platform Guidelines': 'Follow platform icon guidelines',
    },
    'properties': {
      'icon': 'IconData to display',
      'size': 'Size of the icon in logical pixels',
      'color': 'Color of the icon',
      'semanticLabel': 'Description for accessibility',
      'textDirection': 'Direction for icon rendering',
      'shadows': 'List of shadows for the icon',
    },
  };

  static const Map<String, dynamic> imageExample = {
    'code': '''
import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({Key? key}) : super(key: key);
  final String _imagePath =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Apple-book.svg/800px-Apple-book.svg.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        // Asset image using custom widget
        SizedBox(
          height: 100,
          width: 300,
          child: PngImage(name: ImageItems().appleBookWithoutPath),
        ),
        // Network image with error handling
        Image.network(
          _imagePath,
          errorBuilder: (context, error, stackTrace) => 
              const Icon(Icons.abc_outlined),
        ),
        // Asset image with BoxFit
        Image.asset(
          ImageItems().appleBook,
          fit: BoxFit.cover,
        ),
        // Network image with loading builder
        Image.network(
          _imagePath,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            );
          },
        ),
      ]),
    );
  }
}

// Utility class for image paths
class ImageItems {
  final String appleWithBook = "assets/apple-and-book-png-transparent-apple-and-book-images-274565.png";
  final String appleBook = "assets/png/ic_apple_with_school.png";
  final String appleBookWithoutPath = "ic_apple_with_school";
}

// Custom widget for PNG assets
class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath, fit: BoxFit.cover);
  }

  String get _nameWithPath => 'assets/png/\$name.png';
}''',
    'explanation': {
      'Image.network': 'Widget to display images from URLs',
      'Image.asset': 'Widget to display images from asset bundle',
      'PngImage': 'Custom widget for consistent PNG asset loading',
      'ImageItems': 'Utility class for centralized image path management',
      'BoxFit': 'Controls how image should be inscribed into its bounds',
      'errorBuilder': 'Handles image loading errors gracefully',
      'loadingBuilder': 'Customizes image loading state display',
      'SizedBox': 'Controls image container dimensions',
    },
    'use_cases': {
      'Network Images': 'Loading remote images with error handling',
      'Asset Images': 'Including images bundled with the app',
      'Custom Image Widgets': 'Reusable image components',
      'Loading States': 'Showing progress while images load',
      'Error States': 'Handling failed image loads gracefully',
      'Responsive Images': 'Adapting images to container size',
    },
    'styling_features': {
      'BoxFit': 'cover, contain, fill, fitWidth, fitHeight options',
      'Size Control': 'Width and height constraints',
      'Loading States': 'Custom loading indicators',
      'Error States': 'Custom error widgets',
      'Border Radius': 'Rounded corners for images',
      'Color Filtering': 'Applying color effects to images',
    },
    'best_practices': {
      'Asset Organization': 'Structured asset folders and naming',
      'Error Handling': 'Always provide error fallbacks',
      'Loading States': 'Show loading indicators for network images',
      'Path Management': 'Centralize image paths in utility class',
      'Size Management': 'Properly constrain image dimensions',
      'Memory Management': 'Use appropriate image resolution',
    },
    'common_patterns': {
      'Network Image': 'Loading remote images with error handling',
      'Asset Image': 'Loading local images from assets',
      'Cached Image': 'Caching network images for performance',
      'Responsive Image': 'Adapting to container size',
      'Placeholder Image': 'Showing placeholder while loading',
      'Error Image': 'Showing fallback on error',
    },
    'styling_tips': {
      'Resolution': 'Provide appropriate resolution images',
      'Aspect Ratio': 'Maintain image aspect ratios',
      'Loading Design': 'Consistent loading indicator style',
      'Error Design': 'User-friendly error states',
      'Performance': 'Optimize image sizes and caching',
      'Accessibility': 'Provide meaningful image descriptions',
    },
    'properties': {
      'fit': 'How image should be inscribed in its bounds',
      'width': 'Image display width',
      'height': 'Image display height',
      'scale': 'Scale factor for image',
      'errorBuilder': 'Widget to show on error',
      'loadingBuilder': 'Widget to show while loading',
      'semanticLabel': 'Description for accessibility',
      'centerSlice': 'Nine-slice scaling configuration',
    },
  };

  static const Map<String, dynamic> indicatorExample = {
    'code': '''
import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [CenterCircularRedProgress()],
      ),
      body: Column(
        children: [
          // Basic linear progress indicator
          const LinearProgressIndicator(),
          const SizedBox(height: 20),
          
          // Customized linear progress indicator
          const LinearProgressIndicator(
            backgroundColor: Colors.grey,
            color: Colors.blue,
            value: 0.7,
            minHeight: 10,
          ),
          const SizedBox(height: 20),
          
          // Basic circular progress indicator
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          
          // Custom circular progress indicator
          const CenterCircularRedProgress(),
          const SizedBox(height: 20),
          
          // Adaptive progress indicator
          const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          const SizedBox(height: 20),
          
          // Progress indicator with animation
          TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 2),
            builder: (context, double value, child) {
              return CircularProgressIndicator(
                value: value,
                backgroundColor: Colors.grey,
                color: Colors.purple,
              );
            },
          ),
        ],
      ),
    );
  }
}

class CenterCircularRedProgress extends StatelessWidget {
  const CenterCircularRedProgress({
    Key? key,
  }) : super(key: key);
  final redColor = Colors.red;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: redColor,
        strokeWidth: 10,
        value: 0.9,
        backgroundColor: Colors.white,
      ),
    );
  }
}''',
    'explanation': {
      'LinearProgressIndicator':
          'Horizontal progress bar showing determinate or indeterminate progress',
      'CircularProgressIndicator':
          'Circular loading spinner for progress indication',
      'CircularProgressIndicator.adaptive':
          'Platform-adaptive circular progress indicator',
      'CenterCircularRedProgress':
          'Custom progress indicator with specific styling',
      'value':
          'Determines progress (null for indeterminate, 0.0 to 1.0 for determinate)',
      'strokeWidth': 'Thickness of the progress indicator line',
      'TweenAnimationBuilder':
          'Animated progress indicator with custom duration',
      'backgroundColor': 'Color behind the progress indicator',
    },
    'use_cases': {
      'Loading States': 'Show loading status for async operations',
      'Progress Tracking': 'Display determinate progress for known operations',
      'Upload/Download': 'Show file transfer progress',
      'Form Submission': 'Indicate form processing status',
      'Data Fetching': 'Show data loading states',
      'Process Feedback': 'Provide visual feedback for ongoing processes',
    },
    'styling_features': {
      'Color': 'Custom colors for indicator and background',
      'Size': 'Control indicator dimensions and thickness',
      'Animation': 'Custom animation duration and curves',
      'Progress Type': 'Determinate vs indeterminate progress',
      'Platform Adaptation': 'Platform-specific styling',
      'Layout': 'Flexible positioning and alignment',
    },
    'best_practices': {
      'User Feedback': 'Always show loading state for async operations',
      'Progress Type': 'Use determinate when progress is known',
      'Consistency': 'Maintain consistent styling across app',
      'Accessibility': 'Provide meaningful progress information',
      'Performance': 'Avoid unnecessary indicator rebuilds',
      'Error States': 'Handle loading errors appropriately',
    },
    'common_patterns': {
      'Loading Screen': 'Full-screen loading indicator',
      'Button Loading': 'Progress indicator in buttons',
      'List Loading': 'Progress indicator for list items',
      'Form Submit': 'Progress indicator during submission',
      'Data Refresh': 'Pull-to-refresh with progress indicator',
      'Background Task': 'Progress for background operations',
    },
    'styling_tips': {
      'Color Choice': 'Use appropriate colors for context',
      'Size Balance': 'Keep size proportional to content',
      'Animation Speed': 'Maintain smooth, consistent animation',
      'Visual Feedback': 'Clear indication of progress state',
      'Platform Style': 'Follow platform design guidelines',
      'Contrast': 'Ensure visibility against background',
    },
    'properties': {
      'value': 'Progress value (0.0 to 1.0)',
      'backgroundColor': 'Color behind the indicator',
      'color': 'Color of the indicator',
      'strokeWidth': 'Width of the indicator line',
      'semanticsLabel': 'Description for accessibility',
      'semanticsValue': 'Progress value for accessibility',
      'minHeight': 'Minimum height (LinearProgressIndicator)',
      'strokeCap': 'End cap style for the line',
    },
  };

  static const Map<String, dynamic> listTileExample = {
    'code': '''
import 'package:flutter/material.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          // Basic ListTile with image and icons
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const Text('Basic ListTile'),
                onTap: () {},
                subtitle: const Text('How do you use your card'),
                minVerticalPadding: 0,
                dense: true,
                leading: Container(
                  height: 200,
                  width: 30,
                  alignment: Alignment.topCenter,
                  child: const Icon(Icons.money)
                ),
                trailing: const SizedBox(
                  width: 20,
                  child: Icon(Icons.chevron_right)
                ),
              ),
            ),
          ),
          
          // ListTile with custom styling
          ListTile(
            title: const Text('Custom Styled ListTile'),
            subtitle: const Text('With custom colors and shapes'),
            leading: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            tileColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          
          // Three-line ListTile
          ListTile(
            title: const Text('Three-line ListTile'),
            subtitle: const Text(
              'This is a three-line list tile with a lot of content that will wrap to multiple lines. It demonstrates how ListTile handles longer text.',
            ),
            leading: const Icon(Icons.star),
            trailing: const Icon(Icons.more_vert),
            isThreeLine: true,
          ),
          
          // Selected ListTile
          ListTile(
            title: const Text('Selected ListTile'),
            subtitle: const Text('This tile is in selected state'),
            leading: const Icon(Icons.check_circle),
            selected: true,
            selectedTileColor: Colors.blue.withOpacity(0.1),
            selectedColor: Colors.blue,
          ),
          
          // ListTile with custom content alignment
          ListTile(
            title: const Text('Custom Alignment'),
            subtitle: const Text('With centered content'),
            leading: const Icon(Icons.align_horizontal_center),
            trailing: const Icon(Icons.settings),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            horizontalTitleGap: 20,
          ),
        ]),
      ),
    );
  }
}''',
    'explanation': {
      'ListTile':
          'Single fixed-height row for showing content with leading/trailing widgets',
      'leading': 'Widget displayed at the start of the ListTile',
      'trailing': 'Widget displayed at the end of the ListTile',
      'title': 'Primary content of the ListTile',
      'subtitle': 'Secondary content displayed below the title',
      'dense': 'Makes the ListTile more compact vertically',
      'selected': 'Indicates whether the ListTile is in selected state',
      'isThreeLine': 'Allows the subtitle to span multiple lines',
    },
    'use_cases': {
      'List Items': 'Standard items in a scrolling list',
      'Menu Items': 'Options in a menu or drawer',
      'Settings Items': 'Configuration options in settings screen',
      'Contact List': 'Displaying contact information',
      'Navigation Items': 'Items in navigation menus',
      'Selection Items': 'Items in a selection list',
    },
    'styling_features': {
      'Content Layout': 'Leading, title, subtitle, and trailing widgets',
      'Padding Control': 'Custom padding and spacing',
      'Selection State': 'Visual feedback for selected state',
      'Shape Customization': 'Custom shapes and borders',
      'Color Control': 'Background and content colors',
      'Density Control': 'Compact or regular height options',
    },
    'best_practices': {
      'Content Balance': 'Maintain visual balance between elements',
      'Touch Targets': 'Ensure adequate touch target size',
      'Visual Hierarchy': 'Clear distinction between title and subtitle',
      'Consistent Styling': 'Use consistent styling across lists',
      'Accessibility': 'Provide clear tap targets and labels',
      'Responsive Layout': 'Handle content overflow gracefully',
    },
    'common_patterns': {
      'Basic List': 'Simple title with optional icon',
      'Settings Item': 'Title with trailing control or arrow',
      'Contact Item': 'Avatar with name and details',
      'Menu Item': 'Icon with label and optional indicator',
      'Selectable Item': 'Checkbox or radio with label',
      'Navigation Item': 'Icon with label and arrow',
    },
    'styling_tips': {
      'Spacing': 'Consistent padding and gaps',
      'Typography': 'Clear hierarchy in text styles',
      'Icon Usage': 'Meaningful and consistent icons',
      'Color Usage': 'Subtle colors for selection states',
      'Visual Feedback': 'Clear indication of tap states',
      'Content Alignment': 'Proper alignment of all elements',
    },
    'properties': {
      'contentPadding': 'Padding around the content',
      'horizontalTitleGap': 'Space between leading widget and title',
      'minVerticalPadding': 'Minimum padding above and below content',
      'minLeadingWidth': 'Minimum width of leading widget',
      'tileColor': 'Background color of the tile',
      'selectedTileColor': 'Background color when selected',
      'enabled': 'Whether the tile is interactive',
      'focusColor': 'Color when focused',
    },
  };

  static const Map<String, dynamic> listViewExample = {
    'code': '''
import 'package:flutter/material.dart';

class ListViewExamples extends StatelessWidget {
  const ListViewExamples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Examples')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic ListView.builder with images
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              'https://picsum.photos/150',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Item \${index + 1}'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Separated List:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            
            // ListView.separated with custom items
            SizedBox(
              height: 300,
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text('\${index + 1}')),
                    title: Text('List Item \${index + 1}'),
                    subtitle: Text('This is item number \${index + 1}'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  );
                },
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Grid List:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            
            // GridView.builder example
            SizedBox(
              height: 200,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100 * ((index % 3) + 1)],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text('Grid \${index + 1}')),
                  );
                },
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Custom Scroll Effects:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            
            // ListView with custom scroll physics
            SizedBox(
              height: 200,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple[200]!, Colors.blue[200]!],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Card \${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}''',
    'explanation': {
      'ListView.builder':
          'Efficiently creates scrollable list of widgets on demand',
      'ListView.separated':
          'Similar to builder but with separators between items',
      'GridView.builder': 'Creates a scrollable 2D array of widgets',
      'ScrollDirection':
          'Controls whether list scrolls vertically or horizontally',
      'SliverGridDelegate': 'Defines grid layout parameters',
      'ScrollPhysics': 'Controls how the list responds to user scrolling',
      'itemBuilder': 'Function that returns widgets for each list item',
      'separatorBuilder': 'Function that returns widgets between list items',
    },
    'use_cases': {
      'Image Galleries': 'Horizontal scrolling list of images',
      'Chat Messages': 'Vertical list with separators between messages',
      'Product Grid': 'Grid layout for displaying product cards',
      'News Feed': 'Infinite scrolling list of articles',
      'Menu Items': 'List of selectable options with dividers',
      'Story View': 'Horizontal scrolling stories or cards',
    },
    'styling_features': {
      'Scroll Direction': 'Vertical or horizontal scrolling',
      'Item Spacing': 'Control space between items',
      'Separators': 'Custom dividers between items',
      'Grid Layout': 'Customizable grid parameters',
      'Scroll Effects': 'Different scroll physics and behaviors',
      'Item Appearance': 'Flexible item styling and layout',
    },
    'best_practices': {
      'Performance': 'Use ListView.builder for large lists',
      'Item Height': 'Consider fixed item heights for better performance',
      'Lazy Loading': 'Implement pagination for large data sets',
      'Error Handling': 'Handle loading and error states',
      'Responsiveness': 'Adapt grid layout to screen size',
      'Memory Management': 'Dispose of resources when not needed',
    },
    'common_patterns': {
      'Pull to Refresh': 'Add RefreshIndicator for content updates',
      'Infinite Scroll': 'Load more items when reaching list end',
      'Grid/List Toggle': 'Switch between list and grid views',
      'Sticky Headers': 'Section headers that stick while scrolling',
      'Swipe Actions': 'Swipe to perform actions on list items',
      'Animated Items': 'Animate items when they appear',
    },
    'styling_tips': {
      'Visual Hierarchy': 'Use consistent spacing and sizing',
      'Loading States': 'Show placeholders while content loads',
      'Scroll Indicators': 'Clear indication of scrollable content',
      'Touch Feedback': 'Add visual feedback for interactions',
      'Empty States': 'Handle empty lists gracefully',
      'Accessibility': 'Ensure list items are accessible',
    },
    'properties': {
      'itemCount': 'Total number of items in the list',
      'scrollDirection': 'Axis.vertical or Axis.horizontal',
      'physics': 'ScrollPhysics for controlling scroll behavior',
      'shrinkWrap': 'Whether list should shrink to its contents',
      'primary': 'Whether this is the primary scroll view',
      'padding': 'Padding around the list content',
      'cacheExtent': 'Cache area before and after visible area',
      'controller': 'ScrollController for controlling the list',
    },
  };
}
