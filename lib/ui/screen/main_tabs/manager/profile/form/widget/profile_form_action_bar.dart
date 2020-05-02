import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/bloc/profile_form_bloc.dart';

class ProfileFormActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: Colors.blue,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              color: Colors.transparent,
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                ProfileFormBloc.of(context).cancel();
              },
            ),
          ),
          VerticalDivider(
            color: Colors.white,
            width: 0,
          ),
          Expanded(
            child: FlatButton(
              color: Colors.blue,
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                ProfileFormBloc.of(context).submit();
              },
            ),
          ),
        ],
      ),
    );
  }
}
