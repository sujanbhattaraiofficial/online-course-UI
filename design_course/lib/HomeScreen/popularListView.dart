import 'package:animations/animations.dart';
import 'package:design_course/AppTheme/appthemeColors.dart';
import 'package:design_course/Model/popularList.dart';
import 'package:design_course/Model/popularListUi.dart';
import 'package:design_course/courseInfo.dart';
import 'package:flutter/material.dart';

class PopularListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: GridView(
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: List<Widget>.generate(popularCourse.length, (int index) {
            String title = popularCourse[index].title;
            int lessonCount = popularCourse[index].lessonCount;
            int money = popularCourse[index].money;
            double rating = popularCourse[index].rating;
            String imagePath = popularCourse[index].imagePath;
            return Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: OpenContainer(
                openColor: AppThemeColors.darkBlue.withOpacity(0.15),
                closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                transitionType: ContainerTransitionType.fade,
                transitionDuration: Duration(milliseconds: 800),
                closedColor: AppThemeColors.bgColor,
                closedElevation: 0.0,
                openElevation: 0.0,
                openBuilder: (context, _) {
                  return CourseInfo(
                    title: title,
                    lessonCount: lessonCount,
                    money: money,
                    rating: rating,
                    imagePath: imagePath,
                  );
                },
                closedBuilder: (context, callBack) {
                  return PopularList(
                    popularCourse: popularCourse[index],
                    onTab: callBack,
                  );
                },
              ),
            );
          }),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 32.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: 0.7,
          ),
        ),
      ),
    );
  }
}
