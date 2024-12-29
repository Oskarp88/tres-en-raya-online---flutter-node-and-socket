import 'package:flutter/material.dart';

class TictactoeBoard extends StatefulWidget {
  const TictactoeBoard({super.key});

  @override
  State<TictactoeBoard> createState() => _TictactoeBoardState();
}

class _TictactoeBoardState extends State<TictactoeBoard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.7,
        maxWidth: 500,
      ),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3
        ),
        itemBuilder: (BuildContext context, int index){
          return Container(
            decoration: BoxDecoration(
               border: Border.all(
                color: Colors.white24
               ),
            ),
            child: const Center(
              child: Text(
                'X',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 40,
                      color: Colors.greenAccent
                    )
                  ]
                ),           
              ),
            ),
          );
        },
      ),
    );
  }
}