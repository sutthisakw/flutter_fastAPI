import 'package:flutter/material.dart';
import 'package:flutter_workshop/pages/stockList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    StockList(),
    Center(
      child: Text('Setting'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: pages[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.inventory,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      'Inventory Stock',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Stock'),
              onTap: () {
                selectIndex(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                selectIndex(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                //เป็นการปิดหน้าทั้งหมดออก ให้เหลือหน้า loginScreen หน้าเดียว
                //ซึ่งหากใช้ .pushNamed จะสามารถกดปุ่ม back กลับไปหน้าก่อน logout ได้
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }
}
