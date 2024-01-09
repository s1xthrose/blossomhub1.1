import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrchideenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 255, 240, 1),
      appBar: AppBar(
        title: Text(
          'Orchideen',
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
                      image: AssetImage('assets/f_flower.png'),
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
                    Text('from 20 cm to 30 cm', style: GoogleFonts.nunito(
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
                    Text('January to February', style: GoogleFonts.nunito(
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
                    Text('free-draining bark', style: GoogleFonts.nunito(
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
                    Text('scattered light to semi-shade', style: GoogleFonts.nunito(
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
              '''Orchids of the genus Phalaenopsis are considered the epitome of the Orchids. They are among the best-selling ornamental plants worldwide and are by far the best-selling houseplants in the U.S. No wonder considering their enormously long flowering period and the almost infinite variety of colours.The Phalaenopsis, also known as Moth Orchid (“phálaina” is Greek for moths), belongs to the family of Orchids (Orchidaceae). There are almost 100 species of the genus Phalaenopsis alone. They thrive as Epiphytes (non-parasitic plants that grow anchored to other plants) in the tropical forests of India, Indonesia and Australia; but they can also be found in New Guinea, Taiwan and the Philippines. Moth Orchids are accustomed to an evenly warm climate throughout the year, with only a few degrees cooler nights and hardly any seasonal fluctuations. The Phalaenopsis showcased here are all hybrids, i.e. hybrids of various types and forms of Moth Orchids. Thanks to years of cultivation, these are now perfectly suited for indoor gardening. They are considered the most easy-care indoor orchids and they can easily be kept on the windowsill.Growth Almost all Orchids of the genus Phalaenopsis have monopodial growth. That means they grow upwards and usually do not form side shoots. The roots are fleshy and don’t branch out too much, they are leafy green in color in areas exposed to light and can therefore also carry out photosynthesis. The size of the plants varies depending on the cultivated breed — for example,there are special mini-Phalaenopsis that grow barely four inches in height. Foliage Depending on the type and cultivated breed, the Phalaenopsis Orchid forms over two to six leaves, some are quite leathery, others can be quite fleshy. They vary in color and size. The leaves of small species such as the Phalaenopsis Appendiculata only reach a leaf length of approximately 3.93 to 15.74 inches, whereas species such as the Phalaenopsis Gigantea, nomen est omen, develop leaves up to 39.37 inches. The color ranges from light to very dark green and can be monochrome or mottled. Blossoms The flowers either grow sideways of the shoot axis under or between the leaves upright upwards and are arching overhanging or drooping. They can either be very delicate or waxy and stiff. The length of some varieties is 0.39 inches up to 5.90 inches. They are zygomorphic, which means that they consist of two mirror-like halves. There are Phalaenopsis flowers in all the colours of the rainbow, from white, rosé and red, to pink, purple or yellow. Patterned (e.g. Phalaenopsis Amboinensis Flavida) or fragrant specimens are also commercially available. The Phalaenopsis 'Liodoro' exudes a citrusy fresh fragrance.''',
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
