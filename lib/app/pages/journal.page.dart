import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'journalatricle.page.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(393, 873));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 255, 240, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 47.h),
            const JournalCardWidget(
              title: 'The Big Bloom—How Flowering Plants Changed the World',
              description:
              'Read a National Geographic magazine article about how flowering plants appeared during the Cretaceous period and get information, facts, and more about the flowers and the prehistoric world.',
            ),
            const JournalCardWidget(
              title: 'The Big Bloom—How Flowering Plants Changed the World',
              description:
              'Read a National Geographic magazine article about how flowering plants appeared during the Cretaceous period and get information, facts, and more about the flowers and the prehistoric world.',
            ),
            const JournalCardWidget(
              title: 'The Big Bloom—How Flowering Plants Changed the World',
              description:
              'Read a National Geographic magazine article about how flowering plants appeared during the Cretaceous period and get information, facts, and more about the flowers and the prehistoric world.',
            ),
          ],
        ),
      ),
    );
  }
}

class JournalCardWidget extends StatelessWidget {
  final String title;
  final String description;

  const JournalCardWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double leftMargin = ScreenUtil().setWidth(16);
    double rightMargin = ScreenUtil().setWidth(16);
    double topMargin = ScreenUtil().setHeight(22);
    double leftPadding = ScreenUtil().setWidth(11);
    double rightPadding = ScreenUtil().setWidth(31);
    double topPadding = ScreenUtil().setHeight(14);

    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 393) {
      topPadding = ScreenUtil().setHeight(22);
    }

    double titleFontSize = screenWidth < 393 ? ScreenUtil().setSp(15) : ScreenUtil().setSp(17);
    double descriptionFontSize = screenWidth < 393 ? ScreenUtil().setSp(12) : ScreenUtil().setSp(15);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const JournalArticlePage(),
          ),
        );
      },
      child: Container(
        width: ScreenUtil().setWidth(361),
        height: ScreenUtil().setHeight(209),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.55),
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
          border: Border.all(
            color: const Color.fromRGBO(70, 180, 48, 0.70),
            width: 1.0,
          ),
        ),
        margin: EdgeInsets.only(
          left: leftMargin,
          right: rightMargin,
          top: topMargin,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: leftPadding,
            right: rightPadding,
            top: topPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                description,
                maxLines: 5,
                style: GoogleFonts.nunito(
                  fontSize: descriptionFontSize,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
