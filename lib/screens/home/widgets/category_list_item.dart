import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListItem extends StatelessWidget {
  final String title;
  final String route;

  const CategoryListItem({
    super.key,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Get.toNamed(route),
    );
  }
} 