import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kavachApp/app/style/app_color.dart';
import 'package:kavachApp/app/widgets/custom_input.dart';

import '../controllers/add_employee_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Officer',
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
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        children: [
          CustomInput(
            controller: controller.idC,
            label: 'Officer ID',
            hint: '21BAI1323',
          ),
          CustomInput(
            controller: controller.nameC,
            label: 'Full Name',
            hint: 'John Doe',
          ),
          CustomInput(
            controller: controller.emailC,
            label: 'Email',
            hint: 'officeremail@email.com',
          ),
          CustomInput(
            controller: controller.jobC,
            label: 'Position',
            hint: 'Oficer Position',
          ),
          SizedBox(height: 8),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => ElevatedButton(
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    controller.addEmployee();
                  }
                },
                child: Text(
                  (controller.isLoading.isFalse) ? 'Add Officer' : 'Loading...',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[400],
                  padding: EdgeInsets.symmetric(vertical: 18),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
