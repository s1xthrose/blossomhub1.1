import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SpathiphyllumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 255, 240, 1),
      appBar: AppBar(
        title: Text(
          'Spathiphyllum',
          style: GoogleFonts.nunito(
            fontSize: ScreenUtil().setSp(17),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromRGBO(235, 255, 240, 1),
        iconTheme: const IconThemeData(color: Color.fromRGBO(210, 59, 106, 1)),
        elevation: 0,
        toolbarHeight: ScreenUtil().setHeight(44),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 170.w,
                    height: 304.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage('assets/fo_flower.png'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 11),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Growth type:', style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          color: const Color.fromRGBO(210, 59, 106, 0.7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ),
                      Text('Perennial plant', style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(8)),
                      Text('Growth height:', style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          color: const Color.fromRGBO(210, 59, 106, 0.7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ),
                      Text('from 30 cm to 80 cm', style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(8)),
                      Text('Flowering time:', style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          color: const Color.fromRGBO(210, 59, 106, 0.7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ),
                      Text('June to September', style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(8)),
                      Text('Soil type:', style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          color: const Color.fromRGBO(210, 59, 106, 0.7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ),
                      Text('gravelly to loamy', style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(8)),
                      Text('Light:', style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          color: const Color.fromRGBO(210, 59, 106, 0.7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ),
                      Text('scattered light to shady', style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(8)),
                      Text('Soil Moisture:', style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          color: const Color.fromRGBO(210, 59, 106, 0.7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ),
                      Text('fresh', style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(8)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(22)),
              Text(
                '''Origin. The peace lily (Spathiphyllum wallisii) from the Araceae family originates from the tropical regions of South America, primarily Columbia and Venezuela, where it grows in the shadows of large trees. There are 50 further species that belong to the genus of the peace lily - however Spathiphyllum wallisii is the most frequently cultivated species, next to the abundant flowering Spathiphyllum floribundum. The peace lily is not only prized for its appearance, it also improves the room climate, as its leaves filter formaldehyde out of the air. A note of caution: As with all Araceae, the peace lily is poisonous. Growth There are maxi, mini and midi types of the clump-forming peace lily available: They grow between 11.81 and 31.5 inches tall, depending on the variety. Spathiphyllum is the most long-lasting overall and adorns homes as a houseplant for years. Leaves Peace lily leaves are shiny and dark green. They grow up to 9.84 inches long and are attached to long stems. They are elliptical to elongated, the center rib has a triangular shape. The foliage itself has a highly decorative value, and during the flowering period it also creates a particularly beautiful contrast to the creme-white flowers.''',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(13),
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
