import 'package:design_course/AppTheme/appthemeColors.dart';
import 'package:design_course/MyClippers/clipPath.dart';
import 'package:flutter/material.dart';
import 'Animations/delayedAnimation.dart';
import 'Animations/scaleAnimation.dart';
import 'sizeConfig.dart';

class CourseInfo extends StatefulWidget {
  final String title;
  final int lessonCount;
  final int money;
  final double rating;
  final String imagePath;

  const CourseInfo(
      {Key key,
      this.title,
      this.lessonCount,
      this.money,
      this.rating,
      this.imagePath})
      : super(key: key);
  @override
  _CourseInfoState createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          SizeConfig().init(constraints, orientation);
          return Scaffold(
              backgroundColor: AppThemeColors.bgColor,
              body: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SafeArea(
                      child: Stack(
                        children: <Widget>[
                          ClipPath(clipper: MyClippers(), child: imageCentre()),
                          Positioned(
                              right: 20, bottom: 5, child: starDecoration())
                        ],
                      ),
                    ),
                    title(),
                    SizedBox(height: 3 * SizeConfig.heightMultiplier),
                    moneyAndStar(),
                    SizedBox(height: 3 * SizeConfig.heightMultiplier),
                    boxUi(),
                    discriptionText(),
                    belowButton()
                  ],
                ),
              ));
        },
      );
    });
  }

  Widget belowButton() {
    return Container(
      // color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Row(
          children: <Widget>[
            Text("Not Interested",
                style: TextStyle(
                    fontFamily: "muli",
                    fontWeight: FontWeight.bold,
                    fontSize: 2.5 * SizeConfig.textMultiplier,
                    letterSpacing: 0.27,
                    color: AppThemeColors.pureBlack)),
            SizedBox(width: 4.7 * SizeConfig.widthMultiplier),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 2 * SizeConfig.heightMultiplier),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppThemeColors.darkBlue,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            color: AppThemeColors.darkGrey.withOpacity(0.2),
                            offset: Offset(0, 15))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.6 * SizeConfig.heightMultiplier),
                      child: Text("Join Course",
                          style: TextStyle(
                              fontFamily: "muli",
                              fontWeight: FontWeight.bold,
                              fontSize: 2.5 * SizeConfig.textMultiplier,
                              letterSpacing: 0.27,
                              color: AppThemeColors.nearlyWhite)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget discriptionText() {
    return Flexible(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Padding(
            padding: EdgeInsets.only(top: 1.6 * SizeConfig.heightMultiplier),
            child: Container(
              child: Center(
                child: Text(
                    "A design is a plan or specification for the construction of an object or system or for the implementation of an activity or process, or the result of that plan or specification in the form of a prototype, product or process.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "muli",
                        fontSize: 2.1 * SizeConfig.textMultiplier,
                        letterSpacing: 0.27,
                        color: AppThemeColors.pureBlack)),
              ),
            ),
          ),
        ));
  }

  Widget boxUi() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DelayedAnimation(
                delayDuration: 100,
                aniDuration: 700,
                anioffsetX: -1.35,
                anioffsetY: 0.0,
                child: animatedBoxUi("${widget.lessonCount}", "Lessons")),
            DelayedAnimation(
                delayDuration: 300,
                aniDuration: 700,
                anioffsetX: -1.35,
                anioffsetY: 0.0,
                child: animatedBoxUi("2 Hours", "Time")),
            DelayedAnimation(
                delayDuration: 500,
                aniDuration: 700,
                anioffsetX: -1.35,
                anioffsetY: 0.0,
                child: animatedBoxUi("21", "Seat")),
          ],
        ),
      ),
    );
  }

  Widget animatedBoxUi(String s1, String s2) {
    return Container(
      height: 18.5 * SizeConfig.widthMultiplier,
      width: 11.23 * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
        color: AppThemeColors.darkBlue,
        boxShadow: [
          BoxShadow(
              blurRadius: 15,
              color: AppThemeColors.darkGrey.withOpacity(0.2),
              offset: Offset(0, 15))
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(s1,
              style: TextStyle(
                  fontFamily: "muli",
                  fontWeight: FontWeight.bold,
                  fontSize: 2 * SizeConfig.textMultiplier,
                  letterSpacing: 0.27,
                  color: AppThemeColors.nearlyWhite)),
          Text(s2,
              style: TextStyle(
                  fontFamily: "muli",
                  // fontWeight: FontWeight.bold,
                  fontSize: 1.8 * SizeConfig.textMultiplier,
                  letterSpacing: 0.27,
                  color: AppThemeColors.nearlyWhite)),
        ],
      ),
    );
  }

  Widget moneyAndStar() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Rs ${widget.money}",
            style: TextStyle(
                fontFamily: "muli",
                fontWeight: FontWeight.bold,
                fontSize: 2.3 * SizeConfig.textMultiplier,
                letterSpacing: 0.27,
                color: AppThemeColors.darkBlue),
          ),
          Row(
            children: <Widget>[
              DelayedAnimation(
                aniDuration: 700,
                anioffsetX: 0.0,
                anioffsetY: 1.35,
                delayDuration: 100,
                child: Text(
                  "${widget.rating}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: "muli",
                      fontWeight: FontWeight.bold,
                      fontSize: 2.3 * SizeConfig.textMultiplier,
                      letterSpacing: 0.27,
                      color: Colors.black),
                ),
              ),
              ScaleAnimation(
                delayDuration: 100,
                aniDuration: 800,
                child: Icon(
                  Icons.star,
                  color: Colors.red[300],
                  size: 2.8 * SizeConfig.heightMultiplier,
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }

  Widget title() {
    return Container(
      width: 62.5 * SizeConfig.widthMultiplier,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, top: 20, right: 18),
        child: Text(
          "${widget.title}",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: "muli",
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              fontSize: 2.8 * SizeConfig.textMultiplier,
              color: AppThemeColors.pureBlack),
        ),
      ),
    );
  }

  Widget starDecoration() {
    return ScaleAnimation(
      delayDuration: 100,
      aniDuration: 800,
      child: Container(
        height: 6 * SizeConfig.heightMultiplier,
        width: 11 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: AppThemeColors.darkBlue.withOpacity(0.2),
              offset: Offset(0, 3))
        ], color: AppThemeColors.nearlyWhite, shape: BoxShape.circle),
        child: Icon(
          Icons.star,
          size: 4 * SizeConfig.heightMultiplier,
          color: AppThemeColors.darkBlue,
        ),
      ),
    );
  }

  Widget imageCentre() {
    return Container(
      color: AppThemeColors.darkBlue,
      height: 35 * SizeConfig.heightMultiplier,
      width: double.infinity,
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ScaleAnimation(
            delayDuration: 100,
            aniDuration: 500,
            child: Image.asset(widget.imagePath)),
      )),
    );
  }
}
