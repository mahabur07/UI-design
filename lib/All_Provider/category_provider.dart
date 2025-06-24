import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../All_Models/category_model.dart';


class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];
  bool _isLoading = false;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://prohandy.xgenious.com/api/v1/categories');

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);

      if (response.statusCode == 200 && data['categories'] != null) {
        _categories = (data['categories'] as List)
            .map((item) => CategoryModel.fromJson(item))
            .toList();
      }
    } catch (e) {
      debugPrint("Category Error: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
