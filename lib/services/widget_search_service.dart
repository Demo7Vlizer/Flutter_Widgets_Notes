import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../models/widget_data.dart';

class WidgetSearchService {
  List<WidgetData> _widgets = [];

  List<WidgetData> get widgets => _widgets;

  Future<void> loadWidgets() async {
    try {
      final jsonString = await rootBundle.loadString('lib/data/flutter_widgets.json');
      final data = json.decode(jsonString);
      _widgets = List<WidgetData>.from(
        data['widgets'].map((json) => WidgetData.fromJson(json)),
      );
      debugPrint('Loaded ${_widgets.length} widgets'); // Debug log
    } catch (e) {
      debugPrint('Error loading widgets: $e');
      rethrow;
    }
  }

  List<WidgetData> search(String query) {
    query = query.toLowerCase().trim();
    final results = _widgets.where((widget) {
      return widget.name.toLowerCase().contains(query);
    }).toList();
    debugPrint('Search "$query" found ${results.length} results'); // Debug log
    return results;
  }
} 