import 'package:flutter/material.dart';
import '../utils/widget_notes.dart';

class WidgetComparisonsScreen extends StatelessWidget {
  const WidgetComparisonsScreen({super.key});

  Widget _buildComparisonTable(
      String title, Map<String, Map<String, String>> data) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Table(
              border: TableBorder.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
              children: [
                // Header Row
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                  ),
                  children: [
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Feature',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ...data.values.first.keys.map((key) => TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              key,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  ],
                ),
                // Data Rows
                ...data.entries.map((entry) => TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(entry.key),
                          ),
                        ),
                        ...entry.value.values.map((value) => TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(value),
                              ),
                            )),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Comparisons'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Layout Basics
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Layout Basics',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildComparisonTable(
              'Row vs Column',
              WidgetNotes.rowVsColumn,
            ),
            _buildComparisonTable(
              'Wrap vs Row',
              WidgetNotes.wrapVsRow,
            ),

            // Positioning and Spacing
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Positioning and Spacing',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildComparisonTable(
              'Stack vs Positioned',
              WidgetNotes.stackVsPositioned,
            ),
            _buildComparisonTable(
              'Center vs Align',
              WidgetNotes.centerVsAlign,
            ),
            _buildComparisonTable(
              'Padding vs Margin',
              WidgetNotes.paddingVsMargin,
            ),
            _buildComparisonTable(
              'SafeArea vs Padding',
              WidgetNotes.safeAreaVsPadding,
            ),

            // Sizing and Constraints
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Sizing and Constraints',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildComparisonTable(
              'SizedBox vs Container',
              WidgetNotes.sizedBoxVsContainer,
            ),
            _buildComparisonTable(
              'FractionallySizedBox vs SizedBox',
              WidgetNotes.fractionallySizedBoxVsSizedBox,
            ),
            _buildComparisonTable(
              'ConstrainedBox vs UnconstrainedBox',
              WidgetNotes.constrainedVsUnconstrainedBox,
            ),
            _buildComparisonTable(
              'AspectRatio vs FittedBox',
              WidgetNotes.aspectRatioVsFittedBox,
            ),

            // Lists and Grids
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Lists and Grids',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildComparisonTable(
              'GridView vs ListView',
              WidgetNotes.gridViewVsListView,
            ),

            // Navigation and Views
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Navigation and Views',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildComparisonTable(
              'PageView vs TabBarView',
              WidgetNotes.pageViewVsTabBarView,
            ),

            // Styling and Effects
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Styling and Effects',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildComparisonTable(
              'AnimatedContainer vs Container',
              WidgetNotes.animatedContainerVsContainer,
            ),
            _buildComparisonTable(
              'Visibility vs Opacity',
              WidgetNotes.visibilityVsOpacity,
            ),
            _buildComparisonTable(
              'ClipRRect vs Card',
              WidgetNotes.clipRRectVsCard,
            ),

            // State and Data
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'State and Data',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildComparisonTable(
              'StatelessWidget vs StatefulWidget',
              WidgetNotes.statelessVsStateful,
            ),
            _buildComparisonTable(
              'FutureBuilder vs StreamBuilder',
              WidgetNotes.futureVsStreamBuilder,
            ),
          ],
        ),
      ),
    );
  }
}
