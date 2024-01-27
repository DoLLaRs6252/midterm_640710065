import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _Test_pageState();
}

class _Test_pageState extends State<TestPage> {
  String currentNumber = "0";

  Widget buildNumberButton(String label, {required VoidCallback onPressed}) {
    return Expanded(
      flex: label == "0" ? 3 : 1, 
      child: Container(
        margin: const EdgeInsets.all(6),
        child: Ink(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 230, 200, 118),
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

  Widget buildOperationButton(String label, {required VoidCallback onPressed}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        child: Ink(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 230, 200, 118),

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
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildNumberButton("C", onPressed: () => clear()),
                  buildNumberButton(
                    "⌫",
                    onPressed: () => delete(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildNumberButton("7", onPressed: () => update("7")),
                  buildNumberButton("8", onPressed: () => update("8")),
                  buildNumberButton("9", onPressed: () => update("9")),
                  buildOperationButton(
                    "÷",
                    onPressed: () => updateop("÷"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildNumberButton("4", onPressed: () => update("4")),
                  buildNumberButton("5", onPressed: () => update("5")),
                  buildNumberButton("6", onPressed: () => update("6")),
                  buildOperationButton(
                    "×",
                    onPressed: () => updateop("×"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildNumberButton("1", onPressed: () => update("1")),
                  buildNumberButton("2", onPressed: () => update("2")),
                  buildNumberButton("3", onPressed: () => update("3")),
                  buildOperationButton(
                    "-",
                    onPressed: () => updateop("-"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildNumberButton("0", onPressed: () => update("0")),
                  buildOperationButton(
                    "+",
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
