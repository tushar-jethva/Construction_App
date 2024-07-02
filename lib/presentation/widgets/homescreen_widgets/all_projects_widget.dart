import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllProjectsWidget extends StatelessWidget {
  const AllProjectsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          return ListTile(
            leading: Container(
                padding: EdgeInsets.all(8),
                width: 100,
                child: Placeholder()),
            title: Text('Place ${index + 1}', textScaleFactor: 2),
          );
        },
        childCount: 20,
      ),
    );
  }
}