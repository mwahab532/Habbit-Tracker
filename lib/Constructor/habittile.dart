import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class habittile extends StatelessWidget {
  final String habitname;
  final bool habithastarted;
  final int timespent;
  final int goaltime;
  final VoidCallback ontap;
  final Function(BuildContext)? settingstapped;
  final Function(BuildContext)? deletestapped;
  final Function(BuildContext)? resetstapped;
  habittile({
    required this.habitname,
    required this.habithastarted,
    required this.ontap,
    required this.settingstapped,
    required this.timespent,
    required this.goaltime,
    required this.deletestapped,
    this.resetstapped,
  });

  formatMinTosec(int totalseconde) {
    String sec = (totalseconde % 60).toString();
    String min = (totalseconde / 60).toStringAsFixed(5);

    if (sec.length == 1) {
      sec = '0' + sec;
    }
    if (min[1] == '.') {
      min = min.substring(0, 1);
    }
    return min + ':' + sec;
  }

  double percent() {
    return timespent / (goaltime * 60);
  }

  TextEditingController newhabitcontrollar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: settingstapped,
                backgroundColor: Colors.grey.shade900,
                icon: Icons.settings,
                borderRadius: BorderRadius.circular(120),
              ),
              SlidableAction(
                onPressed: deletestapped,
                backgroundColor: Colors.red,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(120),
              ),
              SlidableAction(
                onPressed: resetstapped,
                backgroundColor: Colors.green,
                icon: Icons.restore,
                borderRadius: BorderRadius.circular(120),
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: ontap,
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Stack(
                          children: [
                            CircularPercentIndicator(
                              radius: 30,
                              percent: percent() < 1 ? percent() : 1,
                              progressColor:
                                  percent() > 0.5 ? Colors.green : Colors.red,
                            ),
                            Center(
                              child: Icon(
                                habithastarted ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text(
                            habitname,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 45),
                          child: Text(
                            formatMinTosec(timespent) +
                                '/' +
                                goaltime.toString() +
                                '=' +
                                (percent() * 100).toStringAsFixed(0) +
                                '%',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
