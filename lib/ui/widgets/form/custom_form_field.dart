import 'package:flutter/material.dart';

typedef CustomFormFieldTapCallback<T> = Future<T> Function();

class CustomFormField<T> extends StatefulWidget {
  final FocusNode focusNode;
  final void Function(T) onSaved;
  final void Function(T) onFieldSubmitted;
  final String Function(T) validator;
  final T initialValue;
  final String labelText;
  final Icon prefixIcon;
  final String Function(T) buildText;
  final CustomFormFieldTapCallback<T> onTapOrFocus;
  final bool enabled;

  CustomFormField({
    Key key,
    this.focusNode,
    this.initialValue,
    this.onSaved,
    this.onFieldSubmitted,
    this.validator,
    this.labelText,
    this.prefixIcon,
    this.buildText,
    this.onTapOrFocus,
    this.enabled = true,
  }) : super(key: key);

  @override
  _CustomFormFieldState<T> createState() => _CustomFormFieldState<T>();
}

class _CustomFormFieldState<T> extends State<CustomFormField<T>> {
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<T>(
        initialValue: widget.initialValue,
        validator: widget.validator,
        onSaved: widget.onSaved,
        builder: (fieldState) {
          return InkWell(
            focusNode: widget.focusNode,
            highlightColor: widget.enabled ? null : Colors.transparent,
            splashColor: widget.enabled ? null : Colors.transparent,
            onFocusChange: (value) async {
              if (widget.enabled && value) {
                await _executeAction(context, fieldState);
              }
            },
            onTap: () async {
              if (widget.enabled) {
                await _executeAction(context, fieldState);
              }
            },
            onHighlightChanged: (value) {
              if (widget.enabled) {
                setState(() {
                  isFocused = value;
                });
              }
            },
            child: InputDecorator(
              isFocused: isFocused,
              decoration: InputDecoration(
                enabled: widget.enabled,
                labelText: widget.labelText,
                prefixIcon: widget.prefixIcon,
                border: OutlineInputBorder(),
                errorText: fieldState.errorText,
              ),
              child: Text(
                widget.buildText(fieldState.value),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          );
        },
      ),
    );
  }

  Future _executeAction(
    BuildContext context,
    FormFieldState<T> fieldState,
  ) async {
    var result = await widget.onTapOrFocus();

    if (result != null) {
      fieldState.didChange(result);
      FocusScope.of(context).requestFocus(FocusNode());
      if (widget.onFieldSubmitted != null) {
        widget.onFieldSubmitted(result);
      }
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
