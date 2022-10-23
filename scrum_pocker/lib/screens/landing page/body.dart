import 'package:flutter/material.dart';
import 'package:scrum_pocker/components/constrains.dart';
import 'package:scrum_pocker/components/api_service.dart';
import 'package:scrum_pocker/models/room.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HBody extends StatefulWidget {
  @override
  State<HBody> createState() => _BodyState();
}

class _BodyState extends State<HBody> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  bool checkedValue = false;
  Future<VRoom>? _futureRoom;

  @override
  // Future<void> _createVRoom() async {
  //     VRoom new_room = VRoom(id: 6, room_number: '9051a', scrummaster: 44, lifetime: 11000);
      
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(builder: (context) =>  HomePage()),
  //       // );
  //   }


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
                // Icon ( Icons.clear_rounded, color: kPrimaryButtonColor, size: 20,),
                // SizedBox(width: 5),
                // Text ( 'Quit', style: TextStyle(fontSize: 20, color: kPrimaryButtonColor, fontWeight: FontWeight.normal),),
                // SizedBox(width: 5)
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
              onPressed: () async{
                final VRoom new_room = await createVRoom(6);
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