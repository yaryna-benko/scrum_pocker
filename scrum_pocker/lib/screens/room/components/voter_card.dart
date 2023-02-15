import 'dart:ui';
import 'dart:developer';

import 'package:flutter/material.dart';
import '/components/constrains.dart';
import 'package:scrum_pocker/models/voters.dart';


 bool pressed = false;

class VoterCard extends StatefulWidget {
  const VoterCard({
    Key? key,
    required this.voters,
  }) : super(key: key);

  final Voter voters;
  

  @override
  State<VoterCard> createState() => _VoterCardState();
}

class _VoterCardState extends State<VoterCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: SizedBox(
        child: GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kPrimaryVoteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.topCenter,
                    child: RichText(
                        text: TextSpan(
                          text: widget.voters.name + '\n\n\n',
                          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.voters.vote.toString() + '\n\n\n',
                              style: TextStyle(color: Colors.white, fontSize: 22, fontStyle: FontStyle.italic),
                            ),
                            // TextSpan(
                            //   text: widget.voter.hasVoted
                            //   ? 'Voted\n'
                            //   : 'In process\n',      
                            //   style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
                        //)
                          ]
                        ),
                      ),
                  ),
                ),
              ),
              
              const SizedBox(height: 10),
              
            ],
          ),
        ),
      ),
    );
  }
}