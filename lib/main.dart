import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<MyHomePage> {
  var isCheckd = false;
  var sex = 'Male';
  var isOn=false;
  final globekey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CheckBox")),
      body: Center(
        child: Column(
          children: [
            Center(
                child: Checkbox(
              value: isCheckd,
              checkColor: Colors.white,
              activeColor: Colors.yellow,
              onChanged: (val) {
                setState(() {
                  if (val != null) {
                    isCheckd = val;
                  }
                });
              },
            )),
            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Radio(


                      value: 'Male',
                      groupValue: sex,
                      onChanged: (String? val) {
                        if (val != null) {
                          setState(() {
                            sex = val;
                          });
                        }
                      }),
                   Text("Male"),
                ],
              ),
            ),
            RadioListTile(
                 title: Text("FeMale"),
                subtitle: Text("Choose your Sex"),
                value: 'FeMale',
                groupValue: sex,
                onChanged: (String? val) {
                  if (val != null) {
                    setState(() {
                      sex = val;
                    });
                  }
                }),
            Switch(
              value: isOn,
              onChanged: (bool? val){
                if(val!=null)
                  {
                    setState(() {
                      isOn=val;
                    });
                  }
              }
            ),
            Form(
              key:globekey ,
              child: TextFormField(
                validator: (value)
                {
                  if(value==null || value.isEmpty)
                    {
                      return 'Please enter some text';
                    }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: (){
                globekey.currentState?.validate();
              },
              child: Text("Validate"),
            )
          ],
        ),
      ),
    );
  }
}
