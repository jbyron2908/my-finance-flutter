import 'package:flutter/material.dart';

class FormFieldDecorator extends StatefulWidget {
  const FormFieldDecorator({
    Key key,
    this.onTap,
    this.text,
    this.labelText,
    this.prefixIcon,
  }) : super(key: key);

  final Function() onTap;
  final Text text;
  final String labelText;
  final Icon prefixIcon;

  @override
  _FormFieldDecoratorState createState() => _FormFieldDecoratorState();
}

class _FormFieldDecoratorState extends State<FormFieldDecorator> {
  bool hasFous = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        highlightColor: Colors.transparent,
        onHighlightChanged: (value) => setState(() {
          hasFous = value;
        }),
        onTap: widget.onTap,
        child: InputDecorator(
          child: widget.text,
          isFocused: hasFous,
          decoration: InputDecoration(
            labelText: widget.labelText,
            prefixIcon: widget.prefixIcon,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
