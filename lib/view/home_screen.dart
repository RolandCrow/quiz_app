
import 'package:flutter/material.dart';
import 'package:quiz_app/utils/category_bottom_sheet.dart';

import '../utils/logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();



}

class _HomeScreen extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            const Spacer(flex: 1,),
            const SizedBox(
              child: Center(
                child: Logo(),
              ),
            ),
            const SizedBox(height: 15,),
            const SizedBox(
              child: Text(
                'Test your knowledge with our quiz'
              ),
            ),
            const Spacer(flex: 1,),
            SizedBox(
              child: ElevatedButton(
                  onPressed: () {
                    showBottomSheetCategory(context: context);
                  },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder> (
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )
                  )
                ),
                  child: const SizedBox(
                    width: 150,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Start Quiz',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
              ),
            ),
            const Spacer(flex: 1,)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}