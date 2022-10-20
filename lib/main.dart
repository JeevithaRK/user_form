import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
//import 'package:user_form/checkbox.dart';

void main() {
  runApp(const FormScreen());
}

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Form',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>(); //key for form
  int _value = 1;
  bool? isChecked = false;
  // final notifications = [
  //   CheckboxSetting(title: 'Hi'),
  //   CheckboxSetting(title: 'Hello'),
  // ];
  String content =
      "I hereby authorise Pine Labs to collect and share my data and documents with Protium, for the purpose of processing of my loan application and to conduct credit checks, references, make enquiries at its sole discretion. I further authorise Pine Labs / Lender and its agents to share and obtain information, records from any Credit Rating Agencies, Databanks, Government / Statutory / Regulatory Authorities, bank, financial institutions, or any third party to verify my credit worthiness in connection with this Loan request or in case Lender requires to conduct additional / further checks to assess my eligibility for sanction of further limits in facility in the future and ongoing review";
  String content2 =
      "I/You hereby consent to Pinelabs being appointed as my/your authorised representative to receive your Credit Information on an ongoing basis for the purpose of offering financial services  up to 6 months from the date the consent is collected, I also agree with Experian Terms and Conditions.";
  @override
  Widget build(BuildContext context) {
    //final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: formKey, //key for form
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Let's get started",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: "Business PAN Number"),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "First Name"),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Last Name"),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email ID"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Gender"),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: _value,
                        activeColor: Color(0xFF50D387),
                        onChanged: (value) {
                          setState(() {
                            _value = value as int;
                          });
                        },
                      ),
                      Text("Male"),
                      SizedBox(width: 20),
                      Radio(
                        value: 2,
                        groupValue: _value,
                        activeColor: Color(0xFF50D387),
                        onChanged: (value) {
                          setState(() {
                            _value = value as int;
                          });
                        },
                      ),
                      Text("Female"),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Date",
                      //icon: Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Checkbox(
                      checkColor: Color(0xFF50D387),
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value as bool;
                        });
                      },
                    ),
                    title: ReadMoreText(
                      content,
                      trimLines: 2,
                      textAlign: TextAlign.justify,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "Read More",
                      trimExpandedText: "Read Less",
                      lessStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF50D387),
                      ),
                      moreStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF50D387),
                      ),
                      style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
                    ),
                    contentPadding: EdgeInsets.only(left: 0),
                  ),
                  ListTile(
                    leading: Checkbox(
                      checkColor: Color(0xFF50D387),
                      value: isChecked,
                      tristate: true,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value as bool;
                        });
                      },
                    ),
                    title: ReadMoreText(
                      content2,
                      trimLines: 2,
                      textAlign: TextAlign.justify,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "Read More",
                      trimExpandedText: "Read Less",
                      lessStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF50D387),
                      ),
                      moreStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF50D387),
                      ),
                      style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
                    ),
                    contentPadding: EdgeInsets.only(left: 0),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Continue'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF003323),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(68),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
