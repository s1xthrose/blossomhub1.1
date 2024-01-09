import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'replantingadd.page.dart';

class ReplantingProvider extends ChangeNotifier {
  List<Watering> replantingData = [];

  void setReplantingData(List<Watering> data) {
    replantingData = data;
    notifyListeners();
  }

  void addReplantingData(Watering data) {
    replantingData.add(data);
    notifyListeners();
  }
}

class Watering {
  final String flowerId;
  final DateTime lastWateringDate;
  final DateTime nextReplantingDate;

  Watering({
    required this.flowerId,
    required this.lastWateringDate,
    required this.nextReplantingDate,
  });
}
class ReplantingPage extends StatefulWidget {
  const ReplantingPage({Key? key}) : super(key: key);

  @override
  _ReplantingPageState createState() => _ReplantingPageState();
}

class _ReplantingPageState extends State<ReplantingPage> {
  final GlobalKey<_ReplantingPageState> _key =
  GlobalKey<_ReplantingPageState>();

  @override
  void initState() {
    super.initState();
    //_loadReplantingData(_key);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(393, 873));
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 255, 240, 1),
      appBar: AppBar(
        title: Text(
          'Replanting Schedule',
          style: GoogleFonts.nunito(
            fontSize: ScreenUtil().setSp(17),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color.fromRGBO(235, 255, 240, 1),
        iconTheme: const IconThemeData(color: Color.fromRGBO(210, 59, 106, 1)),
        elevation: 0,
        toolbarHeight: ScreenUtil().setHeight(44),
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
        child: Consumer<ReplantingProvider>(
          builder: (context, replantingProvider, child) {
            if (replantingProvider.replantingData.isNotEmpty) {
              return ListView.builder(
                itemCount: replantingProvider.replantingData.length,
                itemBuilder: (context, index) {
                  Watering watering = replantingProvider.replantingData[index];
                  return FlowerCard(watering: watering);
                },
              );
            } else {
              return Center(
                child: Text('No replanting records available.'),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReplantingAddPage(),
            ),
          );
        },
        backgroundColor: const Color.fromRGBO(210, 59, 106, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(16)),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class FlowerCard extends StatelessWidget {
  final Watering watering;

  FlowerCard({Key? key, required this.watering}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    DateTime nextReplantingDate = watering.nextReplantingDate;
    int daysUntilReplanting = nextReplantingDate.difference(currentDate).inDays;

    return Card(
      child: ListTile(
        title: Text('Flower ID: ${watering.flowerId}'),
        subtitle: Text('$daysUntilReplanting days until replanting'),
      ),
    );
  }
}
