import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Calculator(),
));

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: Calculation(),
    );
  }
}

class Calculation extends StatefulWidget {
  const Calculation({super.key});

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  String input = "0";
  String output = "";
  String operator = "";
  double valueInput = 0;
  double valueOutput = 0;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "=") {
        if (operator.isNotEmpty) {
          double inputValue = double.parse(input);

          if (operator == "+") {
            valueOutput += inputValue;
          } else if (operator == "-") {
            valueOutput -= inputValue;
          } else if (operator == "*") {
            valueOutput *= inputValue;
          } else if (operator == "/") {
            if (inputValue != 0) {
              valueOutput /= inputValue;
            }
          } else {
            valueOutput = inputValue;
          }

          output = valueOutput.toString();
          input = "0";
          operator = "";
        }
      } else if (buttonText == "AC") {
        input = "0";
        output = "";
        operator = "";
        valueInput = 0;
        valueOutput = 0;
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        if (operator.isNotEmpty) {
          double inputValue = double.parse(input);
          valueOutput = inputValue;
        }

        operator = buttonText;
        valueInput = double.parse(input);
        input = "0";
      } else {
        if (input == "0") {
          input = buttonText;
        } else {
          input += buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adeesh's Calculator"),
        backgroundColor: Colors.red[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(18.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                input + "           |           " + output,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(height: 5.0, thickness: 4, color: Colors.lightGreen),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("7"),
                      child: Text("7"),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("8"),
                      child: Text("8"),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("9"),
                      child: Text("9"),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 135,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("*"),
                      child: Text("*"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("4"),
                      child: Text("4"),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("5"),
                      child: Text("5"),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("6"),
                      child: Text("6"),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 135,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("/"),
                      child: Text("/"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 300,

                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("1"),
                      child: Text("1"),
                    ),

                  ),

                  SizedBox(
                    height: 100,
                    width: 300,

                    child:  ElevatedButton(
                      onPressed: () => _onButtonPressed("2"),
                      child: Text("2"),
                    ),

                  ),

                  SizedBox(
                    height: 100,
                    width: 300,
                    child:  ElevatedButton(
                      onPressed: () => _onButtonPressed("3"),
                      child: Text("3"),
                    ),
                  ),


                  SizedBox(
                    height: 100,
                    width: 135,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("+"),
                      child: Text("+"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("0"),
                      child: Text("0"),
                    ),

                  ),

                  SizedBox(
                    height: 100,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("-"),
                      child: Text("-"),
                    ),


                  ),

                  SizedBox(
                    height: 100,
                    width: 300,

                    child:  ElevatedButton(
                      onPressed: () => _onButtonPressed("="),
                      child: Text("="),
                    ),

                  ),



                  SizedBox(
                    height: 100,
                    width: 135,
                    child: ElevatedButton(
                      onPressed: () => _onButtonPressed("AC"),
                      child: Text("AC"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
