import 'package:flutter/material.dart';
import 'game.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text("ex00"),
        ),

      ), 
      body: Center(
        child:
          GamePage()
      ),
    )
  ));
}

class Tile extends StatelessWidget {
  const Tile(this.letter, this.hitType, {super.key});

  final String letter;
  final HitType hitType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: switch (hitType) {
          HitType.hit => Colors.green,
          HitType.partial => Colors.yellow,
          HitType.miss => Colors.grey,
          _ => Colors.white,
        },
        // TODO: add children
      ),
    );
  }
}

class GamePage extends StatelessWidget {
  GamePage({super.key});

  final Game _game = Game();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 5.0,
        children: [
          for (final guess in _game.guesses)
            Row(
              spacing: 5.0,
              children: [
                for (final letter in guess) Tile(letter.char, letter.type),
              ],
            ),
          GuessInput(
            onSubmitGuess: (guess) {
              // TODO, handle guess
              print(guess); // Temporary
            },
          ),
        ],
      ),
    );
  }
}


class GuessInput extends StatelessWidget {
  GuessInput({super.key, required this.onSubmitGuess});

  final void Function(String) onSubmitGuess;

  final TextEditingController _textEditingController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLength: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
              ),
              controller: _textEditingController,
              autofocus: true,
              focusNode: _focusNode,
              onSubmitted: (input) {
                onSubmitGuess(_textEditingController.text.trim());
                _textEditingController.clear();
                _focusNode.requestFocus();
              },
            ),
          ),
        ),
      ],
    );
  }
}
