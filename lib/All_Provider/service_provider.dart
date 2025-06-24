import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../All_Models/services_model.dart';

class ServiceProvider with ChangeNotifier {
  List<ServiceModel> _services = [];
  bool _isLoading = false;

  List<ServiceModel> get services => _services;
  bool get isLoading => _isLoading;

  Future<void> fetchFeaturedServices() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://prohandy.xgenious.com/api/v1/service/featured');

    try {
      final response = await http.get(url);
      final extracted = json.decode(response.body);

      if (response.statusCode == 200 && extracted['all_services'] != null) {
        _services = (extracted['all_services'] as List)
            .map((item) => ServiceModel.fromJson(item))
            .toList();
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
