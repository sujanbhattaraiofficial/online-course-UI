import 'package:design_course/AppTheme/appthemeColors.dart';
import 'package:flutter/material.dart';
import 'package:design_course/sizeConfig.dart';

class BouncyButton extends StatefulWidget {
  @override
  _BouncyButtonState createState() => _BouncyButtonState();
}

class _BouncyButtonState extends State<BouncyButton> {
  double _scale = 0.986;
  bool isPressed = false;
  CategoryType categoryType = CategoryType.coding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 0),
      child: Row(
        children: <Widget>[
          getButtonUI(CategoryType.coding, categoryType == CategoryType.coding),
          SizedBox(
            width: 5 * SizeConfig.widthMultiplier,
          ),
          getButtonUI(
              CategoryType.marketing, categoryType == CategoryType.marketing),
          SizedBox(
            width: 5 * SizeConfig.widthMultiplier,
          ),
          getButtonUI(
              CategoryType.security, categoryType == CategoryType.security),
          SizedBox(
            width: 5 * SizeConfig.widthMultiplier,
          ),
          getButtonUI(CategoryType.ui, categoryType == CategoryType.ui),
          SizedBox(
            width: 5 * SizeConfig.widthMultiplier,
          ),
        ],
      ),
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String title;
    if (categoryTypeData == CategoryType.coding) {
      title = "Coding";
    }
    if (categoryTypeData == CategoryType.ui) {
      title = "UI/UX";
    }
    if (categoryTypeData == CategoryType.marketing) {
      title = "Marketing";
    }
    if (categoryTypeData == CategoryType.security) {
      title = "Security";
    }
    return Expanded(
      child: GestureDetector(
          onTap: () {
            setState(() {
              categoryType = categoryTypeData;
            });
          },
          child: isSelected
              ? getButton(0.0, Offset(0, 0), title, isSelected)
              : getButton(15, Offset(0, 10), title, isSelected)),
    );
  }

  Widget getButton(
      double blurRadius, Offset offset, String text, bool isSelected) {
    return Container(
      height: 5.16129032258 * SizeConfig.heightMultiplier,
      width: 614.5985401460 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
        border: Border.all(color: AppThemeColors.darkBlue),
        color:
            isSelected ? AppThemeColors.darkBlue : AppThemeColors.nearlyWhite,
        borderRadius: BorderRadius.all(
            Radius.circular(2.58064516129 * SizeConfig.heightMultiplier)),
        boxShadow: [
          BoxShadow(
              color: AppThemeColors.darkGrey.withOpacity(0.2),
              blurRadius: blurRadius,
              offset: offset),
        ],
      ),
      child: Center(
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(text,
                  style: TextStyle(
                      color: isSelected
                          ? AppThemeColors.nearlyWhite
                          : AppThemeColors.pureBlack,
                      fontWeight: FontWeight.bold,
                      fontFamily: "muli",
                      letterSpacing: 1.0,
                      fontSize: 1.5 * SizeConfig.textMultiplier)),
            ),
          ),
        ),
      ),
    );
  }
}

enum CategoryType {
  ui,
  coding,
  marketing,
  security,
}
