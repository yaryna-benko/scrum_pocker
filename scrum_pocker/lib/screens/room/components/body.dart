import 'package:flutter/material.dart';
import 'package:scrum_pocker/components/constrains.dart';
import 'voter_card.dart';
import 'package:scrum_pocker/models/voters.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon( Icons.alarm, color: Colors.grey, size: 20,),
                SizedBox(width: 5),
                // StreamBuilder<int>(builder: (context, snapshot) {
                //   stream: _stopWatchTimer.rawTime;
                //   initialData: _stopWatchTimer.rawTime.value;
                //   _stopWatchTimer.execute;
                //   final value = snapshot.data;
                //   final displaytime = StopWatchTimer.getDisplayTime(value, hours: _isHours);
                //   return Text(displaytime, style: TextStyle(fontSize: 20, color: Colors.grey));
                // }),
                Icon ( Icons.clear_rounded, color: kPrimaryButtonColor, size: 20,),
                SizedBox(width: 5),
                Text ( 'Quit', style: TextStyle(fontSize: 20, color: kPrimaryButtonColor),),
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
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                primary: kPrimaryButtonColor,
                surfaceTintColor: kPrimaryButtonColor,
                minimumSize: Size(300, 55),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              child: const Text(
                'Start voting',
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ),
            SizedBox(height: 15),
            GridView.builder(
              padding: EdgeInsets.all(50),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: demoVoters.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index){
                return VoterCard(voter: demoVoters[index]);
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
}