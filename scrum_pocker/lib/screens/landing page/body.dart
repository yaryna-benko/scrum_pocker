import 'package:flutter/material.dart';
import 'package:scrum_pocker/components/constrains.dart';
import 'package:scrum_pocker/components/api_service.dart';
import 'package:scrum_pocker/models/room.dart';


class HBody extends StatefulWidget {
  @override
  State<HBody> createState() => _BodyState();
}

  

class _BodyState extends State<HBody> {
  final _isHours = true;
  bool checkedValue = false;
  Future<VRoom>? _futureRoom;
  Future<VRoom>? _futureTestRoom;
  final TextEditingController _controller = TextEditingController();

    void toggleColorMode() {
    setState(() {
      isNightModeEnabled = !isNightModeEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isNightModeEnabled ? kPrimaryDarkColor : Colors.white,
      body: SingleChildScrollView(
        child: Column(   
          children: [
            SizedBox(height: 10),
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
              padding: EdgeInsets.only( top: 80),
                child: RichText(
                text: TextSpan(
                  text: 'Welcome! ',
                    style: TextStyle(color: isNightModeEnabled ? Colors.white : kPrimaryButtonColor, fontSize: 26),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child:
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter room number',
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                  )
                  ),
                )
            ),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Your nickname",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  )
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async{
                sessionsCount++;
                setState(() {
                  _futureRoom = ApiService().putUserInVRoom(_controller.text);
                  RoomId = _controller.text;
                  _futureTestRoom = ApiService().createVRoom();});
                Navigator.pushNamed(context, 'room');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isNightModeEnabled ? Colors.white : kPrimaryButtonColor,
                //surfaceTintColor: kPrimaryButtonColor,
                minimumSize: Size(300, 55),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              child: Text(
                'Join room',
                style: TextStyle(
                  fontSize: 14, 
                  color: isNightModeEnabled ? kPrimaryButtonColor : Colors.white,
                ),
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