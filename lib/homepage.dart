import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reminder/clock_view.dart';
import 'package:reminder/data.dart';
import 'package:reminder/menu_info.dart';

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
              children: menuItems
                  .map((menuInfo) => buildMenuButton(menuInfo))
                  .toList()),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 26.0),
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
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'avenir'),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      formattedTime,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 64,
                          fontFamily: 'avenir'),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'avenir'),
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    ClockView(),
                    SizedBox(
                      height: 64,
                    ),
                    Text(
                      timezone,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'avenir'),
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

  Widget buildMenuButton(MenuInfo menuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget child) {
        return FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          color: menuInfo.menuType == value.menuType
              ? Color(0xFF242634)
              : Colors.transparent,
          onPressed: () {
            var menuinfo = Provider.of<MenuInfo>(context, listen: false);
            menuinfo.update(menuInfo);
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                menuInfo.imageSource,
                scale: 1.5,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                menuInfo.title ?? '',
                style: TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: 'avenir'),
              )
            ],
          ),
        );
      },
    );
  }
}
