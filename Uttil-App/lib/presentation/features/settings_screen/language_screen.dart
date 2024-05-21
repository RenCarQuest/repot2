import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {


  int value = 0;

  @override
  Widget build(BuildContext context) {

    return const Scaffold(resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,

    );
  }
  Widget radioButton(int index) {
    return SizedBox(
      height: 25,
      width: 25,
      child: OutlinedButton(
        onPressed: () {
          value = index;
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: (value == index) ? const Color(0xff0056D2) : const Color(0xffE2E8F0),
            width: (value == index) ? 7 : 2,
          ),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
        ),
        child: const Text(""),
      ),
    );
  }
}
