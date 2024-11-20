import 'package:drivado/screens/company_details.dart';
import 'package:drivado/screens/components/appbar.dart';
import 'package:drivado/screens/components/bottombar.dart';
import 'package:drivado/screens/components/compay_card.dart';
import 'package:drivado/screens/components/user_card.dart';
import 'package:drivado/screens/user_details.dart';
import 'package:drivado/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_controller.dart';
import 'components/toggle_swicth.dart';

class UserManage extends StatefulWidget {
  const UserManage({super.key});

  @override
  State<UserManage> createState() => _UserManageState();
}

class _UserManageState extends State<UserManage> {
  var userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await userController.fetchUserData();
      await userController.fetchCompanyData();
    });
  }

  bool userSelected = true;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
        backgroundColor: white,
        bottomNavigationBar: const MobBottom(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: red,
          shape: const CircleBorder(),
          child: Icon(
            Icons.add,
            color: white,
          ),
        ),
        body: Column(
          children: [
            appBar(),
            CustomToggleButton(
              onToggleChanged: (bool value) {
                setState(() {
                  userSelected = value;
                });
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: userSelected
                      ? [
                          ...userController.userList.map((e) => userCard(
                              userTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserDetailsScreen(
                                            userImg: e['avatar'],
                                            userName: e['name'],
                                            userEmail: e['email'],
                                            userPh: e['mobileNumber'],
                                            lan: 'English',
                                            currency: e['currency'],
                                            tub: e['totalUnpaidBooking'],
                                            acl: e['availableLimit'])));
                              },
                              screenWidth: screenWidth,
                              userName: e['name'])),
                        ]
                      : [
                          ...userController.companyList.map((e) => CompanyCard(
                              onCompanyTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CompanyDetailsScreen(
                                              comEmail: e['email'],
                                              comAdd: e['address'],
                                              comGst: e['gst_num'],
                                              comName: e['companyName'],
                                              comPh: e['mobileNumber'],
                                              comWebsite: 'help@drivado.com',
                                              currency: 'USD',
                                              tub: e['totalUnpaidBooking'],
                                              acl: e['availableCreditLimit'],
                                              comImg: e['logo'],
                                            )));
                              },
                              companyName: e['companyName']))
                        ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
