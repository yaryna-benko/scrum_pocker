import 'package:flutter/material.dart';
import 'package:scrum_pocker/components/constrains.dart';
import 'package:scrum_pocker/components/timer.dart';
import 'card_card.dart';
import 'package:scrum_pocker/models/cards.dart';
import 'package:scrum_pocker/screens/room/room.dart';

class CBody extends StatelessWidget {
  static String routeName = "/cards";
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
                Icon( Icons.alarm, color: Colors.grey, size: 20),
                CountdownTimer(),
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
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'result');
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
                'Stop voting',
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ),
            SizedBox(height: 15),
            GridView.builder(
              padding: EdgeInsets.all(50),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: demoCards.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index){
                return CardCard(card: demoCards[index]);
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
