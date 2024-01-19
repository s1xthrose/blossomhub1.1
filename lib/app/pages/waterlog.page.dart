import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wateringschedule.page.dart';
import 'waterlogadd.page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class WaterlogPage extends StatefulWidget {
  const WaterlogPage({Key? key}) : super(key: key);

  @override
  _WaterlogPageState createState() => _WaterlogPageState();
}

class _WaterlogPageState extends State<WaterlogPage> {
  final GlobalKey<_WaterlogPageState> _key = GlobalKey<_WaterlogPageState>();

  @override
  void initState() {
    super.initState();
    _loadWateringRecords(_key);
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(393, 873));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 255, 240, 1),
      appBar: AppBar(
        title: Text(
          'Waterlog',
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
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(16),
          left: ScreenUtil().setWidth(16),
          right: ScreenUtil().setWidth(16),
        ),
        child: Consumer<WateringProvider>(
          builder: (context, wateringProvider, child) {
            if (wateringProvider.wateringRecords.isNotEmpty) {
              return ListView.builder(
                itemCount: wateringProvider.wateringRecords.length,
                itemBuilder: (context, index) {
                  final flowerId =
                  wateringProvider.wateringRecords.keys.elementAt(index);
                  final records =
                  wateringProvider.wateringRecords[flowerId]!;
                  final lastRecord = records.last;

                  print('Flower ID: $flowerId');
                  print('Last Record: $lastRecord');

                  DateTime nextWateringDate =
                  lastRecord.lastWateringDate.add(
                    Duration(days: lastRecord.wateringFrequencyInDays),
                  );
                  int daysSinceLastWatering =
                      DateTime
                          .now()
                          .difference(lastRecord.lastWateringDate)
                          .inDays;
                  int daysUntilNextWatering =
                      nextWateringDate
                          .difference(DateTime.now())
                          .inDays;

                  Color borderColor =
                  daysSinceLastWatering > lastRecord.wateringFrequencyInDays
                      ? Color.fromRGBO(210, 59, 106, 1)
                      : Color.fromRGBO(70, 180, 48, 1);

                  Color textColor =
                  daysSinceLastWatering > lastRecord.wateringFrequencyInDays
                      ? Color.fromRGBO(210, 59, 106, 1)
                      : Color.fromRGBO(70, 180, 48, 1);

                  String notificationText =
                  daysSinceLastWatering > lastRecord.wateringFrequencyInDays
                      ? 'Watering Required!'
                      : '';

                  return Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                    width: ScreenUtil().setWidth(361),
                    height: ScreenUtil().setHeight(70),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(top: 0.h),
                            child: Text(
                              lastRecord.flowerName,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  if (daysSinceLastWatering <=
                                      lastRecord.wateringFrequencyInDays)
                                    Text(
                                      'Last watering $daysSinceLastWatering days ago. ',
                                      style: GoogleFonts.nunito(
                                        fontSize: MediaQuery.of(context).size.width < 393 ? 12 : ScreenUtil().setSp(14),
                                        fontWeight: FontWeight.w600,
                                        color: textColor,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  Text(
                                    'Next one in ${daysUntilNextWatering
                                        .abs()} days',
                                    style: GoogleFonts.nunito(
                                      fontSize: MediaQuery.of(context).size.width < 393 ? 12 : ScreenUtil().setSp(14),
                                      fontWeight: FontWeight.w600,
                                      color: textColor,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WateringSchedulePage(
                                      flowerId: flowerId,
                                      flowerName: lastRecord.flowerName,
                                      imageUrl: lastRecord.imageUrl,
                                      lastWateringDate: lastRecord
                                          .lastWateringDate,
                                      wateringFrequencyInDays:
                                      lastRecord.wateringFrequencyInDays,
                                    ),
                              ),
                            );
                          },
                          contentPadding: EdgeInsets.only(left: 14.w),
                        ),
                        if (notificationText.isNotEmpty)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: ScreenUtil().setWidth(129),
                              height: ScreenUtil().setHeight(19),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(210, 59, 106, 1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                child: Text(
                                  notificationText,
                                  style: GoogleFonts.nunito(
                                    fontSize: MediaQuery.of(context).size.width < 393 ? 9 : ScreenUtil().setSp(11),
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(235, 255, 240, 1),
                                    letterSpacing: 0.1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('No watering records available.'),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WaterlogAddPage()),
          );
        },
        backgroundColor: const Color.fromRGBO(210, 59, 106, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(16)),
        ),
        mini: false,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _loadWateringRecords(GlobalKey<_WaterlogPageState> key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String recordsJson = prefs.getString('wateringRecords') ?? '[]';
    List<dynamic> recordsList = json.decode(recordsJson);
    Map<String, List<FlowerData>> loadedRecords = {};

    print('Loading watering records from SharedPreferences:');

    recordsList.forEach((record) {
      String flowerId = record['flowerId'];
      List<dynamic> recordsData = record['records'];
      List<FlowerData> records =
      recordsData.map((data) => FlowerData.fromJson(data)).toList();
      loadedRecords[flowerId] = records;
    });

    if (loadedRecords.isNotEmpty) {
      key.currentState?.context.read<WateringProvider>().wateringRecords = loadedRecords;
    } else {
      print('No watering records found in SharedPreferences.');
    }
  }

  _saveWateringRecords(GlobalKey<_WaterlogPageState> key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, List<FlowerData>> records =
        key.currentState?.context.read<WateringProvider>().wateringRecords ?? {};

    List<Map<String, dynamic>> recordsList = [];
    records.forEach((flowerId, recordsData) {
      List<Map<String, dynamic>> data =
      recordsData.map((record) => record.toJson()).toList();
      recordsList.add({
        'flowerId': flowerId,
        'records': data,
      });
    });

    String recordsJson = json.encode(recordsList);
    prefs.setString('wateringRecords', recordsJson);

    print('Watering records saved to SharedPreferences:');
    print(recordsJson);
  }

  @override
  void dispose() {
    _saveWateringRecords(_key);
    super.dispose();
  }
}
