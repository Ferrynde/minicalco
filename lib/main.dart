import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:projetx/components/buttons.dart';

void main(){
  runApp(Calculator());

}
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var operation="";
  var reponse="";
  final List buttons =[
    "C","DEL","%","/",
    "9","8","7","*",
    "6","5","4","-",
    "3","2","1","+",
    "0",".","ANS","="
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.amberAccent[100],
          body: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                Expanded(child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                            child: Text(operation, style:
                              TextStyle(fontSize: 30)
                              ,)),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Text(reponse,style:
                            TextStyle(fontSize: 30)
                              ,)),
                      ],
                    ),
                  ),
                ),
                ),
                Expanded(flex:2,
                    child: Container(
                      child: GridView.builder(
                        itemCount: buttons.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index){
                           if(index==0){
                             return Buttons(
                                 appui: (){
                                   setState(() {
                                     operation ="";
                                   });
                                 },
                                 color: Colors.green,
                                 textcolor: Colors.white,
                                 text: buttons[index]);
                           }
                           else if(index==buttons.length-1){
                             return Buttons(
                                 appui: (){
                                   setState(() {
                                     resultat();
                                   });
                                 },
                                 color: Colors.red,
                                 textcolor: Colors.white,
                                 text: buttons[index]);
                           }
                           else if(index==1){
                             return Buttons(
                                appui: (){
                                  setState(() {
                                    operation =operation.substring(0,operation.length-1);
                                  });
                                },
                                 color: Colors.red,
                                 textcolor: Colors.white,
                                 text: buttons[index]);
                           }
                           else{
                             return Buttons(
                                 appui: (){
                                   setState(() {
                                     operation =operation+buttons[index];
                                   });
                                 },
                                 color: isOperator(buttons[index]) ? Colors.amber: Colors.white,
                                 textcolor: Colors.black,
                                 text: buttons[index]);
                           }
                        },
                      ),
                     )
                )],
            ),
          ),
        ),
    );
  }
  bool isOperator(String x){
    if(x=="%"|| x=="/"|| x=="*"|| x=="-"|| x=="+"|| x== "="){
      return true;
    }
    else{
      return false;
    }
  }
  void resultat(){
    Parser p =Parser();
    String finalrep= operation;
    Expression exp= p.parse(finalrep);
    ContextModel  cm= ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    reponse= eval.toString();
  }
}
