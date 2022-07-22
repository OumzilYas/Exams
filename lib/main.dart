import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String Q = '';
  String Q1 = '';
  String Q2 = '';
  String Q0 = '';
  var rotation,angle,length,height,grove,question,boomAngle;

  String getData(String question){
    var list = ['1','2'];

    final _random = new Random();
    var element = list[_random.nextInt(list.length)];
    if(question=='Boom Angle')
    {
      return element=='1'? 'Boom top height':'Boom length' ;
    }
    else if  (question=='Boom top height'){
      return element=='1'? 'Boom Angle':'Boom length' ;

    }
    else if  (question=='Boom length'){
      return 'Boom top height';
    }
    else if  (question=='Radius'){
      return element=='1'? 'Boom top height':'Boom length' ;

    }
    else {
      return element=='1'? 'Boom Angle':'Boom length' ;

    }
  }
  String getData2(String question){
    var list = ['1','2'];

    final _random = new Random();
    var element = list[_random.nextInt(list.length)];
    if(question=='Radius'){
      return element=='1'? 'Boom Angle':'Angle' ;
    }
    else
      {
        return 'Radius';
      }
  }
  String takeValue(String data){
    var list = ['1','2'];
    var rotations  = ['4','6','8','10','12','14','16','18','20','22','24','26','28','30','32','34','36','38','40','42','44'];
    var angles  = ['0','10','20','30','40','50','60','70'];
    var lengths  = ['10.6','12.2','15.2','18.2','21.3','22.4','27.4','30.5','33.5','9.7'];
    var heights  = ['0','2','4','6','8','10','12','14','16','18','20','22','24','26','28','30','32','34','36','38','40','42','44','46','48','50','52','54','56','58'];
    var boomAngles  = ['0','15','30'];
    final _random = new Random();

    if(data=='Boom angle'){
      boomAngle = boomAngles[_random.nextInt(boomAngles.length)];
      return boomAngle.toString()+' °';
    }
    else if  (data=='Boom top height'){

      height = heights[_random.nextInt(heights.length)];
      return height.toString()+' M';

    }
    else if  (data=='Boom length'){

      length = lengths[_random.nextInt(lengths.length)];
      return length.toString()+' M';
    }
    else if  (data=='Radius'){
      rotation = rotations[_random.nextInt(rotations.length)];
      return rotation + 'M' ;



    }
    else if (data=="Angle"){
      angle = angles[_random.nextInt(angles.length)];
      return angle.toString()+' °';

    }
    return data;
  }

  // ignore: prefer_typing_uninitialized_variables
  List exam = [];
  void _incrementCounter() {
    setState(() {
      exam.clear();
     var groves  = ['AT 750B','RT 755','TM 1150',];
      var questions  = ['Boom angle','Boom top height','Boom length','Radius','the Hock Elevation'];


      for (var i = 0; i<20; i++) {
        final _random = new Random();

        grove = groves[_random.nextInt(groves.length)];
        question = questions[_random.nextInt(questions.length)];
        Q=grove.toString();
        String form2 = getData2(question.toString());
        String form = getData(question.toString());
        Q0= form2+'= '+takeValue(form2);
        Q1=form+' = '+takeValue(form);
        Q2='What is the '+question.toString()+'?';
        exam.add([Q,Q0,Q1,Q2]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(

      body:  Center(
        child: SizedBox(
          height: h,
          width: w*.7,
          child: ListView.builder(
            itemCount: exam.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  width: w*.9,
                  height: h*.23,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 4)
                  ),
                  child: Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (index+1).toString()+'. Using the grove(',
                                style: GoogleFonts.mukta(
                                    textStyle: Theme.of(context).textTheme.headline4,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                ),
                              ),
                              Text(
                                exam[index][0].toString(),
                                style: GoogleFonts.mukta(
                                    textStyle: Theme.of(context).textTheme.headline4,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                              Text(
                                ') Range Diagram.',
                                style: GoogleFonts.mukta(
                                    textStyle: Theme.of(context).textTheme.headline4,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                exam[index][1].toString(),
                                style: GoogleFonts.mukta(
                                    textStyle: Theme.of(context).textTheme.headline4,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.underline,
                                    color: Colors.black
                                ),
                              ),
                              Text(
                                exam[index][2].toString(),
                                style: GoogleFonts.mukta(
                                    textStyle: Theme.of(context).textTheme.headline4,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.underline,
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),
                          Text(
                            exam[index][3].toString(),
                            style: GoogleFonts.mukta(
                                textStyle: Theme.of(context).textTheme.headline4,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
