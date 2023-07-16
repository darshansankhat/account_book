import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade50,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //top
                  Text(
                    "Set Up Firm Here",
                    style: TextStyle(fontSize: 18, color: Colors.green.shade900),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "50000/- ",
                        style:
                            TextStyle(fontSize: 35, color: Colors.green.shade900),
                      ),
                      Text(
                        "Cr",
                        style:
                            TextStyle(fontSize: 35, color: Colors.green.shade900),
                      ),
                    ],
                  ),
                  //add
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 28.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green.shade900, width: 3),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // accounts
                          InkWell(
                            onTap: () {
                              Get.toNamed("accounts");
                            },
                            child: Container(
                              height: 11.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.teal.shade600,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.menu_book,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Accounts",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed("addAccounts",arguments: {"index": null,"status":1});
                                },
                                child: buildContainer(
                                    Colors.green, "New Account", Icons.add),
                              ),
                              buildContainer(Colors.purple.shade600, "Summary",
                                  Icons.summarize_outlined),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //explore
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.green.shade900, width: 3)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //name
                          Text(
                            "Explore App",
                            style: TextStyle(fontSize: 18),
                          ),
                          //location groups
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildContainer(
                                  Colors.red, "By Location", Icons.location_on),
                              buildContainer(
                                  Colors.purple.shade600, "Groups", Icons.group),
                            ],
                          ),
                          //daily monthly
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildContainer(Colors.purple.shade600, "Daily View",
                                  Icons.view_day),
                              buildContainer(Colors.green.shade800, "Monthly",
                                  Icons.view_day),
                            ],
                          ),
                          //calculator
                          Container(
                            height: 11.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 3),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.calculate_outlined,
                                    size: 40, color: Colors.black),
                                Text(
                                  "Calculator",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                heroTag: "0",
                onPressed: () {
                },
                child: Icon(
                  Icons.share,
                  color: Colors.blue,
                ),
                backgroundColor: Colors.white,
              ),
              FloatingActionButton(
                heroTag: "1",
                onPressed: () {
                  Get.toNamed("addAccounts",arguments: {"index": null,"status":1});
                },
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(Color c1, String data, IconData i1) {
    return Container(
      height: 9.h,
      width: 43.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: c1, width: 3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            i1,
            color: c1,
          ),
          Text(
            "$data",
            style: TextStyle(fontSize: 18, color: c1),
          ),
        ],
      ),
    );
  }
}
