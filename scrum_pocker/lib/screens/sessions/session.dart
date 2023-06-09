import 'package:flutter/material.dart';
import 'package:scrum_pocker/models/room.dart';

import '../../components/api_service.dart';
import '../../components/constrains.dart';

class SessionScreen extends StatefulWidget {
  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
    List<VRoom>? _sessions = []; 

  @override

  void initState(){
    super.initState();
    _getData();
  }

  void _getData() async {
    _sessions = (await ApiService().getRooms())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void toggleColorMode() {
    setState(() {
      isNightModeEnabled = !isNightModeEnabled;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon( Icons.alarm, color: Colors.grey, size: 20,),
                TextButton ( 
                  onPressed: () { 
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
            DataTable(
        columns: <DataColumn>[
          DataColumn(label: Text('Room Number')),
          DataColumn(label: Text('Scrum Master ID')),
          DataColumn(label: Text('Duration (seconds)')),
          DataColumn(label: Text('Created Date')),
        ],
        rows: _sessions!
            .map(
              (session) => DataRow(
                cells: <DataCell>[
                  DataCell(Text(session.room_number)),
                  DataCell(Text(session.scrummaster.toString())),
                  DataCell(Text(session.lifetime.toString())),
                  DataCell(Text(session.created_date.toString())),
                ],
              ),
            )
            .toList(),
      ),
    
          // ListView.builder(
          //   padding: const EdgeInsets.all(8),
          //   itemCount: _sessions?.length,
          //   itemBuilder: (context, index) {
          //     final session = _sessions![index];
          //     return Container(
          //       height: 50,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Text(session.room_number),
          //           Text('User Number: ${session.scrummaster.toString()}'),
          //           Text('Duration: ${session.lifetime} seconds'),
          //           Text('Created Date: ${session.created_date.toString()}'),
          //         ],
          //       )
          //       // title: Text(session.room_number),
          //       // subtitle: Text('Date: ${session.created_date}'),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
