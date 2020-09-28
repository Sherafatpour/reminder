import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminder/clock_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezone = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezone.startsWith('-')) offsetSign = '+';
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildMenuButton("Clock", 'assets/clock_icon.png'),
              buildMenuButton("Alarm", 'assets/alarm_icon.png'),
              buildMenuButton("Timer", 'assets/timer_icon.png'),
              buildMenuButton("Stopwatch", 'assets/stopwatch_icon.png'),

            ],
          ),
          VerticalDivider( color: Colors.white54,width: 1,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical : 8.0 , horizontal: 26.0),
            child: Expanded(
              child: Container(
                alignment: Alignment.center,
                // padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Clock",
                      style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'avenir'),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      formattedTime,
                      style: TextStyle(color: Colors.white, fontSize: 64, fontFamily: 'avenir'),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'avenir'),
                    ),
                    SizedBox(height: 64,),

                    ClockView(),
                    SizedBox(height: 64,),
                    Text(
                      timezone,
                      style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'avenir'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'UTC' + offsetSign + timezone,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMenuButton(String title , String image){
    return Padding(
        padding: const EdgeInsets.symmetric( vertical:  16.0),
        child: FlatButton(
          onPressed: (){},
          child: Column(children: <Widget>[
            Image.asset(image , scale: 1.5,),
            SizedBox(height: 16,),
            Text(title ?? '', style: TextStyle(color: Colors.white,fontSize: 14 , fontFamily: 'avenir' ),)
          ],),

        )
    );


  }

}
