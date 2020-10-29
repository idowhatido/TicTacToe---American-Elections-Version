import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/alertDialog.dart';
import 'package:confetti/confetti.dart';
import 'gameButton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ButtonTTT> button;
  var democrats;
  var republicans;
  var activeplayer;
  ConfettiController _controllerTopCenter;

  @override
  void initState() {
    super.initState();
    button = doinitButton();
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  List<ButtonTTT> doinitButton() {
    democrats = List();
    republicans = List();
    activeplayer = 1;
    var gameBUtton = <ButtonTTT>[
      ButtonTTT(id: 1),
      ButtonTTT(id: 2),
      ButtonTTT(id: 3),
      ButtonTTT(id: 4),
      ButtonTTT(id: 5),
      ButtonTTT(id: 6),
      ButtonTTT(id: 7),
      ButtonTTT(id: 8),
      ButtonTTT(id: 9)
    ];

    return gameBUtton;
  }

  void playGame(ButtonTTT gb) {
    setState(() {
      if (activeplayer == 1) {
        gb.text = "X";
        gb.bg = Colors.grey[400];
        activeplayer = 2;
        democrats.add(gb.id);
      } else {
        gb.text = "O";
        gb.bg = Colors.grey[400];
        activeplayer = 1;
        republicans.add(gb.id);
      }
      gb.enabled = false;
      checkWinner();
    });
  }

  void checkWinner() {
    var winner = -1;
    if (democrats.contains(1) &&
        democrats.contains(2) &&
        democrats.contains(3)) {
      winner = 1;
    }
    if (republicans.contains(1) &&
        republicans.contains(2) &&
        republicans.contains(3)) {
      winner = 2;
    }

    if (democrats.contains(4) &&
        democrats.contains(5) &&
        democrats.contains(6)) {
      winner = 1;
    }
    if (republicans.contains(4) &&
        republicans.contains(5) &&
        republicans.contains(6)) {
      winner = 2;
    }

    if (democrats.contains(7) &&
        democrats.contains(8) &&
        democrats.contains(9)) {
      winner = 1;
    }
    if (republicans.contains(7) &&
        republicans.contains(8) &&
        republicans.contains(9)) {
      winner = 2;
    }

    if (democrats.contains(1) &&
        democrats.contains(4) &&
        democrats.contains(7)) {
      winner = 1;
    }
    if (republicans.contains(1) &&
        republicans.contains(4) &&
        republicans.contains(7)) {
      winner = 2;
    }

    if (democrats.contains(2) &&
        democrats.contains(5) &&
        democrats.contains(8)) {
      winner = 1;
    }
    if (republicans.contains(2) &&
        republicans.contains(5) &&
        republicans.contains(8)) {
      winner = 2;
    }

    if (democrats.contains(3) &&
        democrats.contains(6) &&
        democrats.contains(9)) {
      winner = 1;
    }
    if (republicans.contains(3) &&
        republicans.contains(6) &&
        republicans.contains(9)) {
      winner = 2;
    }

    if (democrats.contains(1) &&
        democrats.contains(5) &&
        democrats.contains(9)) {
      winner = 1;
    }
    if (republicans.contains(1) &&
        republicans.contains(5) &&
        republicans.contains(9)) {
      winner = 2;
    }

    if (democrats.contains(3) &&
        democrats.contains(5) &&
        democrats.contains(7)) {
      winner = 1;
    }
    if (republicans.contains(3) &&
        republicans.contains(5) &&
        republicans.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => alertDialog("Democrats won the election",
                "Press reset to play again", resetGame));
        _controllerTopCenter.play();
      } else {
        showDialog(
            context: context,
            builder: (_) => alertDialog("Republicans won the election",
                "Press reset to play again", resetGame));
        _controllerTopCenter.play();
      }
    }
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      button = doinitButton();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Republicans vs Democrats",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerTopCenter,
              blastDirection: pi / 2,
              maxBlastForce: 5, // set a lower max blast force
              minBlastForce: 2, // set a lower min blast force
              emissionFrequency: 0.05,
              numberOfParticles: 50, // a lot of particles at once
              gravity: 1,
              colors: const [Colors.red, Colors.blue, Colors.white],
              
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(25.0),
              itemCount: button.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemBuilder: (context, index) => RaisedButton(
                onPressed: () {
                  button[index].enabled ? playGame(button[index]) : null;
                },
                child: button[index].text == "X"
                    ? Image.asset('images/demo.png')
                    : (button[index].text == "O"
                        ? Image.asset('images/repub.png')
                        : null),
                color: button[index].bg,
                disabledColor: button[index].bg,
              ),
            ),
          ),
          RaisedButton(
          
            onPressed: resetGame,
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Reset"),
            ),
          )
        ],
      ),
    );
  }
}
