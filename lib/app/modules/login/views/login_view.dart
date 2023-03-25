import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kavachApp/app/routes/app_pages.dart';
import 'package:kavachApp/app/style/app_color.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SURAKSHA",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontFamily: 'poppins',
                          height: 150 / 100,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("an initiative by Bro-Code")],
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 35 / 100,
            width: MediaQuery.of(context).size.width,
            //padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              //gradient: AppColor.primaryGradient,
              color: Colors.teal[400],
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/abstract-pattern-design_1053-534.avif'),
                fit: BoxFit.cover,
              ),
            ),
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     SizedBox(
            //       child: Text(
            //         "Suraksha",
            //         style: TextStyle(
            //           fontSize: 50,
            //           color: Colors.black,
            //           fontFamily: 'poppins',
            //           height: 150 / 100,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ),
            //     SizedBox(height: 10),
            //     Text(
            //       "an inititative by Bro-Code",
            //       style: TextStyle(color: Colors.black),
            //     ),
            //   ],
            // ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 65 / 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[100],
            padding: EdgeInsets.only(left: 20, right: 20, top: 36, bottom: 84),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
                    maxLines: 1,
                    controller: controller.emailC,
                    decoration: InputDecoration(
                      label: Text(
                        "Email",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 14,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "example@domain.com",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                ),
                Material(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                    margin: EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 1, color: AppColor.secondaryExtraSoft),
                    ),
                    child: Obx(
                      () => TextField(
                        style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
                        maxLines: 1,
                        controller: controller.passC,
                        obscureText: controller.obsecureText.value,
                        decoration: InputDecoration(
                          label: Text(
                            "Password",
                            style: TextStyle(
                              color: AppColor.secondarySoft,
                              fontSize: 14,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                          hintText: "********",
                          suffixIcon: IconButton(
                            icon: (controller.obsecureText != false)
                                ? SvgPicture.asset('assets/icons/hide.svg')
                                : SvgPicture.asset('assets/icons/show.svg'),
                            onPressed: () {
                              controller.obsecureText.value =
                                  !(controller.obsecureText.value);
                            },
                          ),
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            color: AppColor.secondarySoft,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.isLoading.isFalse) {
                          await controller.login();
                        }
                      },
                      child: Text(
                        (controller.isLoading.isFalse)
                            ? 'Log in'
                            : 'Loading...',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: Colors.teal[400],
                        elevation: 0,
                        primary: AppColor.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 4),
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                    child: Text("Forgot your password?"),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColor.secondarySoft,
                    ),
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
