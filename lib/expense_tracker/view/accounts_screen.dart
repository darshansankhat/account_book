import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../controller/expence_controller.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  ExpenseController controller = Get.put(ExpenseController());

  @override
  void initState() {
    super.initState();
    controller.LoadDB();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo, width: 2),
                  ),
                  label: Text(
                    "Search Customers...",
                    style: TextStyle(fontSize: 18),
                  )),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer("All Accounts"),
                buildContainer("With Balance"),
                buildContainer("Zero Balance"),
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed("accountsinfo", arguments: index);
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${controller.dataList[index]['name']}",
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                                Text(
                                  "${controller.dataList[index]['location']}",
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Divider()
                        ],
                      ),
                    );
                  },
                  itemCount: controller.dataList.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildContainer(String data) {
    return Container(
      height: 5.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black12,
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          "$data",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
