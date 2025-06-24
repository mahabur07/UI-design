import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'All_Provider/category_provider.dart';
import 'All_Provider/profile_list_provider.dart';
import 'All_Provider/service_provider.dart';
import 'All_Provider/slider_provider.dart';
import 'home_page.dart';

void main() {
  runApp(const TestTask());
}

class TestTask extends StatelessWidget {
  const TestTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ServiceProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProviderListProvider()),

      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}
