import 'dart:developer';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:scrum_pocker/components/constrains.dart';
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
    _loadVotingResult();
  }


  void _loadVotingResult() async {
    try {
      final file = File('scrum_pocker/lib/components/voting_results.txt');
      if (await file.exists()) {
        String contents = await file.readAsString();
        // setState(() {
        //   _voteCount = int.parse(contents);
        // });
      } else {
        //log('no file');
      }
    } catch (e) {
      print('Error loading vote count: $e');
    }
  }
  void _saveVoteCount() async {
      final file = File('scrum_pocker/lib/components/voting_results.txt');
      await file.writeAsString(_voters.toString() + '\n');
      await file.writeAsString(iResult() + '\n' + DateTime.now().toString() + '\n');
  }

  void _getData() async {
    _voters = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

  }

  void toggleColorMode() {
    setState(() {
      isNightModeEnabled = !isNightModeEnabled;
    });
  }

  Widget build(BuildContext context) {
     return Container(
      decoration: BoxDecoration(
        color: isNightModeEnabled ? kPrimaryDarkColor : Colors.white
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
                    //_futureRoom = ApiService().putUserInVRoom(RoomId);
                    Navigator.pushNamed(context, 'home'); 
                    },
                  child: Icon(Icons.clear_rounded, color: kPrimaryButtonColor, size: 20,)
                ),
                Text ( 'Quit', style: TextStyle(fontSize: 20, color: isNightModeEnabled ? Colors.white : kPrimaryButtonColor, fontWeight: FontWeight.normal)),
                SizedBox(width: 5)
              ],
            ),
            Container(
              color: isNightModeEnabled ? kPrimaryDarkColor : Colors.white,
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ElevatedButton(
                  onPressed: toggleColorMode,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: isNightModeEnabled ? Colors.white : kPrimaryButtonColor
                  ),
                  child: Text(
                    isNightModeEnabled ? 'Switch to Day Mode' : 'Switch to Night Mode',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: isNightModeEnabled ? kPrimaryButtonColor : Colors.white,
                    ),
                  ),
                ),
                ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              color: isNightModeEnabled ? kPrimaryDarkColor : Colors.white,
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ElevatedButton(
                  onPressed: (){Navigator.pushNamed(context, 'sessions'); },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: isNightModeEnabled ? Colors.white : kPrimaryButtonColor
                  ),
                  child: Text(
                    'See sessions statistics',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: isNightModeEnabled ? kPrimaryButtonColor : Colors.white,
                    ),
                  ),
                ),
                ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.only( top: 80),
                child: RichText(
                text: TextSpan(
                  text: 'Room: ',
                    style: TextStyle(color: isNightModeEnabled ? Colors.white : kPrimaryButtonColor, fontSize: 26),
                    children: <TextSpan>[
                      TextSpan(
                        text: '0005',
                        style: TextStyle(color: isNightModeEnabled ? Colors.white : kPrimaryButtonColor, fontSize: 26, fontWeight: FontWeight.bold),
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
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: iResult(),
                      style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text:'\nNumber of sessions today: ${sessionsCount}',
                          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ]
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
          ],
        ),
      ),
    );
  }

String DateAndTime(){
  DateTime now = DateTime.now();
  return DateFormat('kk:mm:ss EEE d MMM').format(now).toString();
}

  String iResult() {
  var res = 0;
  int itr = 0;
  int nullVotes = 0;
  var _voterIteraror = _voters!.iterator;
  while(_voterIteraror.moveNext()){
    if(_voterIteraror.current.vote == '?' || _voterIteraror.current.vote == null){
      res += 0;
      nullVotes++;
    }else{
      res += int.parse(_voters!.elementAt(itr).vote);
      log(_voterIteraror.current.vote.toString());
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
  return (res/(_voters!.length - 1)).toString();
}
}

