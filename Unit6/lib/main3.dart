import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:english_words/english_words.dart';

//Define "Root widget"
/*
void main(){
  runApp(new MyApp());
}

*/
//One line function
void main() => runApp(new MyApp());

//StatefulWidget allows to change its property
class RandomEnglishWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new RandomEnglishWordsState(); //return a state's object. where is the state's class?
  }
}

class RandomEnglishWordsState extends State<RandomEnglishWords>{
  @override
  Widget build(BuildContext context){
    //TODO: implement createState
    final wordPair = new WordPair.random();
        return new Text(
          wordPair.asUpperCase,
          style: new TextStyle(fontSize: 20.0)
        );

  }
}

//StatelessWidget will not allow  to change its property
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //final wordPair = new WordPair.random(); //final is same as const, the value won be changed
    //Build a function returns a "Widget"
  return new MaterialApp(
    title: "This is my first Flutter App",
    home: new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text("THis is the Header's title")
        ),
      ),
      body: new Center(
        child: new RandomEnglishWords()
      ),
    ),
  );
  }
}