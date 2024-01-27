import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _Test_pageState();
}

class _Test_pageState extends State<TestPage> {
  String currentNumber = "0";

  Widget buildNumberButton(String label,Color color, {required VoidCallback onPressed}) {
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

  Widget buildOperationButton(String label, Color color,
      {required VoidCallback onPressed}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        child: Ink(
          decoration: BoxDecoration(color: color),
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
                  buildOperationButton("C",Color.fromRGBO(238, 238, 238, 1), onPressed: () => clear()),
                  buildOperationButton(
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
                  buildNumberButton("7",Color.fromRGBO(106, 191, 216, 1), onPressed: () => update("7")),
                  buildNumberButton("8", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("8")),
                  buildNumberButton("9", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("9")),
                  buildOperationButton(
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
                  buildNumberButton("4", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("4")),
                  buildNumberButton("5", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("5")),
                  buildNumberButton("6", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("6")),
                  buildOperationButton(
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
                  buildNumberButton("1", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("1")),
                  buildNumberButton("2", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("2")),
                  buildNumberButton("3", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("3")),
                  buildOperationButton(
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
                  buildNumberButton("0", Color.fromRGBO(106, 191, 216, 1),onPressed: () => update("0")),
                  buildOperationButton(
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
                    child: buildOperationButton(
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
      if (currentNumber.endsWith("+") ||
          currentNumber.endsWith("×") ||
          currentNumber.endsWith("÷") ||
          currentNumber.endsWith("-") ||
          currentNumber == "0") {
      } else {
        currentNumber = currentNumber + digit;
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
