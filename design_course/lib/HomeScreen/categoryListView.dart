import 'package:design_course/Model/categoryModel.dart';
import 'package:design_course/Model/categoryUI.dart';
import 'package:flutter/material.dart';
import 'package:design_course/sizeConfig.dart';

class CategoryListView extends StatefulWidget {
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.2 * SizeConfig.heightMultiplier,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return CategoryUi(
            category: categoryList[index],
          );
        },
      ),
    );
  }
}
