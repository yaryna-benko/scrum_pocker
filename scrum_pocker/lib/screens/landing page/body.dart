import 'package:flutter/material.dart';
import 'package:scrum_pocker/components/constrains.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:scrum_pocker/screens/room/room.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(   
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon ( Icons.clear_rounded, color: kPrimaryButtonColor, size: 20,),
                SizedBox(width: 5),
                Text ( 'Quit', style: TextStyle(fontSize: 20, color: kPrimaryButtonColor, fontWeight: FontWeight.normal),),
                SizedBox(width: 5)
              ],
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.only( top: 80),
                child: RichText(
                text: TextSpan(
                  text: 'Welcome! ',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(width: MediaQuery.of(context).size.width / 3,
            child: TextField(
              cursorWidth: MediaQuery.of(context).size.width / 3,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Your nickname",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
                  ),),
            SizedBox(height: 15),
            SizedBox(width: MediaQuery.of(context).size.width / 3,
            child: TextField(
              cursorWidth: MediaQuery.of(context).size.width / 3,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Room number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
                  ),),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'room');
              },
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
                'Join room',
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ),
            SizedBox(height: 15),
            // Container(
            //   padding: EdgeInsets.all(10.0),
            //   child: Column(
            //     children: <Widget>[
            //       CheckboxListTile(
            //         title: Text("I'm a SCRUM Master"),
            //         value: checkedValue,
            //         onChanged: (newValue) {
            //           setState(() {
            //             checkedValue = !checkedValue;
            //           });
            //         },
            //         controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            //       )
            //       ],
            //   ),
            // ),
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