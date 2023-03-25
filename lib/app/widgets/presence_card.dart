import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kavachApp/app/style/app_color.dart';

class PresenceCard extends StatelessWidget {
  final Map<String, dynamic> userData;
  final Map<String, dynamic>? todayPresenceData;
  PresenceCard({required this.userData, required this.todayPresenceData});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.teal[400],
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage('assets/images/pattern-.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // job
          Text(
            userData["job"],
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          //  Employee ID
          Container(
            margin: EdgeInsets.only(top: 4, bottom: 12),
            child: Text(
              userData["employee_id"],
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'poppins',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
          ),
          // check in - check out box
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.teal[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                //  check in
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "check in",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        (todayPresenceData?["checkInData"] == null)
                            ? "-"
                            : "${DateFormat.jms().format(DateTime.parse(todayPresenceData!["checkInData"]["date"]))}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1.5,
                  height: 24,
                  color: Colors.teal[400],
                ),
                // check out
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "check out",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        (todayPresenceData?["checkOutData"] == null)
                            ? "-"
                            : "${DateFormat.jms().format(DateTime.parse(todayPresenceData!["checkOutData"]["date"]))}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
