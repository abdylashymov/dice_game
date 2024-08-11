import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstDice = 0;
  int secondDice = 0;

  int firstScore = 0;
  int secondScore = 0;

  bool isEnable = true;

  void onTap(bool isFirstPlayer) {
    isEnable = !isEnable;
    firstDice = Random().nextInt(6) + 1;
    secondDice = Random().nextInt(6) + 1;

    if (isFirstPlayer) {
      firstScore = firstScore + firstDice + secondDice;
    } else {
      secondScore = secondScore + secondDice + firstDice;
    }

    setState(() {});
  }

  void restart() {
    firstDice = 0;
    firstScore = 0;
    secondDice = 0;
    secondScore = 0;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 176, 38),
        title: Text(
          'Dice App',
          style: GoogleFonts.orbitron(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        actions: [
          TextButton(
            onPressed: restart,
            child: Text(
              'Restart',
              style: GoogleFonts.orbitron(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: firstDice == 0 || secondDice == 0
          ? Center(
              child: Text(
                'Let\'s Go!',
                style: GoogleFonts.orbitron(
                  color: const Color.fromARGB(255, 7, 176, 38),
                  fontSize: 60,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      color: const Color.fromARGB(255, 7, 176, 38),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '$firstScore',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                            ),
                          ),
                          Text(
                            '$secondScore',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/dice$firstDice.png',
                      width: 200,
                      height: 300,
                    ),
                    // const SizedBox(
                    //   height: 0,
                    // ),
                    Expanded(
                      child: Image.asset(
                        'assets/dice$secondDice.png',
                        width: 200,
                        height: 300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          left: 40,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 7, 176, 38),
              foregroundColor: Colors.black,
              onPressed: isEnable ? () => onTap(true) : null,
              label: Text(
                'Click!',
                style: GoogleFonts.orbitron(
                  fontSize: 17,
                ),
              ),
            ),
            FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 7, 176, 38),
              foregroundColor: Colors.black,
              onPressed: !isEnable ? () => onTap(false) : null,
              label: Text(
                'Click!',
                style: GoogleFonts.orbitron(
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
