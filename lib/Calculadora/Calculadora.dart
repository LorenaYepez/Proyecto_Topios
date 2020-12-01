import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

const PrimaryColor = const Color(0xFFC4BFFD);
const SegundoColor = const Color(0xFFA46FB8);

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define la clase State correspondiente. Esta clase contendrá los datos relacionados con
// nuestro formulario.
class _MyCustomFormState extends State<MyCustomForm> {
  // Crea un controlador de texto. Lo usaremos para recuperar el valor actual
  // del TextField!
  final myController = TextEditingController();
  final segController = TextEditingController();
  final resulController = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    myController.dispose();
    segController.dispose();
    resulController.dispose();
    super.dispose();
  }

  void suma() {
    setState(() {
      int num1 = int.parse(myController.text);      
      int num2 = int.parse(segController.text); 
        resulController.text = (num1 + num2).toString();
    });
  }
  
  void resta() {
    setState(() {
      int num1 = int.parse(myController.text);      
      int num2 = int.parse(segController.text); 
        resulController.text = (num1 - num2).toString();
    });
  }
  
  void mul() {
    setState(() {
      //print(int.parse(myController.text) * int.parse(segController.text));
      resulController.text = (int.parse(myController.text) * int.parse(segController.text)).toString();
    }
    );
  }

  void div() {
    setState(() {
      int num1 = int.parse(myController.text);      
      int num2 = int.parse(segController.text);      
      if (num1==0){
        resulController.text='';
      }else{
        resulController.text = (num1/num2).toString();
      }
    });
  }

  void doClear() {
    setState(() {
      myController.text = "0";
      segController.text = "0";
      resulController.text = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('CALCULADORA'),
        backgroundColor: PrimaryColor,
      ),

      body: Padding(
        //padding: const EdgeInsets.all(20.0),
        padding:  const EdgeInsets.all(8.0),

        child: Column(
          children: [
            // The first text field is focused on as soon as the app starts.
            TextField(
              decoration: InputDecoration(
                //labelText: 'Introducir el texto ',
                labelStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.purple[100]),
                border: OutlineInputBorder(),
              ),
            controller: myController,
            ),
            SizedBox(height: 20.0),
            
            // The second text field is focused on when a user taps the
            TextField(
              decoration: InputDecoration(
                //labelText: 'Introducir la clave ',
                labelStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.purple[100]),
                border: OutlineInputBorder(),
              ),
              controller: segController,
            ),
            SizedBox(height: 25.0),
            
            // The tree text field is focused on when a user taps the
            TextField(
              decoration: InputDecoration(
                labelText: 'RESULTADO',
                labelStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.purple[100]),
                border: OutlineInputBorder(),
              ),
              controller: resulController,
            ),
            SizedBox(height: 30.0),
            
            new Padding(
              //padding: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new MaterialButton(
                  //onPressed: () {print(int.parse(myController.text) + int.parse(segController.text));},
                  onPressed: suma,
                  color: Colors.lightBlue,
                  child: Icon(Icons.add, color: Colors.white),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  // child: Text(
                  //   '+', style: TextStyle(color: Colors.white)
                  // ),
                ),
                
                new MaterialButton(
                  //child: new Text("-", style: TextStyle(color: Colors.white)),
                  child: Icon(Icons.remove, color: Colors.white),
                  color: Colors.amberAccent,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: resta,
                ),

                new MaterialButton(
                  //child: new Text("*", style: TextStyle(color: Colors.white)),
                  child: Icon(Icons.close, color: Colors.white, size: 25),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.purple,
                  textColor: Colors.white,
                  onPressed: mul,
              ),
              ]
            ),

            new Padding(
              //padding: const EdgeInsets.only(top: 7.0),
              //padding: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
              new MaterialButton(
                child: new Text("/", style: TextStyle(color: Colors.white)),
                //child: Icon(Icons.devices_other, color: Colors.white, size: 25),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: div,
              ),

              new MaterialButton(
                child: new Text("CLEAR", style: TextStyle(color: Colors.white)),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.pink,
                textColor: Colors.white,
                onPressed: doClear,
              ),
              ],
            ),

            ],
            )
            
        ),
      );
  }
}





// otros tipos de botones
//FloatingActionButton(
// child: Icon(Icons.add),
// elevation: 50.0,
// backgroundColor: Colors.amber,
// onPressed: () {print(int.parse(myController.text) + int.parse(segController.text));},
//),

// FloatingActionButton(
//   child: Icon(Icons.remove),
//   elevation: 50.0,
//   backgroundColor: Colors.green,
//   onPressed: () {print(int.parse(myController.text) - int.parse(segController.text));},
// ),