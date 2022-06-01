import 'package:flutter/material.dart';
import 'package:flutter_workshop/components/stockFrom.dart';
import 'package:flutter_workshop/models/stock.dart';
import 'package:flutter_workshop/networks/inventoryAPI.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  Stock stock = Stock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Inventory'),
      ),
      body: StockForm(
        stock: stock,
        submit: submit,
      ),
    );
  }

  submit(Stock stock) async {
    InventoryAPI inventoryAPI = InventoryAPI();
    Stock? res = await inventoryAPI.createStock(stock: stock);
    if (res == null) {
      print('Something error');
    } else {
      print(res.id);
    }
    Navigator.pop(context);
  }
}
