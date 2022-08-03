import 'package:flutter/material.dart';
import 'package:scrum_pocker/components/constrains.dart';
import 'package:scrum_pocker/screens/cards/body.dart';
import 'package:scrum_pocker/models/voters.dart';

class Result extends StatelessWidget {
  static String routeName = "/result";
  @override
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
                  onPressed: () { Navigator.pushNamed(context, 'room'); },
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
                      text: iResult().toString(),
                      style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
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
}

double iResult() {
  double res = 0;
  for (int i = 0; i < demoVoters.length; i++){
    if(demoVoters.elementAt(i).vote == '?'){
      res += 0;
    }else{
      res += int.parse(demoVoters.elementAt(i).vote);
    }
  }
  return res/demoVoters.length;
}