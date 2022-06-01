import 'package:flutter/material.dart';
import 'package:flutter_workshop/components/stockFrom.dart';
import 'package:flutter_workshop/models/stock.dart';
import 'package:flutter_workshop/networks/inventoryAPI.dart';

class EditForm extends StatefulWidget {
  const EditForm({Key? key}) : super(key: key);

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  @override
  Widget build(BuildContext context) {
    Stock stock = ModalRoute.of(context)!.settings.arguments as Stock;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Form'),
      ),
      body: Column(
        children: [
          StockForm(submit: submit, stock: stock),
          ListTile(
            title: ElevatedButton(
                onPressed: () {
                  delete(stock.id);
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text('Delete')),
          )
        ],
      ),
    );
  }

  // ฟังก์ชัน submit ตอนแก้ไข
  submit(Stock stock) async {
    InventoryAPI inventoryAPI = InventoryAPI();
    Stock? res = await inventoryAPI.updateStock(stock: stock);
    if (res == null) {
      print('Something error');
    } else {
      Navigator.pop(context);
    }
  }

  //ฟังก์ชัน delete หน้าแก้ไข โดยจะส่ง id ไปให้ปุ่ม delete ด้านบน
  delete(int? id) async {
    InventoryAPI inventoryAPI = InventoryAPI();
    String ? msg = await inventoryAPI.deleteStock(id: id!);
    print(msg);
    Navigator.pop(context);
  }
}
