import 'package:flutter/material.dart';
import '/components/constrains.dart';
import 'package:scrum_pocker/models/cards.dart';


class CardCard extends StatefulWidget {
  const CardCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  final MyCards card;

  @override
  State<CardCard> createState() => _CardCardState();
}

class _CardCardState extends State<CardCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: SizedBox(
        child: GestureDetector(
          onTap: () {
            setState(() {
              widget.card.wasChosen = !widget.card.wasChosen;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: widget.card.wasChosen
                    ? kPrimaryButtonColor
                    : kPrimaryVoteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.card.rank,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    )
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