import 'package:flutter/material.dart';

class BusStop extends StatelessWidget {
  final String name;
  final String shortName;
  final bool isStarred;
  final Function() onStarPressed;

  BusStop({
    required this.name,
    required this.shortName,
    required this.isStarred,
    required this.onStarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(shortName),
          trailing: IconButton(
            icon: Icon(
              isStarred ? Icons.star : Icons.star_border,
              color: isStarred ? Colors.orange : null,
            ),
            onPressed: onStarPressed,
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 0,
        ),
      ],
    );
  }
}

