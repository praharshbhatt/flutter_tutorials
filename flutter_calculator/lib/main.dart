import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String strExp = "", strResult = "0.0";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            //Expressions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 28, 12),
                  child: Text(
                    strExp == "" ? "Tap on the keypad to calculate" : strExp,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                ),
              ],
            ),

            //Results
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 12, 82),
                  child: Text(
                    strResult,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.w400, color: Colors.deepPurple),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 8, 62),
                  child: CircleAvatar(
                    backgroundColor: Colors.purple.withAlpha(30),
                    radius: 16,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.deepPurple,
                        size: 16,
                      ),
                      onPressed: () {
                        setState(() {
                          strExp = "";
                          strResult = "";
                        });
                      },
                    ),
                  ),
                )
              ],
            ),

            //Keypad
            getKeypad()
          ],
        ),
      ),
    );
  }

  getKeypad() {
    return Column(
      children: <Widget>[
        //first half of the keypad
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Number pad
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //First row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //7
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          "7",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                      ),
                      onTap: () => updateExp("7"),
                    ),

                    //8
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          "8",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                      ),
                      onTap: () => updateExp("8"),
                    ),

                    //9
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          "9",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                      ),
                      onTap: () => updateExp("9"),
                    ),
                  ],
                ),

                //Second row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //4
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          "4",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                      ),
                      onTap: () => updateExp("4"),
                    ),

                    //5
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          "5",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                      ),
                      onTap: () => updateExp("5"),
                    ),

                    //6
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          "6",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                      ),
                      onTap: () => updateExp("6"),
                    ),
                  ],
                ),

                //Third row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //1
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          "1",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                      ),
                      onTap: () => updateExp("1"),
                    ),

                    //2
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          "2",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                      ),
                      onTap: () => updateExp("2"),
                    ),

                    //3
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          "3",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                      ),
                      onTap: () => updateExp("3"),
                    ),
                  ],
                ),
              ],
            ),

            //Operator pad
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.purple.withAlpha(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //%
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Text(
                        "%",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.deepPurple),
                      ),
                    ),
                    onTap: () => updateExp("/"),
                  ),

                  //X
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Text(
                        "X",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.deepPurple),
                      ),
                    ),
                    onTap: () => updateExp("*"),
                  ),

                  //-
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.deepPurple),
                      ),
                    ),
                    onTap: () => updateExp("-"),
                  ),

                  //+
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.deepPurple),
                      ),
                    ),
                    onTap: () => updateExp("+"),
                  ),
                ],
              ),
            )
          ],
        ),

        //second half
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //.
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  ".",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.grey),
                ),
              ),
              onTap: () => updateExp("."),
            ),

            //0
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  "0",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.grey),
                ),
              ),
              onTap: () => updateExp("0"),
            ),

            //delete
            Padding(
              padding: const EdgeInsets.all(32),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    if (strExp != null && strExp.length > 0) strExp = strExp.substring(0, strExp.length - 1);
                  });
                },
              ),
            ),

            //=
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                color: Colors.deepPurple,
                textColor: Colors.white,
                child: Text(
                  "=",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  //Calculate everything here
                  // Parse expression:
                  Parser p = new Parser();
                  // Bind variables:
                  ContextModel cm = new ContextModel();
                  Expression exp = p.parse(strResult);
                  setState(() {
                    strResult = exp.evaluate(EvaluationType.REAL, cm).toString();
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  updateExp(String strValue) {
    setState(() {
      strExp = strExp + strValue;
    });
  }
}
