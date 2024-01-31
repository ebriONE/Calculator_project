import 'package:flutter/material.dart';

void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return MaterialApp(
   home: CalculatorApp(),
   theme: ThemeData(
    scaffoldBackgroundColor: Colors.black,
   ),
  );
 }
}

class CalculatorApp extends StatefulWidget {
 @override
 _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
 TextEditingController num1Controller = TextEditingController();
 TextEditingController num2Controller = TextEditingController();
 dynamic result = 0;

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   appBar: AppBar(
    title: Text('Simple Calculator'),
    backgroundColor: Colors.grey,
   ),
   body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
      TextField(
       controller: num1Controller,
       keyboardType: TextInputType.number,
       decoration: InputDecoration(
        labelText: 'Enter number 1:',
        focusedBorder: OutlineInputBorder(
         borderSide: BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.grey,
       ),
      ),
      SizedBox(height: 16),
      TextField(
       controller: num2Controller,
       keyboardType: TextInputType.number,
       decoration: InputDecoration(
        labelText: 'Enter number 2:',
        focusedBorder: OutlineInputBorder(
         borderSide: BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.grey,
       ),
      ),
      SizedBox(height: 16),
      Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
        ElevatedButton(
         onPressed: () {
          calculateResult('+');
         },
         child: Text('+'),
        ),
        ElevatedButton(
         onPressed: () {
          calculateResult('-');
         },
         child: Text('-'),
        ),
        ElevatedButton(
         onPressed: () {
          calculateResult('*');
         },
         child: Text('*'),
        ),
        ElevatedButton(
         onPressed: () {
          calculateResult('/');
         },
         child: Text('/'),
        ),
       ],
      ),
      SizedBox(height: 16),
      Text(
       'Result: $result',
       style: TextStyle(color: Colors.red), // Set text color for result
      ),
     ],
    ),
   ),
  );
 }

 void calculateResult(String operator) {
  double num1 = double.tryParse(num1Controller.text) ?? 0;
  double num2 = double.tryParse(num2Controller.text) ?? 0;

  setState(() {
   switch (operator) {
    case '+':
     result = num1 + num2;
     break;
    case '-':
     result = num1 - num2;
     break;
    case '*':
     result = num1 * num2;
     break;
    case '/':
     if (num2 != 0) {
      result = num1 / num2;
     } else {
      result = "You try to divide by zero"; // Handle division by zero
     }
     break;
   }
  });
 }
}
