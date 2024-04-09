import 'dart:math';

String wordCut(String word) {
    const double cutPercen = 0.5;

    int maxUnderscores = (word.length * cutPercen).floor();

    String maskedWord = '';
    int underscoreCount = 0;

    for (int i = 0; i < word.length; i++) {
      if (word[i] == ' ') {
        maskedWord += ' ';
      } else if (underscoreCount < maxUnderscores &&
          Random().nextDouble() < 0.5) {
        maskedWord += '_';
        underscoreCount++;
      } else {
        maskedWord += word[i];
      }
    }

    return maskedWord;
  }

  String handleCutWord({required String guess, required String word, required String cutWord}) {
    guess = guess.toLowerCase();
    String ans = word.toLowerCase();
    String result = '';

    for (int i = 0; i < ans.length; i++) {
      if (i < guess.length && guess[i] == ans[i]) {
        result += guess[i];
      } else {
        result += cutWord[i];
      }
    }

    return result;
  }