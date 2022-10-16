import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

// TODO:
class AntInput extends StatefulWidget {
  const AntInput({
    super.key,
    required this.controller,
    this.placeholder,
    this.clearable = false,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.disabled = false,
  });
  final TextEditingController controller;
  final String? placeholder;
  final bool clearable; // TODO:
  final TextAlign textAlign;
  final bool readOnly;
  final bool disabled;

  @override
  State<AntInput> createState() => _AntInputState();
}

class _AntInputState extends State<AntInput> {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context);

    return Opacity(
      opacity: widget.disabled ? .4 : 1,
      child: ValueListenableBuilder(
        valueListenable: widget.controller,
        builder: (context, value, child) {
          return Stack(
            children: [
              if (widget.placeholder != null && widget.controller.text.isEmpty)
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.placeholder!,
                        textAlign: widget.textAlign,
                        style: TextStyle(
                          color: theme.colorLight,
                          fontSize: theme.fontSize9,
                          height: 1.5,
                          leadingDistribution: TextLeadingDistribution.even,
                        ),
                      ),
                    ),
                  ],
                ),
              child!
            ],
          );
        },
        child: EditableText(
          backgroundCursorColor: theme.colorSuccess, // TODO:
          controller: widget.controller,
          cursorColor: theme.colorText,
          cursorWidth: 1,
          focusNode: _focusNode,
          style: TextStyle(
            fontSize: theme.fontSize9,
            color: theme.colorText,
            height: 1.5,
            leadingDistribution: TextLeadingDistribution.even,
          ),
          textAlign: widget.textAlign,
          readOnly: widget.readOnly || widget.disabled,
        ),
      ),
    );
  }
}
