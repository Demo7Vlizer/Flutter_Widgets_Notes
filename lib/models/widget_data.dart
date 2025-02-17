class WidgetData {
  final String name;
  final String href;
  final String? category;
  final String? description;

  const WidgetData({
    required this.name,
    required this.href,
    this.category,
    this.description,
  });

  factory WidgetData.fromJson(Map<String, dynamic> json) {
    return WidgetData(
      name: json['name'] as String,
      href: json['href'] as String,
      category: json['category'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'href': href,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
    };
  }
} 


