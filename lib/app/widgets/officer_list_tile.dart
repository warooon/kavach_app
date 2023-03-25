import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kavachApp/app/routes/app_pages.dart';

class OfficerListTile extends StatelessWidget {
  final Map<String, dynamic> officerData;
  OfficerListTile({required this.officerData});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      //  => Get.toNamed(Routes.DETAIL_PRESENCE, arguments: presenceData),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
        ),
        padding: EdgeInsets.only(left: 24, top: 5, right: 29, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 7),
                      Text(
                        officerData["name"],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(width: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Job",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          officerData["job"],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
            )
          ],
        ),
      ),
    );
  }
}
