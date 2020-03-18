import 'package:flutter/material.dart';

import '../utils/functions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  String _exibitionText = "informe seus dados";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(
          "IMC Calculator",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
              size: 30,
              ), 
            onPressed: (){
              resetFields(weightController, heightController);
              setState(() {
                _exibitionText = "Informe seus dados";  
              });
              
            }
            )
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Form(
          key: _formState,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.person_outline,
                  size: 120,
                  color: Colors.deepPurpleAccent,
                  ),

                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                        return "Insira seu peso";
                      } 
                    },
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22
                    ),

                  decoration: InputDecoration(
                    labelText: "Weight (KG)",
                    labelStyle: TextStyle(
                      color: Colors.purple,
                      fontSize: 22
                    )
                  ),
                ),

                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                        return "Insira sua altura";
                      } 
                    },
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22
                    ),

                  decoration: InputDecoration(
                    labelText: "Height",
                    labelStyle: TextStyle(
                      color: Colors.purple,
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top:15, 
                    bottom:15
                  ),
                  child:Container(
                    height: 50,
                    child: RaisedButton(
                      onPressed: (){
                        if (_formState.currentState.validate()){
                          setState(() {
                            _exibitionText = calculate(weightController,heightController);
                          });
                        }
                          
                        
                      },
                      
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22
                        ),
                      ),
                      color: Colors.purple,
                    ),
                  ),
                ),

                Text(
                  _exibitionText,
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 22
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:<Widget>[
                    Text("Version: 1.0.0")
                  ],
                )
              ],
          )
        ),
      )
    );
  }
}