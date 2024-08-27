import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/features/pages/home_screen/widget/custom_app_bar.dart';
import 'package:qbox_mobile/src/features/pages/home_screen/widget/custom_bottom_navigation.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Search'),
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
