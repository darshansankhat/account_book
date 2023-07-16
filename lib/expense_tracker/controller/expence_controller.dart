import 'package:get/get.dart';

import '../utils/db_helper.dart';

class ExpenseController extends GetxController
{
  RxList dataList = [].obs;

  Future<void> LoadDB()
  async {
    dataList.value = await DB_Helper.db_helper.redDB();
  }
}