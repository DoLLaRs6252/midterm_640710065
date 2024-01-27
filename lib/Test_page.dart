import 'package:flutter/material.dart';

class Test_page extends StatelessWidget {
  const Test_page({Key? key}) : super(key: key);

  Widget buildItem({
    required dynamic label,
  }) {
    return Expanded(
      // Expanded สำหรับทำให้ปรับขนาดตามพื้นที่ที่เหลือใน Column
      child: Container(
        margin: const EdgeInsets.all(6),
        child: InkWell(
          child: Container(
            //padding: const EdgeInsets.all(0.5),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 200, 118),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // จัดตำแหน่งของข้อความและไอคอนตรงกลาง
                children: [
                  if (label is String)
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (label is Icon) label,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight, // ชิดขวา
              padding: const EdgeInsets.only(right: 20.0), // เพิ่มระยะห่างข้างขวา
              child: Text(
                "0",
                style: TextStyle(
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildItem(label: "C"), // ส่ง String เข้าไป
                  ),
                  Expanded(
                    child: buildItem(
                        label: Icon(Icons.backspace)), // ส่ง Icon เข้าไป
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildItem(label: "7"),
                  buildItem(label: "8"),
                  buildItem(label: "9"),
                  buildItem(label: "\u00F7"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildItem(label: "4"),
                  buildItem(label: "5"),
                  buildItem(label: "6"),
                  buildItem(label: "\u00D7"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildItem(label: "1"),
                  buildItem(label: "2"),
                  buildItem(label: "3"),
                  buildItem(label: "-"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: buildItem(label: "0"),
                  ),
                  Expanded(
                    flex: 1,
                    child: buildItem(label: "+"),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: buildItem(label: "="),
            )
          ],
        ),
      ),
    );
  }
}
