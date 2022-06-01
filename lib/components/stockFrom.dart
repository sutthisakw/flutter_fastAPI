import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/stock.dart';

class StockForm extends StatelessWidget {
  final Function submit;
  final Stock stock;
  const StockForm({Key? key, required this.submit, required this.stock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _formkey = GlobalKey<FormState>();

    return Container(
      child: Form(
          key: _formkey,
          child: Column(
            children: [
              ListTile(
                title: TextFormField(
                  initialValue: stock.description, //เป็นการดึงค่า default มาใส่ในหน้า editForm
                  onSaved: (String? value) {
                    stock.description = value!;
                  },
                  validator: _validateForm,
                  decoration: InputDecoration(
                    hintText: 'ชื่อสินค้า',
                    labelText: 'ชื่อสินค้า',
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  initialValue: stock.price.toString(), //เป็นการดึงค่า default มาใส่ในหน้า editForm
                  onSaved: (String? value) {
                    stock.price = double.parse(value!);
                  },
                  keyboardType: TextInputType.phone,
                  validator: _validateNumber,
                  decoration: InputDecoration(
                    hintText: 'ราคา',
                    labelText: 'ราคา',
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  initialValue: stock.stock.toString(), //เป็นการดึงค่า default มาใส่ในหน้า editForm
                  onSaved: (String? value) {
                    stock.stock = double.parse(value!);
                  },
                  keyboardType: TextInputType.number,
                  validator: _validateNumber,
                  decoration: InputDecoration(
                    hintText: 'จำนวน',
                    labelText: 'จำนวน',
                  ),
                ),
              ),
              ListTile(
                title: ElevatedButton(
                  child: Text('บันทึก'),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      print('${stock.description}\n${stock.price}\n${stock.stock}');
                      submit(stock);
                    }
                  },
                ),
              )
            ],
          )),
    );
  }

  String? _validateForm(String? value) {
    if (value == null || value == '') {
      return 'กรุณากรอกข้อมูลก่อน';
    }
    return null;
  }

  String? _validateNumber(String? value) {
    if (value == null || value == '') {
      return 'กรุณากรอกข้อมูลก่อน';
    }
    // ตรวจสอบว่าถ้าไม่ใช่ค่าตัวเลขแบบ double จะเป็น null และ return error ออกมา
    if (double.tryParse(value) == null) {
      return 'Wrong Number';
    }
    return null;
  }
}
