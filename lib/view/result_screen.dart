
import 'package:flutter/material.dart';
import 'package:quiz_app/style/theme.dart';
import 'package:quiz_app/view/quiz_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, required this.resultData}): super(key: key);
  final List resultData;

  @override
  State<StatefulWidget> createState() => _ResultScreenState();

}

List resultData = result;

class _ResultScreenState extends State<ResultScreen> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 5,
        title: const Text(
          'RESULT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
        child:  resultData.isEmpty
            ? const Center(
          child: Text(
            "   ERROR DATA NOT FOUND  CONTACT \n   DEVELOPER FOR MORE DETAILS ",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ): Column(
          children: [
            Container(
              child: SingleChildScrollView(
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    children: List.generate(resultData.length, (index) {
                      return Center(
                        child: resultTile(index, resultData[index]),
                      );
                    }),
                ),
              ),
            )
          ],
        )

      ),
    );
  }

  SizedBox resultTile(int index, bool correct) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Container(
        decoration: BoxDecoration(
          color: correct ? Colors.green.shade700 : Colors.red.shade700,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            '${index + 1}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }




}



