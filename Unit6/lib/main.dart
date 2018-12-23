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
  final _words = <WordPair>[];//Words displayed in ListView, 1 row contain 1 word
  final _checkedWords = new Set<WordPair>(); // set contains "no duplicate items"
  @override
  Widget build(BuildContext context){
    //TODO: implement createState

   return new Scaffold(
     appBar: new AppBar(
       title: new Text("List of English Words"),
       actions: <Widget>[
         new IconButton(icon: new Icon(Icons.list),
           onPressed: _pushToSaveWordsScreen,)
       ],

     ),
     body: new ListView.builder(itemBuilder: (context, index){
       //This is an anonymous function
       //index = 0,1,2,3...
       //This function return each Row = "a Widget"
       if(index >= _words.length){
         _words.addAll(generateWordPairs().take(20));
       }
       return _buildRow(_words[index], index);

     }),
   );

  }
  _pushToSaveWordsScreen(){
    //print("You press on the right button");
    //To navigate, you must have a "router"
    final pageRoute = new MaterialPageRoute(builder: (context){
      // map function >> convert this list to another list( it can be different object's type)
      // _checkedWords(list of WordPair) => map =>
      // converted to a lazy list(Interable) of listTitle
      final listTiles = _checkedWords.map((wordPair){
        return new ListTile(
          title: new Text(wordPair.asUpperCase,
            style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        );
      });
      //Now return a widget, we choose "Scafford"
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Checked words"),
        ),
        body: new ListView(children: listTiles.toList(),),
      );
    });
    Navigator.of(context).push(pageRoute);
  }

  Widget _buildRow(WordPair wordPair, int index){
    final textColor = index % 2 == 0 ? Colors.red : Colors.green;
    final isChecked = _checkedWords.contains(wordPair);
    //This widget generate each row
    return new ListTile(
      leading:new Icon(
        isChecked ? Icons.check_box:Icons.check_box_outline_blank,
        color: textColor,
      ),
      title: new Text(
        wordPair.asUpperCase,
        style: new TextStyle(fontSize:16.0, color: textColor),
      ),
      onTap:(){
        setState((){
          if (isChecked){
            _checkedWords.remove(wordPair);//Remove item in a Set
          } else{
            _checkedWords.add(wordPair);//Add item to a Set
          }
        });
      },
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
    home: new RandomEnglishWords(),
  );
  }
}