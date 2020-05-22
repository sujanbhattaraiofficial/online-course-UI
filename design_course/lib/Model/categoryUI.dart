import 'package:design_course/AppTheme/appthemeColors.dart';
import 'package:design_course/Model/category.dart';
import 'package:flutter/material.dart';
import 'package:design_course/sizeConfig.dart';

class CategoryUi extends StatefulWidget {
  final Category category;

  const CategoryUi({Key key, this.category}) : super(key: key);
  @override
  _CategoryUiState createState() => _CategoryUiState();
}

class _CategoryUiState extends State<CategoryUi> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 73 * SizeConfig.widthMultiplier,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Container(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 11.67 * SizeConfig.widthMultiplier,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppThemeColors.darkBlue.withOpacity(0.15),
                        borderRadius: BorderRadius.all(Radius.circular(
                            3.87096774194 * SizeConfig.heightMultiplier)),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 17 * SizeConfig.widthMultiplier,
                          ),
                          Expanded(
                              child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: 1.3 * SizeConfig.heightMultiplier,
                                right: 6 * SizeConfig.widthMultiplier,
                              ),
                              child: Container(
                                // alignment: Alignment.centerLeft,
                                child: Text(
                                  "${widget.category.title}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "muli",
                                      fontSize:
                                          2.06 * SizeConfig.heightMultiplier,
                                      letterSpacing: 0.27,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 2.46 * SizeConfig.widthMultiplier,
                                  bottom: 1.28 * SizeConfig.heightMultiplier,
                                  top: 0.64 * SizeConfig.heightMultiplier),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "${widget.category.lessonCount} Lessons",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: "muli",
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              1.54 * SizeConfig.textMultiplier,
                                          letterSpacing: 0.27,
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                    Container(
                                      child: Row(children: <Widget>[
                                        Text(
                                          "${widget.category.rating}",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "muli",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 1.54 *
                                                  SizeConfig.textMultiplier,
                                              letterSpacing: 0.27,
                                              color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.red[300],
                                          size:
                                              2.6 * SizeConfig.heightMultiplier,
                                        ),
                                      ]),
                                    )
                                  ]),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                  bottom: 0,
                                  right: 2.46 * SizeConfig.widthMultiplier,
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Rs ${widget.category.money}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "muli",
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                2 * SizeConfig.textMultiplier,
                                            letterSpacing: 0.27,
                                            color: AppThemeColors.darkBlue),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppThemeColors.darkBlue,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10.0,
                                              offset: Offset(-3, -3),
                                              color:
                                                  Colors.white.withOpacity(0.3),
                                            ),
                                            BoxShadow(
                                                blurRadius: 10.0,
                                                offset: Offset(3, 3),
                                                color: AppThemeColors.darkBlue
                                                    .withOpacity(0.2))
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.add,
                                            size:
                                                3 * SizeConfig.heightMultiplier,
                                            color: AppThemeColors.nearlyWhite,
                                          ),
                                        ),
                                      )
                                    ]))
                          ])))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 15,
            bottom: 15,
            left: 18,
            child: Container(
              // height: 50,
              // width: 50,
              // height: 10.3225806452 * SizeConfig.heightMultiplier,
              // width: 19.4647201946 * SizeConfig.widthMultiplier,
              decoration: BoxDecoration(
                  color: AppThemeColors.darkBlue.withOpacity(0.4),
                  shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(widget.category.imagePath),
              ),
            ),
          )
        ],
      ),
    );
  }
}
