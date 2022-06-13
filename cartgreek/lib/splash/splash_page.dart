import 'package:cartgreek/routes/route_names.dart';
import 'package:cartgreek/widgets/custom_circluar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadNextScreen();
    });
    super.initState();
  }

  void _loadNextScreen() {
    Future.delayed(const Duration(milliseconds: 2000));
    NavigationServices().gotoHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Center(
            child: SizedBox(
                height: 34,
                width: 34,
                child: CustomCircularProgressIndicator()),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + 16,
          )
        ],
      ),
    );
  }
}
