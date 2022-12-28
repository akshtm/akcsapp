import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class lstviwbuild extends StatelessWidget {
  const lstviwbuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SizedBox(
        height: 300,
        child: ListView.builder(
          itemBuilder: ((context, index) => Container(
                height: 200,
                width: 200,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(index.toString()),
                ),
                color: Colors.black,
              )),
        ),
      ),
    ));
  }
}
