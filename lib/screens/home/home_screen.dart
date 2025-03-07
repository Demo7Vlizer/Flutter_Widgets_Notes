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
            Expanded(
              child: Obx(() {
                if (!controller.isSearching.value) {
                  return ListView(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.compare_arrows),
                        title: const Text('Widget Comparisons'),
                        subtitle:
                            const Text('Compare different types of widgets'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => Get.toNamed('/widget-comparisons'),
                      ),
                      const Divider(),
                      const CategoryListItem(
                        title: 'Basic Widgets',
                        route: '/basic',
                      ),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.searchResults.length,
                    itemBuilder: (context, index) {
                      return WidgetListItem(
                        widgetData: controller.searchResults[index],
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
