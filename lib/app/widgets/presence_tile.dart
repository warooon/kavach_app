import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kavachApp/app/routes/app_pages.dart';
import 'package:kavachApp/app/style/app_color.dart';

class PresenceTile extends StatelessWidget {
  final Map<String, dynamic> presenceData;
  PresenceTile({required this.presenceData});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.DETAIL_PRESENCE, arguments: presenceData),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: AppColor.primaryExtraSoft,
          ),
        ),
        padding: EdgeInsets.only(left: 24, top: 20, right: 29, bottom: 20),
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
                        "check in",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 6),
                      Text(
                        (presenceData["checkInData"] == null)
                            ? "-"
                            : "${DateFormat.jm().format(DateTime.parse(presenceData["checkInData"]["date"]))}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "check out",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 6),
                      Text(
                        (presenceData["checkOutData"] == null)
                            ? "-"
                            : "${DateFormat.jm().format(DateTime.parse(presenceData["checkOutData"]["date"]))}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 10),
              child: Text(
                "${DateFormat.MMMMEEEEd().format(DateTime.parse(presenceData["date"]))}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
