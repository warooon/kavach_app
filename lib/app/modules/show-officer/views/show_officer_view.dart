import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kavachApp/app/modules/show-officer/controllers/show_officer_controller.dart';
import 'package:kavachApp/app/style/app_color.dart';
import 'package:kavachApp/app/widgets/officer_list_tile.dart';
import 'package:kavachApp/app/widgets/presence_tile.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../controllers/show_officer_controller.dart';

class ShowOfficerView extends GetView<ShowOfficerController> {
  Map<String, dynamic> user = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Officer Details',
          style: TextStyle(
            color: AppColor.secondary,
            fontSize: 14,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.secondaryExtraSoft,
          ),
        ),
      ),
      body: GetBuilder<ShowOfficerController>(
        builder: (con) {
          return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: controller.getOfficerData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    var data = snapshot.data!.docs;
                    return ListView.separated(
                      itemCount: data.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(20),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        var presenceData = data[index].data();
                        return OfficerListTile(
                          officerData: presenceData,
                        );
                      },
                    );
                  default:
                    return SizedBox();
                }
              });
        },
      ),
    );
  }
}
