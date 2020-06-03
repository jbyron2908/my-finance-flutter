import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_actions.dart';

class PlaygroundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Container(
        child: ItemActions(
          child: ExpansionTile(
            title: Text('Title'),
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(1),
                child: ItemActions(
                  child: ListTile(
                    title: Text('Title1'),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(1),
                child: ItemActions(
                  child: ListTile(
                    title: Text('Title2'),
                  ),
                ),
              ),
              ItemActions(
                child: ListTile(
                  title: Text('Title3'),
                ),
              ),
              ItemActions(
                child: ListTile(
                  title: Text('Title4'),
                ),
              ),
              ItemActions(
                child: ListTile(
                  title: Text('Title5'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
