import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import '../tool/wordHandle.dart';
import '_introPage.dart';
import '../model/vocab.dart';
import '../tool/text_field.dart';
import '../tool/dialog.dart';
import '../tool/api_caller.dart';

class gameScreen extends StatefulWidget {
  final String cat;

  gameScreen({required this.cat});

  @override
  State<gameScreen> createState() => gameScreenState();
}

class gameScreenState extends State<gameScreen> {
  late String _cutWord;
  String _word = '';
  int _state = 0;
  List<vocab> _vocab = [];
  List<String?> statePic = [
    "",
    'assets/img/1.png',
    'assets/img/2.png',
    'assets/img/3.png',
    'assets/img/4.png',
    'assets/img/5.png',
    'assets/img/6.png',
    'assets/img/7.png',
  ];
  final TextEditingController _guess = TextEditingController();

  @override
  void initState() {
    super.initState();
    _word = widget.cat;
    _loadVocab();
    _cutWord = wordCut(_word);
  }

  Future<void> _loadVocab() async {
    try {
      final data = await ApiCaller().get(_word);
      List list = jsonDecode(data);
      setState(() {
        _vocab = list.map((e) => vocab.fromJson(e)).toList();
      });
    } on Exception catch (e) {
      showOkDialog(
          context: context,
          title: "Error",
          message: e.toString(),
          action: "Close");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 170, 41, 37),
        child: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        'GUESS THE WORD',
                        style: TextStyle(
                            fontFamily: 'Fancy',
                            color: Color.fromARGB(255, 243, 235, 235),
                            fontWeight: FontWeight.w900,
                            fontSize: 80.0),
                      ),
                      _state != 0
                          ? Image.asset(statePic[_state]!,
                              width: 230.0, height: 230.0)
                          : SizedBox(width: 230.0, height: 230.0)
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        handleCutWord(guess: _guess.text, word: _word, cutWord: _cutWord),
                        style: TextStyle(
                          fontFamily: 'Fancy',
                          color: Color.fromARGB(255, 243, 235, 235),
                          fontWeight: FontWeight.w900,
                          fontSize: 40.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 30, 60, 30),
                        child: MyTextField(
                          controller: _guess,
                          hintText: 'Answer Here',
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            _vocab.isNotEmpty ? vocabCard() : SizedBox(),
                            ElevatedButton(
                              onPressed: _buttonDecision,
                              child: Text(_buttonText()),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _handlePicState() {
    String guess = _guess.text.toLowerCase();
    String ans = _word.toLowerCase();
    if (_state < 6) {
      setState(() {
        _state = _state + 1;
      });
    }
    if (_state == 6 && guess != ans) {
      showOkDialog(
          context: context,
          title: 'Game Over!',
          message:
              'The word was ${_word}. Unfortunately, you lost the game. Better luck next time!',
          action: 'Try Again');
    } else {
      setState(() {
        _state = 7;
        showOkDialog(
            context: context,
            title: 'You Won The Game !',
            message:
                'Well played! You have unlocked the mystery word and claimed victory in Wordle!',
            action: 'Close');
      });
    }
  }

  void _buttonDecision() {
    if (_state == 6 || _state == 7) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => intro(),
          ),
        );
      });
    } else {
      _handlePicState();
    }
  }

  String _buttonText() {
    if (_state == 6 || _state == 7) {
      return 'Try Again';
    }
    return 'Send Answer';
  }

  Widget vocabCard() {
    return Container(
      margin: EdgeInsets.fromLTRB(45, 10, 45, 20),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Color.fromARGB(255, 54, 107, 39),
      ),
      child: Center(
        child: Text(
          'Meaning: ${_vocab[0].definition}',
          style: TextStyle(
            fontFamily: 'roboto',
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w900,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
