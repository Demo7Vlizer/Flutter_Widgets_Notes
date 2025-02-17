import 'package:get/get.dart';
import '../models/widget_data.dart';
import '../services/widget_search_service.dart';

class WidgetController extends GetxController {
  final _widgetSearchService = WidgetSearchService();
  final widgets = <WidgetData>[].obs;
  final searchResults = <WidgetData>[].obs;
  final isSearching = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadWidgets();
  }

  Future<void> loadWidgets() async {
    try {
      await _widgetSearchService.loadWidgets();
      // You'll need to add a getter in WidgetSearchService to access widgets
      widgets.value = _widgetSearchService.widgets;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load widgets');
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      isSearching.value = false;
      searchResults.clear();
      return;
    }

    isSearching.value = true;
    searchResults.value = _widgetSearchService.search(query);
  }
} 