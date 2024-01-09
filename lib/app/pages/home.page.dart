import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'control.page.dart';
import 'journal.page.dart';
import 'popular_flowers/cactus.page.dart';
import 'popular_flowers/orchideen.page.dart';
import 'popular_flowers/saintpaulia.page.dart';
import 'popular_flowers/spathiphyllum.page.dart';
import 'settings.page.dart';
import 'yourflow.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  Widget _buildTabItem(int index, IconData icon, String label) {
    double iconSize = ScreenUtil().setSp(24);
    double labelSize = ScreenUtil().setSp(12);

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _tabController.index = index;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _tabController.index == index
                ? const Color.fromRGBO(210, 59, 106, 0.7)
                : const Color.fromRGBO(235, 255, 240, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(16)),
            ),
            elevation: 0,
            padding: EdgeInsets.zero,
          ),
          child: Icon(
            icon,
            color: _tabController.index == index ? Colors.black : Colors.black,
            size: iconSize,
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(4)),
        Text(
          label,
          style: GoogleFonts.nunito(
            fontSize: labelSize,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: _tabController.index == index
                ? const Color.fromRGBO(210, 59, 106, 0.7)
                : Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double leftPadding = ScreenUtil().setWidth(16);
    double topPadding = ScreenUtil().setWidth(65);

    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          WelcomeWidget(),
          ControlPage(),
          JournalPage(),
          SettingsPage(),
        ],
      ),
      backgroundColor: const Color.fromRGBO(235, 255, 240, 1),
      extendBody: true,
      persistentFooterButtons: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTabItem(0, Icons.home, 'Home'),
              _buildTabItem(1, Icons.eco, 'Control'),
              _buildTabItem(2, Icons.list_alt, 'Journal'),
              _buildTabItem(3, Icons.settings, 'Settings'),
            ],
          ),
        ),
      ],
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    double leftPadding = ScreenUtil().setWidth(16);
    double topPadding = ScreenUtil().setWidth(65);
    double welcomeFontSize = ScreenUtil().setSp(17);
    double yourFlowersFontSize = ScreenUtil().setSp(18);
    double cardWidth = ScreenUtil().setWidth(160);
    double cardHeight = ScreenUtil().setHeight(128);
    double cardBorderRadius = ScreenUtil().setWidth(12);
    double cardImageHeight = ScreenUtil().setHeight(137);
    double cardImageWidth = ScreenUtil().setWidth(139);

    return Padding(
      padding: EdgeInsets.fromLTRB(leftPadding, topPadding, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: GoogleFonts.nunito(
              fontSize: welcomeFontSize,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontFeatures: [
                const FontFeature.enable('clig'),
                const FontFeature.enable('liga'),
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(41)),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const YourFlowPage(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your flowers',
                style: GoogleFonts.nunito(
                  fontSize: yourFlowersFontSize,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(16)),
                child: Icon(
                  Icons.chevron_right,
                  size: ScreenUtil().setSp(24),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
          SizedBox(height: ScreenUtil().setHeight(16)),
          SizedBox(
            height: ScreenUtil().setHeight(205),
            child: Consumer<FlowerNotifier>(
              builder: (context, flowerNotifier, child) {
                return ListView.builder(
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(4)),
                  scrollDirection: Axis.horizontal,
                  itemCount: flowerNotifier.flowers.length,
                  itemBuilder: (context, index) {
                    final flower = flowerNotifier.flowers[index];
                    return Container(
                      width: cardImageWidth,
                      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(cardBorderRadius),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(cardBorderRadius),
                            child: FutureBuilder(
                              future: _getResizedImage(flower.imageUrl),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  return Image.memory(
                                    snapshot.data as Uint8List,
                                    fit: BoxFit.cover,
                                    width: cardImageWidth,
                                    height: cardImageHeight,
                                  );
                                } else {
                                  return Container(
                                    width: cardImageWidth,
                                    height: cardImageHeight,
                                    color: Colors.grey,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(6)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(12)),
                            child: Text(
                              flower.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunito(
                                fontSize: ScreenUtil().setSp(15),
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.1,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(12)),
                            child: Text(
                              flower.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunito(
                                color: const Color.fromRGBO(77, 68, 68, 1),
                                fontSize: ScreenUtil().setSp(13),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(16)),
          Container(
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(16)),
            padding: EdgeInsets.all(ScreenUtil().setWidth(12)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cardBorderRadius),
              color: Color.fromRGBO(255, 255, 255, 0.55),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
                  child: Text(
                    'Popular flowers at this month:',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(18),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrchideenPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: cardWidth,
                        height: cardHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(cardBorderRadius),
                          color: Colors.blue,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: YourCardWidget(imageUrl: 'assets/f_flower.png', cardText: 'Orchideen'),
                      ),
                    ),
                    Container(
                      width: cardWidth,
                      height: cardHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(cardBorderRadius),
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: YourCardWidget(imageUrl: 'assets/s_flower.png', cardText: 'Saintpaulia'),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: cardWidth,
                      height: cardHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(cardBorderRadius),
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: YourCardWidget(imageUrl: 'assets/t_flower.png', cardText: 'Christmas Cactus'),
                    ),
                    Container(
                      width: cardWidth,
                      height: cardHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(cardBorderRadius),
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: YourCardWidget(imageUrl: 'assets/fo_flower.png', cardText: 'Spathiphyllum'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Uint8List> _getResizedImage(String imageUrl) async {
    if (imageUrl.isNotEmpty && File(imageUrl).existsSync()) {
      File imageFile = File(imageUrl);
      return await imageFile.readAsBytes();
    }

    ByteData byteData = await rootBundle.load('assets/placeholder_image.png');
    return byteData.buffer.asUint8List();
  }
}

class YourCardWidget extends StatelessWidget {
  final String imageUrl;
  final String cardText;

  YourCardWidget({required this.imageUrl, required this.cardText});

  @override
  Widget build(BuildContext context) {
    void navigateToPage() {
      switch (cardText) {
        case 'Orchideen':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrchideenPage(),
            ),
          );
          break;
        case 'Saintpaulia':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SaintpauliaPage(),
            ),
          );
          break;
        case 'Christmas Cactus':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CactusPage(),
            ),
          );
          break;
        case 'Spathiphyllum':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SpathiphyllumPage(),
            ),
          );
          break;
      }
    }

    return GestureDetector(
      onTap: navigateToPage,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12), bottom: Radius.circular(12)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12)),
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Center(
                  child: Text(
                    cardText,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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
}