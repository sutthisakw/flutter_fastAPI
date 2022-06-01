import 'package:flutter/material.dart';
import 'package:flutter_workshop/networks/inventoryAPI.dart';
import 'package:flutter_workshop/models/stock.dart';

class StockList extends StatefulWidget {
  const StockList({Key? key}) : super(key: key);

  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  InventoryAPI inventoryAPI = InventoryAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: inventoryAPI.getAll(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Stock?>? stocks = snapshot.data;
              return ListView.builder(
                  itemCount: stocks!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/editform',
                        arguments: stocks[index]).then((value){
                          setState(() {
                            
                          });
                        });
                      },
                      title: Text('${stocks[index]!.description}'),
                      subtitle: Text('stock ${stocks[index]!.stock}'),
                    );
                  });
            }
            // ถ้า snapshot ยัง get ข้อมูลมาไม่เสร็จ จะแสดง process ข้อมูลหมุนๆ
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      // Container(
      //   child: ElevatedButton(onPressed: fetchdata, child: Text('test api')),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ใช้ .then((value)) และ setState ใหม่ เมื่อกดปุ่ม back
          Navigator.pushNamed(context, '/addform').then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // ทดสอบฟังก์ชัน fetch ข้อมูล inventory มาดูหลังจากกดปุ่ม
  fetchdata() async {
    await inventoryAPI.getAll();
  }
}
