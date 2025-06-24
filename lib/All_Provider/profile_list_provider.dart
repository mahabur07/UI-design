import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../All_Models/profile_model.dart';

class ProviderListProvider with ChangeNotifier {
  List<ProviderModel> _providers = [];
  bool _isLoading = false;

  List<ProviderModel> get providers => _providers;
  bool get isLoading => _isLoading;

  Future<void> fetchProviders() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://prohandy.xgenious.com/api/v1/provider-lists');

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);

      if (response.statusCode == 200 && data['provider_lists'] != null) {
        _providers = (data['provider_lists'] as List)
            .map((e) => ProviderModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint('ProviderList Error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
