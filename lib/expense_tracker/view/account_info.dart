import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/expence_controller.dart';
import '../utils/db_helper.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  ExpenseController controller = Get.put(ExpenseController());

  @override
  void initState() {
    super.initState();
    controller.LoadDB();
  }

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade600,
        leading: Text(""),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("addAccounts",arguments: {"index":index,"status":0});
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                  title: "Delete Item",
                  content: Text(
                    "Are you sure want to\nDelete Item?",
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    Row(
                      children: [
                        ElevatedButton(onPressed: () {
                          Get.back();
                        }, child: Text("Cancel")),
                        ElevatedButton(onPressed: () {
                          int selid = controller.dataList[index]['id'];
                          DB_Helper.db_helper.deleteDB(selid);
                          controller.LoadDB();
                          Get.back();
                          Get.back();
                        }, child: Text("Delete"))
                      ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    )
                  ]);
            },
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => Container(
              height: 15.h,
              width: 100.w,
              color: Colors.cyan.shade600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Name : ${controller.dataList[index]['name']}",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "Location : ${controller.dataList[index]['location']}",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "Contact : ${controller.dataList[index]['contact']}",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "Other Reference id : ${controller.dataList[index]['reference_id']}",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed("entry",arguments: index);
      },child: Icon(Icons.add),),
    );
  }
}
