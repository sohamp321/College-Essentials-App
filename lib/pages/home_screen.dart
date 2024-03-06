import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? dropDownValue;
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: 
      Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: DropdownButton<String>(
                  padding: EdgeInsets.only(left:   10),
                  itemHeight:   50,
                  value: dropDownValue,
                  hint: Text("Select the person"),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue;
                    });
                  },
                  items: <String>['Drishti', 'Soham']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ),
              if (dropDownValue == 'Drishti') ...[
                Padding(padding: EdgeInsets.all(20)),
                Center(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('images/drishti_qr.png'),
                        height:   400,
                        width:   400,
                      ),
                      MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor:  1),child: Text("Please scan your QR !!" , style: TextStyle(fontSize:  25 , color: Colors.purple[500] , fontWeight: FontWeight.bold),))
                    ],
                  ),
                ),
              ],
              if (dropDownValue == 'Soham') ...[
                Padding(padding: EdgeInsets.all(20)),
                Center(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('images/soham_qr.jpeg'), // Replace with the correct image path for Soham
                        height:   400,
                        width:   400,
                      ),
                      MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor:  1),child: Text("Please scan your QR !!" , style: TextStyle(fontSize:  25 , color: Colors.purple[500] , fontWeight: FontWeight.bold),))
                    ],
                  ),
                ),
              ]
            ],
          ),
    );
  }
}