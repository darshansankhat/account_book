import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../controller/expence_controller.dart';
import '../model/expence_model.dart';
import '../utils/db_helper.dart';

class AddAccountsScreen extends StatefulWidget {
  const AddAccountsScreen({Key? key}) : super(key: key);

  @override
  State<AddAccountsScreen> createState() => _AddAccountsScreenState();
}

class _AddAccountsScreenState extends State<AddAccountsScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtLocation = TextEditingController();
  TextEditingController txtContact = TextEditingController();
  TextEditingController txtReferenceId = TextEditingController();

  ExpenseController controller = Get.put(ExpenseController());

  Map m1 = Get.arguments;

int? index;
  @override
  void initState() {
    super.initState();

    index= m1['index'];


    if (m1['status'] == 0) {
      txtName =
          TextEditingController(text: "${controller.dataList[m1['index']]['name']}");
      txtLocation = TextEditingController(
          text: "${controller.dataList[m1['index']]['location']}");
      txtContact = TextEditingController(
          text: "${controller.dataList[m1['index']]['contact']}");
      txtReferenceId = TextEditingController(
          text: "${controller.dataList[m1['index']]['reference_id']}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan.shade800,
          leading: Text(""),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.perm_contact_calendar_outlined,
                  color: Colors.white38,
                  size: 30,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              buildTextFormField("Name", txtName),
              SizedBox(
                height: 1.h,
              ),
              buildTextFormField("Location", txtLocation),
              SizedBox(
                height: 1.h,
              ),
              buildTextFormField("Contact (Optional)", txtContact),
              SizedBox(
                height: 1.h,
              ),
              buildTextFormField("Reference Id (Optional)", txtReferenceId),
              SizedBox(
                height: 10.h,
              ),
              m1['status']==0? ElevatedButton(
                onPressed: () {
                  UserModel m1 = UserModel(
                    id: "${controller.dataList[index!]['id']}",
                    name: txtName.text,
                    contact: txtContact.text,
                    location: txtLocation.text,
                    reference_id: txtReferenceId.text,
                  );
                  DB_Helper.db_helper.updateDB(m1);
                  controller.LoadDB();
                  Get.back();
                },
                child: Text("UPDATE ACCOUNT"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ) :ElevatedButton(
                onPressed: () {
                  UserModel m1 = UserModel(
                    name: txtName.text,
                    contact: txtContact.text,
                    location: txtLocation.text,
                    reference_id: txtReferenceId.text,
                  );
                  DB_Helper.db_helper.insertDB(m1);
                  controller.LoadDB();
                  Get.back();
                },
                child: Text("ADD ACCOUNT"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(String label, c1) {
    return TextFormField(
      controller: c1,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.indigo, width: 2),
        ),
        focusColor: Colors.indigo,
        label: Text(
          "$label",
          style: TextStyle(color: Colors.indigo),
        ),
      ),
    );
  }
}
