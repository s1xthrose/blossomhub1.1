import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CactusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 255, 240, 1),
      appBar: AppBar(
        title: Text(
          'Christmas Cactus',
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
                        image: AssetImage('assets/t_flower.png'),
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
                  SizedBox(width: 16),
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
                      Text('Succulent', style: GoogleFonts.nunito(
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
                      Text('from 20 cm to 40 cm', style: GoogleFonts.nunito(
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
                      Text('November to December', style: GoogleFonts.nunito(
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
                      Text('sandy to loamy', style: GoogleFonts.nunito(
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
                      Text('sunny', style: GoogleFonts.nunito(
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
                      Text('fresh to moderately humid', style: GoogleFonts.nunito(
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
                '''"Christmas cactus" is the common name for some species from the Schlumbergera genus, which belong to the cactus family (Cactaceae). They come from the Brazilian coastal forests, where they grow as epiphytes on large trees. The Christmas cacti cultivated for the apartment are purely hybrids, the wild varieties are not essentially indoor plants and are unfortunately all endangered in their natural locations. The Christmas cactus owes its botanical name to Frédéric Schlumberger, a French cactus breeder and collector. Christmas cacti are cultivated as classic indoor plants because they are not hardy in our latitudes. As they bloom during the Christmas season, they are particularly popular Christmas decorations. Their drooping shoots make them ideal for tall vessels or hanging baskets, where the lush flowers can hang over the edge. Despite being a member of the cactus species, the Christmas cactus does not have any real spines, but only fine bristles. The shoots are flat and fleshy and hang down, making the Christmas cactus particularly suitable for tall pots. With good care, the shrubby plant can grow up to 15.74 inches in size.''',
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
