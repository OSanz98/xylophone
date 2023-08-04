import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());


class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Xylophone(),
        ),
      ),
    );
  }
}

class Xylophone extends StatefulWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final player = AudioPlayer();

  void playSound(int no) async {
    await player.play(AssetSource('note$no.wav'));
  }

  Expanded buildKey({required int keyNo, required Color keyColour}) {
    return Expanded(
      child: TextButton(
        onPressed: () async {
          playSound(keyNo);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(keyColour)
        ),
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildKey(keyNo: 1, keyColour: Colors.red),
        buildKey(keyNo: 2, keyColour: Colors.orange),
        buildKey(keyNo: 3, keyColour: Colors.yellow),
        buildKey(keyNo: 4, keyColour: Colors.green),
        buildKey(keyNo: 5, keyColour: Colors.green.shade900),
        buildKey(keyNo: 6, keyColour: Colors.blue),
        buildKey(keyNo: 7, keyColour: Colors.purple),
      ],
    );
  }
}
