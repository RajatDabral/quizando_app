import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import '../pages/build_category_page.dart';

import '../providers/categories.dart';
import 'package:provider/provider.dart';

class CategorySelectScreen extends StatelessWidget {
  static const routeName = '/category-screen';

  @override
  Widget build(BuildContext context) {
    final catProvider =
        Provider.of<Categories>(context, listen: false).categoryItems;
    return Scaffold(
      body: PageView.builder(
        itemCount: catProvider.length,
        itemBuilder: (ctx, index) => BuildCategoryPage(
          context: context,
          id: catProvider[index].id,
        ).buildCatPage(),
      ),
    );
  }
}
