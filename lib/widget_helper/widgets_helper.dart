import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eschoolapp/screen/announc_detaile_screen.dart';
import 'package:eschoolapp/screen/homework_detaile_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

// specific use in Dashboard only - Scroll items
class IconListItem extends StatelessWidget {
  final String iconString;
  final VoidCallback? callback;
  final String title;
  // final IconData iconData;
  const IconListItem(
      {super.key,
      required this.title,
      // required this.iconData,
      this.callback, required this.iconString});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 15, right: 5, left: 5),
      child: InkWell(
        onTap: () {
          if (callback != null) {
            callback!();
          }
        },
        child: MyContainer(
          boxShadow: true,
          width: 140,
          child: Column(
            children: [
              const Gap(7),
              SizedBox(
                height: 30,
                width: 30,

                child: Image.asset(
                  iconString,
                  fit: BoxFit.fill,
                ),
              ),
              const Gap(10),
              MyTextSmall(
                title: title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextMini extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? bgColor;
  final int maxLines;

  const MyTextMini(
      {super.key,
      this.color = Colors.black,
      required this.title,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w500,
      this.bgColor,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        maxLines: maxLines,
        style: TextStyle(
            backgroundColor: bgColor,
            color: color!,
            fontSize: fontSize,
            fontWeight: fontWeight,

            overflow: TextOverflow.ellipsis));
  }
} //

// Text
class MyTextSmall extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? bgColor;
  final int maxLines;

  const MyTextSmall(
      {super.key,
      this.color = Colors.black,
      required this.title,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w500,
      this.bgColor,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        maxLines: maxLines,
        style: TextStyle(
            backgroundColor: bgColor,
            color: color!,
            fontSize: fontSize,
            fontWeight: fontWeight,

            overflow: TextOverflow.ellipsis));
  }
} // Text

class MyTextMedium extends StatelessWidget {
  final String title;
  final double? fontSize;
  final int maxLines;
  final FontWeight? fontWeight;
  final Color? color;

  const MyTextMedium({
    super.key,
    this.color = Colors.black,
    required this.title,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w500,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,

          overflow: TextOverflow.ellipsis,
        ));
  }
} // Text

class MyTextBig extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int maxLines;

  const MyTextBig(
      {super.key,
      this.color = Colors.black,
      required this.title,
      this.fontSize = 20,
      this.fontWeight = FontWeight.w500,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        maxLines: maxLines,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,

            overflow: TextOverflow.ellipsis));
  }
}

// only used in log_in_screen.dart TextField
// searchbar
class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool hide;
  final bool border;
  final Widget? suffixIcon;
  final int maxLines;
  const MyTextField(
      {super.key,
      this.controller,
      this.hide = false,
      this.suffixIcon,
      required this.hintText,
      this.border = false,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: Colors.black,
        minLines: 1,
        maxLines: maxLines,
        style: const TextStyle(
          fontSize: 18,
        ),
        controller: controller,
        obscureText: hide,
        decoration: InputDecoration(
            focusedBorder: border == false
                ? const UnderlineInputBorder()
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.black)),
            border: border == false
                ? const UnderlineInputBorder()
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.black)),
            isDense: true,
            isCollapsed: true,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(
                color: HexColor("#9E95A2"),

                fontSize: 16,
                fontWeight: FontWeight.w500),
            hintText: hintText));
  }
}

// TextButton
class MyTextButton extends StatelessWidget {
  final Widget myWidget;
  final VoidCallback? callback;
  final double radius;
  final Color? bgColor;
  const MyTextButton(
      {super.key,
      required this.myWidget,
      this.callback,
      this.radius = 0,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)))),
        onPressed: () {
          if (callback != null) {
            callback!();
          }
        },
        child: myWidget);
  }
}

//logo
class MyLogo extends StatelessWidget {
  final double height;
  final double width;
  const MyLogo({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width, height: height, child: Image.asset('assets/logo1.png'));
  }
}

class MyAppBar extends StatelessWidget {
  final Widget? between;
  final Widget? middel;
  final Widget leading;
  final Widget? trailing;
  final bool? tabBar;

  final double containerHeight;
  final String title;
  const MyAppBar({
    super.key,
    this.between,
    this.middel,
    required this.containerHeight,
    required this.title,
    required this.leading,
    this.trailing,
    this.tabBar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(clipBehavior: Clip.none, children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              image: DecorationImage(
                  image: AssetImage("assets/content.png"), fit: BoxFit.fill)),
          height: containerHeight,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 100,
              left: 10,
              right: 10,
            ),
            child: Stack(
                clipBehavior: Clip.none,
                children: [middel != null ? middel! : Container()]),
          ),
        ),
        Positioned(
          top: 5,
          left: 10,
          right: 0,
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: MyTextBig(
              title: title,
              color: Colors.white,
            ),
            leading: leading,
            actions: [
              trailing != null ? trailing! : Container(),
            ],
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     leading,
          //     MyTextBig(
          //       title: title,
          //       color: Colors.white,
          //     ),
          //     trailing != null ? trailing! : Container(),
          //   ],
          // )
        ),
        // Search bar

        between != null ? between! : Container(),
      ])
    ]);
  }
}

class MyContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final String? imagePath;
  final Color color;
  final bool? colorBool;
  final bool boxShadow;
  final bool? circle;
  final double bottomRadius;
  final double topRadius;
  final double blurRadius;
  const MyContainer(
      {super.key,
      required this.child,
      this.height,
      this.width,
      this.top = 0,
      this.bottom = 0,
      this.left = 0,
      this.right = 0,
      this.imagePath,
      this.color = Colors.white,
      this.boxShadow = false,
      this.circle = false,
      this.bottomRadius = 10,
      this.topRadius = 10,
      this.colorBool = true,
      this.blurRadius = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: width,
      height: height,
      decoration: BoxDecoration(
        // shape:,
        image: imagePath != null
            ? DecorationImage(
                image: AssetImage(
                  imagePath!,
                ),
                fit: BoxFit.fill)
            : null,
        color: colorBool == true ? color : null,
        // boxShadow: boxShadow == true
        //     ? [ BoxShadow(blurRadius: blurRadius, color: Colors.black12)]
        //     : null,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(bottomRadius),
          top: Radius.circular(topRadius),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: top,
          bottom: bottom,
          left: left,
          right: right,
        ),
        child: child,
      ),
    );
  }
}

// Used in Dashboard.dart 1 times
// _______Column_chart.dart 1____
// _______Fees_screen.dart 2_____
class HeaderRow extends StatelessWidget {
  final String title;
  final Widget? subTitle;
  final bool? boxShadow;
  const HeaderRow(
      {super.key, required this.title, this.boxShadow = false, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      right: 10,
      boxShadow: boxShadow!,
      top: 5,
      bottom: 8,
      left: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/clipboard.png"),
              const Gap(10),
              MyTextMedium(title: title),
            ],
          ),
          Align(
              child: subTitle != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 11),
                      child: subTitle
                    )
                  : null),
        ],
      ),
    );
  }
}

class ContainerAppBar extends StatelessWidget {
  final String title;
  final double containerHeight;
  const ContainerAppBar(
      {super.key, required this.title, this.containerHeight = 80});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/content.png'), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        child: Stack(
          children: [
            Container(
              // color: Colors.red,
              child: Row(
                children: [
                  Gap(20),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,size: 25,
                    ),
                  )
                ],
              ),
            ),
            Container(
              // color:Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w500),
                  )
                  // Row(children: [
                  //
                  //
                  // ],)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
