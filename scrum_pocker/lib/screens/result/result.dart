import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scrum_pocker/components/constrains.dart';
import 'package:scrum_pocker/screens/cards/body.dart';
import 'package:scrum_pocker/models/room.dart';
import 'package:scrum_pocker/models/voters.dart';
import 'package:scrum_pocker/screens/room/components/voter_card.dart';
import 'package:scrum_pocker/components/api_service.dart';

class Result extends StatefulWidget {
  static String routeName = "/result";

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List<Voter>? _voters = []; 
  Future<VRoom>? _futureRoom;


  @override

  void initState(){
    super.initState();
    _getData();
  }

  void _getData() async {
    _voters = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  Widget build(BuildContext context) {
     return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon( Icons.alarm, color: Colors.grey, size: 20,),
                // StreamBuilder<int>(builder: (context, snapshot) {
                //   stream: _stopWatchTimer.rawTime;
                //   initialData: _stopWatchTimer.rawTime.value;
                //   _stopWatchTimer.execute;
                //   final value = snapshot.data;
                //   final displaytime = StopWatchTimer.getDisplayTime(value, hours: _isHours);
                //   return Text(displaytime, style: TextStyle(fontSize: 20, color: Colors.grey));
                // }),
                TextButton ( 
                  onPressed: () { 
                    _futureRoom = putUserInVRoom(RoomId);
                    Navigator.pushNamed(context, 'home'); 
                    },
                  child: Icon(Icons.clear_rounded, color: kPrimaryButtonColor, size: 20,)
                ),
                Text ( 'Quit', style: TextStyle(fontSize: 20, color: kPrimaryButtonColor, fontWeight: FontWeight.normal)),
                SizedBox(width: 5)
              ],
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.only( top: 80),
                child: RichText(
                text: TextSpan(
                  text: 'Room: ',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Rrr',
                        style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                      )
                    ]
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/3,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kPrimaryVoteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: iResult(),
                      style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 15),
            GridView.builder(
              padding: EdgeInsets.all(50),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _voters!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index){
                return VoterCard(voters: _voters![index]);
              }
            ),
            SizedBox(height: 15),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   width: MediaQuery.of(context).size.width / 3,
            //   child:  Image.asset('assets/icons/logo.png'),
            // )
          ],
        ),
      ),
    );
  }

  String iResult() {
  var res = 0;
  int itr = 0;
  var _voterIteraror = _voters!.iterator;
  while(_voterIteraror.moveNext()){
    if(_voterIteraror.current.vote == '?'){
      res += 0;
    }else{
      //res += _voters!.elementAt(itr).vote;
      //log(_voterIteraror.current.vote.toString());
      log(_voters!.elementAt(1).vote.toString());
    }
    itr++;
  }
  // for (int i = 0; i < _voters.length; i++){
  //   if(_voters.elementAt(i).vote == '?'){
  //     res += 0;
  //   }else{
  //     res += int.parse(_voters.elementAt(i).vote);
  //   }
  // }
  return (res/_voters!.length).toString();
}
}

