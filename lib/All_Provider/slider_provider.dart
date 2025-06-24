import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../All_Models/slider_model.dart';



class SliderProvider with ChangeNotifier {
  List<SliderModel> _sliders = [];
  bool _isLoading = false;

  List<SliderModel> get sliders => _sliders;
  bool get isLoading => _isLoading;

  Future<void> fetchSliders() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://prohandy.xgenious.com/api/v1/slider-lists');

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);

      if (response.statusCode == 200 && data['sliders'] != null) {
        _sliders = (data['sliders'] as List)
            .map((item) => SliderModel.fromJson(item))
            .toList();
      }
    } catch (e) {
      debugPrint("Slider Error: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
