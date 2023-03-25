import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:maps_launcher/maps_launcher.dart';
import 'package:kavachApp/app/routes/app_pages.dart';
import 'package:kavachApp/app/style/app_color.dart';
import 'package:kavachApp/app/widgets/custom_bottom_navigation_bar.dart';
import 'package:kavachApp/app/widgets/presence_card.dart';
import 'package:kavachApp/app/widgets/presence_tile.dart';
import 'package:kavachApp/app/controllers/page_index_controller.dart';
// import 'package:kavachApp/app/widgets/toast/custom_toast.dart';
// import 'package:kavachApp/company_data.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  Map<String, dynamic> user = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      extendBody: true,
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.streamUser(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  user = snapshot.data!.data()! as Map<String, dynamic>;
                }
                return ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
                  children: [
                    const SizedBox(height: 16),
                    // Section 1 - Welcome Back
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          ClipOval(
                            child: Container(
                              width: 42,
                              height: 42,
                              child: GestureDetector(
                                onTap: () => controller.changePage(2),
                                child: Image.network(
                                  (user["avatar"] == null ||
                                          user['avatar'] == "")
                                      ? "https://ui-avatars.com/api/?name=${user['name']}/"
                                      : user['avatar'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back!",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.secondarySoft,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 4),
                              Text(
                                user["name"],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // section 2 -  card
                    StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream: controller.streamTodayPresence(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(child: CircularProgressIndicator());
                            case ConnectionState.active:
                            case ConnectionState.done:
                              var todayPresenceData = snapshot.data?.data();
                              return PresenceCard(
                                userData: user,
                                todayPresenceData: todayPresenceData,
                              );
                            default:
                              return SizedBox();
                          }
                        }),
                    // last location
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 24, left: 4),
                      child: Text(
                        (user["address"] != null)
                            ? "${user['address']}"
                            : "DEFAULT LOCATION",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColor.secondarySoft,
                        ),
                      ),
                    ),
                    // section 3 distance & map
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 84,
                              decoration: BoxDecoration(
                                color: Colors.teal[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 6),
                                    child: Text(
                                      'Distance from Posting',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      '${controller.officeDistance.value}',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: GestureDetector(
                              onTap: controller.launchOfficeOnMap,
                              child: Container(
                                height: 84,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/map.JPG'),
                                    fit: BoxFit.cover,
                                    opacity: 0.3,
                                  ),
                                ),
                                child: Text(
                                  'Open in maps',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Section 4 - Presence History
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Presence History",
                            style: TextStyle(
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.toNamed(Routes.ALL_PRESENCE),
                            child: Text("show all"),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColor.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: controller.streamLastPresence(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(child: CircularProgressIndicator());
                            case ConnectionState.active:
                            case ConnectionState.done:
                              List<QueryDocumentSnapshot<Map<String, dynamic>>>
                                  listPresence = snapshot.data!.docs;
                              return ListView.separated(
                                itemCount: listPresence.length,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.zero,
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 16),
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> presenceData =
                                      listPresence[index].data();
                                  return PresenceTile(
                                    presenceData: presenceData,
                                  );
                                },
                              );
                            default:
                              return SizedBox();
                          }
                        }),
                  ],
                );
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                return Center(child: Text("Error"));
            }
          }),
    );
  }
}
