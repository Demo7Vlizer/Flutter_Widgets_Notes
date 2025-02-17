import 'package:flutter/material.dart';
import '../../../models/widget_data.dart';
import 'package:get/get.dart';

class WidgetListItem extends StatelessWidget {
  final WidgetData widgetData;

  const WidgetListItem({
    super.key,
    required this.widgetData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(widgetData.name),
        subtitle: widgetData.description != null 
            ? Text(
                widgetData.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widgetData.category != null)
              Chip(
                label: Text(
                  widgetData.category!,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right),
          ],
        ),
        onTap: () => Get.toNamed(
          '/widget-details',
          arguments: widgetData,
        ),
      ),
    );
  }
} 