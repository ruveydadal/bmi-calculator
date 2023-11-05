import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  double total = 0;
  String result = "";

  void calculation() {
    final weight = (double.parse(_controller1.text));
    final height = (double.parse(_controller2.text));
    final bmi = (weight / (height * height));
    final bmi_result;
    switch (bmi) {
      case < 18.5:
        bmi_result = "Below ideal weight";
        break;
      case < 24.9:
        bmi_result = "ideal weight";
        break;
      case < 29.9:
        bmi_result = "Above ideal weight";
        break;
      case < 39.9:
        bmi_result = "Above ideal weight (Obese)";
      default:
        bmi_result = "Invalid";
    }

    setState(() {
      total = bmi;
      result = bmi_result;
    });
  }

  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.notes, size: 30, color: Colors.white),
        toolbarHeight: 30,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100))),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Body Mass Index",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text("Calculator",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Colors.white)),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                inputForm(
                  title: "FullName:",
                  hinttext: "e.g. Jack Pencil",
                ),
                inputForm(
                  title: "Body Weight (kg):",
                  controller: _controller1,
                  hinttext: "e.g. 58",
                ),
                inputForm(
                  title: "Height Length (m):",
                  controller: _controller2,
                  hinttext: "e.g. 1.59",
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    calculation();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "CALCULATE",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                total != null
                    ? Column(
                        children: [
                          Text("Result : " + result,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 20)),
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                                "Total : " + total.toStringAsFixed(2) + "kg/m²",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 20)),
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget inputForm(
      {required String title,
      TextEditingController? controller,
      required String hinttext}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hinttext),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
