import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.red,
        child: ListView(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.amber,
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.pink,
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.blue,
            ),
          ],
        ),
      ),
      // child: Column(
      //   children: [
      //     Container(
      //       height: MediaQuery.of(context).size.height,
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //           colors: [
      //             Colors.black,
      //             Color.fromRGBO(200, 200, 200, 1),
      //           ],
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomCenter,
      //         ),
      //       ),
      //       padding: EdgeInsets.all(8.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Expanded(
      //             child: Text('Recently played'),
      //           ),
      //           Icon(Icons.ac_unit),
      //           const SizedBox(
      //             width: 10,
      //           ),
      //           Icon(Icons.ac_unit),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
