import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/widget_list_item.dart';
import 'widgets/category_list_item.dart';
import '../../controllers/widget_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WidgetController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Showcase'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            HomeSearchBar(
              onChanged: controller.search,
            ),
            const SizedBox(height: 16),
            Obx(() {
              if (!controller.isSearching.value) {
                return const CategoryListItem(
                  title: 'Basic Widgets',
                  route: '/basic',
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.searchResults.length,
                    itemBuilder: (context, index) {
                      return WidgetListItem(
                        widgetData: controller.searchResults[index],
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
} 