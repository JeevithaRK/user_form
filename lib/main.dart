import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

void main() {
  runApp(const FormScreen());
}

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Form',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'User Form'),
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

  String content =
      "I hereby authorise Pine Labs to collect and share my data and documents with Protium, for the purpose of processing of my loan application and to conduct credit checks, references, make enquiries at its sole discretion. I further authorise Pine Labs / Lender and its agents to share and obtain information, records from any Credit Rating Agencies, Databanks, Government / Statutory / Regulatory Authorities, bank, financial institutions, or any third party to verify my credit worthiness in connection with this Loan request or in case Lender requires to conduct additional / further checks to assess my eligibility for sanction of further limits in facility in the future and ongoing review";
  String content2 =
      "I/You hereby consent to Pinelabs being appointed as my/your authorised representative to receive your Credit Information on an ongoing basis for the purpose of offering financial services  up to 6 months from the date the consent is collected, I also agree with Experian Terms and Conditions.";

  TextEditingController _date = TextEditingController();
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
                  const SizedBox(
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
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    key: Key('pan'),
                    validator: (pan) {
                      // if (pan!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(pan!)) {
                      //   return 'Please enter correct PAN number';
                      // } else {
                      //   return null;
                      // }
                    },
                    decoration:
                        InputDecoration(labelText: "Business PAN Number"),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    key: Key('fname'),
                    validator: (fname) {
                      // if (fname!.isEmpty ||
                      //     !RegExp(r'^[a-z A-Z]+$').hasMatch(fname!)) {
                      //   return 'Please enter correct name';
                      // } else {
                      //   return null;
                      // }
                    },
                    decoration: InputDecoration(labelText: "First Name"),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    key: Key('lname'),
                    validator: (lname) {
                      // if (lname!.isEmpty ||
                      //     !RegExp(r'^[a-z A-Z]+$').hasMatch(lname!)) {
                      //   return 'Please enter correct name';
                      // } else {
                      //   return null;
                      // }
                    },
                    decoration: InputDecoration(labelText: "Last Name"),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    key: Key('email'),
                    validator: (email) {
                      // if (email!.isEmpty ||
                      //     !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                      //         .hasMatch(email!)) {
                      //   return 'Please enter correct email ID';
                      // } else {
                      //   return null;
                      // }
                    },
                    decoration: InputDecoration(labelText: "Email ID"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Gender"),
                  Row(
                    children: <Widget>[
                      Radio(
                        key: Key('radiobutton1'),
                        value: 1,
                        groupValue: _value,
                        activeColor: Color(0xFF50D387),
                        onChanged: (value) {
                          // setState(() {
                          //   _value = value as int;
                          // });
                        },
                      ),
                      Text("Male"),
                      SizedBox(width: 20),
                      Radio(
                        key: Key('radiobutton2'),
                        value: 2,
                        groupValue: _value,
                        activeColor: Color(0xFF50D387),
                        onChanged: (value) {
                          // setState(() {
                          //   _value = value as int;
                          // });
                        },
                      ),
                      Text("Female"),
                    ],
                  ),
                  TextFormField(
                    key: Key('Date and Icon'),
                    controller: _date,
                    decoration: InputDecoration(
                      labelText: "Date",
                      icon: Icon(Icons.calendar_today_outlined),
                    ),
                    // onTap: () async {
                    //   DateTime? pickeddate = await showDatePicker(
                    //       context: context,
                    //       initialDate: DateTime.now(),
                    //       firstDate: DateTime(2022),
                    //       lastDate: DateTime(2100));
                    //   if (pickeddate != null) {
                    //     setState(() {
                    //       _date.text =
                    //           DateFormat('dd-MM-yyyy').format(pickeddate);
                    //     });
                    //   }
                    // },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Checkbox(
                      checkColor: Color(0xFF50D387),
                      value: isChecked,
                      onChanged: (value) {
                        // setState(() {
                        //   if (value != null) isChecked = value;
                        // });
                      },
                    ),
                    title: ReadMoreText(
                      content,
                      key: Key('ReadMore1'),
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
                      onChanged: (value) {
                        // setState(() {
                        //   isChecked = value as bool;
                        // });
                      },
                    ),
                    title: ReadMoreText(
                      content2,
                      key: Key('ReadMore2'),
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
                      key: Key('Button'),
                      onPressed: () {
                        // if (formKey.currentState!.validate()) {
                        //   final snackBar =
                        //       SnackBar(content: Text('Submitting form'));
                        //   _scaffoldKey.currentState!.showSnackBar(snackBar);
                        // }
                      },
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
