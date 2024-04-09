import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '_gamePage.dart';
import 'data.dart';

class intro extends StatefulWidget {
  const intro({super.key});

  @override
  State<intro> createState() => _introState();
}


class _introState extends State<intro> {
  String _cat = 'f';
  dataService d = new dataService();

  Widget _buildCatButton({required String cat}){
    
  return ClipRRect(
    borderRadius: BorderRadius.circular(16.0),
    child: Material(
      child: InkWell(
        onTap: () {
          setState((){
            _cat = cat.substring(0, 1).toLowerCase();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => gameScreen(cat: d.dataCaller(_cat)), 
              ),
            );
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 130.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: Color.fromARGB(225, 227, 227, 227),
              border: Border.all(color: const Color.fromARGB(255, 26, 25, 25)),
              borderRadius: BorderRadius.circular(16.0)
            ),
            child: Center(child: Text('$cat',style: TextStyle(fontFamily: 'Fancy',color: const Color.fromARGB(255, 26, 25, 25),fontWeight: FontWeight.w900,fontSize: 40.0),))
          ),
        ),
      ),
      color: Colors.transparent,
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 170, 41, 37),
        child: Center(
          child: Column(
            children: [
              Expanded(flex: 2,child: Image.asset('assets/img/header.png',width: 300.0,height: 300.0,)),
              Expanded(flex: 1,child: Text('MAKE YOUR CHOICE',style: TextStyle(fontFamily: 'Fancy',color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.w900,fontSize: 40.0),)),
              Expanded(flex: 1,child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [_buildCatButton(cat: 'MEALS'),_buildCatButton(cat: 'SPORT')])),
              Expanded(flex: 1,child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [_buildCatButton(cat: 'JOB',),_buildCatButton(cat: 'FRUIT')])),
              Expanded(flex: 1,child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [_buildCatButton(cat: 'VEHICLE'),_buildCatButton(cat: 'ANIMAL')])),
            ],
          ),
        ),
      ),
    );
  }
}

