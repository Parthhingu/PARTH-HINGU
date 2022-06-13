import 'package:cartgreek/constants/text_styles.dart';
import 'package:flutter/material.dart';

class PakagesPage extends StatefulWidget {
  const PakagesPage({Key? key}) : super(key: key);

  @override
  State<PakagesPage> createState() => _PakagesPageState();
}

class _PakagesPageState extends State<PakagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Coming Soon',
              style: TextStyles(context).getRegularStyle(),
            ),
          )
        ],
      ),
    );
  }
}
