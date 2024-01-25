import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    _checkFirstRun();
  }

  _checkFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstRun = prefs.getBool('isFirstRun') ?? true;

    if (isFirstRun) {
      prefs.setBool('isFirstRun', false);
      Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/on_boarding');
      });
    } else {
      Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(393, 852));

    return Scaffold(
      backgroundColor: const Color(0xFFEBFFF0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/loading.svg',
              width: ScreenUtil().setWidth(271),
              height: ScreenUtil().setHeight(293),
            ),
            const SizedBox(height: 57),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Blossom',
                    style: GoogleFonts.nunito(
                      fontSize: ScreenUtil().setSp(48),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: const Color(0xFFD23B6A),
                    ),
                  ),
                  TextSpan(
                    text: 'Hub',
                    style: GoogleFonts.nunito(
                      fontSize: ScreenUtil().setSp(48),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: const Color(0xFF46B430),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
