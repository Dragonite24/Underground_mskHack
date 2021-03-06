import 'package:flutter/material.dart';
import 'single_input_cell_widget.dart';

class InputRowWidget extends StatefulWidget {
  final String inputCode;

  InputRowWidget({this.inputCode = ""});

  @override
  _InputRowWidgetState createState() => _InputRowWidgetState();
}

class _InputRowWidgetState extends State<InputRowWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _cells = [];
    String _text;
    bool _isFocusedUnderline;
    bool _isShowCursor;

    for (int i = 0; i < 4; i++) {
      // the display text
      if (i < widget.inputCode.length) {
        _text = widget.inputCode.substring(i, i + 1);
      } else {
        _text = "";
      }

      // whether to focused
      if (i == widget.inputCode.length) {
        _isFocusedUnderline = true;
        _isShowCursor = true;
      } else {
        _isFocusedUnderline = false;
        _isShowCursor = false;
      }

      _cells.add(SingleCellWidget(
        text: _text,
        isFocusedUnderline: _isFocusedUnderline,
        isShowCursor: _isShowCursor,
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _cells,
    );
  }
}