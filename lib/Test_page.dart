import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _Test_pageState();
}

class _Test_pageState extends State<TestPage> {
  String currentNumber = "0";

  Widget buildButton(String label,Color color, {required VoidCallback onPressed}) {
    return Expanded(
      flex: label == "0" ? 3 : 1,
      child: Container(
        margin: const EdgeInsets.all(6),
        child: Ink(
          decoration: BoxDecoration(
            color: color
          ),
          child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildButtonwh(String label,Color color, {required VoidCallback onPressed}) {
    return Expanded(
      flex: label == "0" ? 3 : 1,
      child: Container(
        margin: const EdgeInsets.all(6),
        child: Ink(
          decoration: BoxDecoration(
            color: color
          ),
          child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35.0,
                  color: Color.fromARGB(255, 255, 255, 255)
                ),
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
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                currentNumber,
                style: TextStyle(
                  fontSize: 65.0,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildButton("C",Color.fromRGBO(238, 238, 238, 1), onPressed: () => clear()),
                  buildButton(
                    "⌫",
                    Color.fromRGBO(238, 238, 238, 1),
                    onPressed: () => delete(),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildButton("7",Color.fromRGBO(106, 191, 216, 1), onPressed: () => update("7")),
                  buildButton("8", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("8")),
                  buildButton("9", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("9")),
                  buildButton(
                    "÷",
                    Color.fromRGBO(238, 238, 238, 1),
                    onPressed: () => updateop("÷"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildButton("4", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("4")),
                  buildButton("5", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("5")),
                  buildButton("6", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("6")),
                  buildButton(
                    "×",
                    Color.fromRGBO(238, 238, 238, 1),
                    onPressed: () => updateop("×"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildButton("1", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("1")),
                  buildButton("2", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("2")),
                  buildButton("3", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("3")),
                  buildButton(
                    "-",
                    Color.fromRGBO(238, 238, 238, 1),
                    onPressed: () => updateop("-"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildButton("0", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("0")),
                  buildButton(
                    "+",
                    Color.fromRGBO(238, 238, 238, 1),
                    onPressed: () => updateop("+"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildButtonwh(
                      "=",
                      Color.fromRGBO(0, 152, 198, 1),
                      onPressed: () => clear(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void update(String digit) {
    setState(() {
      if (currentNumber != "0") {
        currentNumber = currentNumber + digit;
      } else {
        currentNumber = digit;
      }
    });
  }

void updateop(String digit) {
  setState(() {
    if(currentNumber== "0"){

    } else if (currentNumber.endsWith("+") ||
        currentNumber.endsWith("×") ||
        currentNumber.endsWith("÷") ||
        currentNumber.endsWith("-")) {
      // ถ้าตัวเลขปัจจุบันลงท้ายด้วยเครื่องหมายทางคณิตศาสตร์ เปลี่ยนเครื่องหมาย
      currentNumber = currentNumber.substring(0, currentNumber.length - 1) + digit;
    } else if (currentNumber.endsWith(digit)) {
      // ถ้าตัวเลขปัจจุบันลงท้ายด้วยเครื่องหมายที่กำลังกด เราจะเปลี่ยนเครื่องหมาย
      currentNumber = currentNumber.substring(0, currentNumber.length - 1) + digit;
    } else if (!"+-×÷".contains(currentNumber.substring(currentNumber.length - 1))) {
      // ถ้าตัวเลขปัจจุบันไม่ลงท้ายด้วยเครื่องหมายทางคณิตศาสตร์ เพิ่มเครื่องหมายใหม่
      currentNumber += digit;
    }    
  });
}


  void clear() {
    setState(() {
      currentNumber = "0";
    });
  }

  void delete() {
    setState(() {
      if (currentNumber.length > 1) {
        currentNumber = currentNumber.substring(0, currentNumber.length - 1);
      } else {
        currentNumber = "0";
      }
    });
  }
}
