import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'yourflow.page.dart';
import 'wateringschedule.page.dart'; // Импортируйте WateringProvider

class FlowerDetailsPage extends StatelessWidget {
  final Flower flower;

  const FlowerDetailsPage({Key? key, required this.flower}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WateringProvider wateringProvider = Provider.of<WateringProvider>(context);
    FlowerData? lastWateringRecord = wateringProvider.wateringRecords[flower.id]?.lastOrNull;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 255, 240, 1),
      appBar: AppBar(
        title: Text(
          flower.name,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil().setSp(17),
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(235, 255, 240, 1),
        iconTheme: const IconThemeData(color: Color.fromRGBO(210, 59, 106, 1)),
        elevation: 0,
        toolbarHeight: ScreenUtil().setHeight(44),
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(16.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(281),
                    height: ScreenUtil().setHeight(281),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
                      child: FutureBuilder(
                        future: _loadImage(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return Image.memory(
                              snapshot.data as Uint8List,
                              fit: BoxFit.cover,
                            );
                          } else {
                            return Container(
                              color: Colors.grey,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  if (lastWateringRecord != null)
                    _buildLastWateringInfo(lastWateringRecord),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(36.0)),
            Text(
              flower.name,
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(20),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(12.0)),
            Text(
              flower.description,
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(15),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(12.0)),
            Text(
              'Notes',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: const Color.fromRGBO(210, 59, 106, 0.7),
                  fontSize: ScreenUtil().setSp(15),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(8.0)),
            Text(
              flower.notes ?? 'No notes available',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(15),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: lastWateringRecord != null
          ? Container(
        width: ScreenUtil().setWidth(56.0),
        height: ScreenUtil().setHeight(56.0),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(16)),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WateringSchedulePage(
                  flowerId: flower.id,
                  flowerName: flower.name,
                  imageUrl: flower.imageUrl,
                  lastWateringDate: lastWateringRecord?.lastWateringDate ?? DateTime.now(),
                  wateringFrequencyInDays: lastWateringRecord?.wateringFrequencyInDays ?? 0,
                ),
              ),
            );
          },
          backgroundColor: _calculateButtonColor(lastWateringRecord),
          child: Icon(Icons.eco),
        ),
      )
          : SizedBox.shrink(),
    );
  }

  Color _calculateButtonColor(FlowerData? lastWateringRecord) {
    DateTime currentDate = DateTime.now();
    int daysSinceLastWatering = lastWateringRecord != null
        ? currentDate.difference(lastWateringRecord.lastWateringDate).inDays
        : 0;

    return daysSinceLastWatering > (lastWateringRecord?.wateringFrequencyInDays ?? 0)
        ? const Color.fromRGBO(210, 59, 106, 1)
        : const Color.fromRGBO(70, 180, 48, 1);
  }

  Widget _buildLastWateringInfo(FlowerData lastWateringRecord) {
    DateTime currentDate = DateTime.now();
    int daysSinceLastWatering = currentDate.difference(lastWateringRecord.lastWateringDate).inDays;

    Color containerColor = daysSinceLastWatering > lastWateringRecord.wateringFrequencyInDays
        ? Color.fromRGBO(210, 59, 106, 0.7)
        : Color.fromRGBO(70, 180, 48, 0.7);

    return Positioned(
      bottom: 0,
      child: Container(
        width: 281.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            'LAST WATERING AT ${DateFormat('dd MMMM').format(
              lastWateringRecord.lastWateringDate.toLocal(),
            )}'.toUpperCase(),
            style: GoogleFonts.nunito(
              fontSize: ScreenUtil().setSp(14),
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Future<Uint8List> _loadImage() async {
    try {
      if (flower.imageUrl.isNotEmpty && File(flower.imageUrl).existsSync()) {
        File imageFile = File(flower.imageUrl);
        return await imageFile.readAsBytes();
      } else {
        ByteData byteData = await rootBundle.load('assets/placeholder_image.png');
        return byteData.buffer.asUint8List();
      }
    } catch (e) {
      print('Error loading image: $e');
      ByteData byteData = await rootBundle.load('assets/placeholder_image.png');
      return byteData.buffer.asUint8List();
    }
  }
}
