import 'package:flutter/material.dart';


class HbcCommonTextStyle {

  final BuildContext context;
  final TextStyle style;

  HbcCommonTextStyle(this.context, {this.style});
  HbcCommonTextStyle.withWhiteColor(this.context) : style=TextStyle(color: Colors.white);

  TextTheme get theme {
    return Theme
        .of(context)
        .textTheme;
  }

  TextStyle get headline {
    /// Used for large text in dialogs (e.g., the month and year in the dialog shown by showDatePicker).
    /// regular 34sp
    return theme.headline.merge(style ?? new TextStyle());
  }

  TextStyle get title {
    /// Used for the primary text in app bars and dialogs (e.g., AppBar.title and AlertDialog.title).
    /// medium 20sp
    return theme.title.merge(style ?? new TextStyle());
  }

  TextStyle get subhead {
    /// Used for the primary text in lists (e.g., ListTile.title).
    /// regular 16sp
    return theme.subhead.merge(style ?? new TextStyle());
  }

  TextStyle get body2 {
    /// Used for emphasizing text that would otherwise be body1.
    /// medium 14sp
    return theme.body2.merge(style ?? new TextStyle());
  }

  TextStyle get body1 {
    /// Used for the default text style for Material.
    /// regular 14sp
    return theme.body1.merge(style ?? new TextStyle());
  }

  TextStyle get caption {
    /// Used for auxiliary text associated with images.
    /// regular 12sp
    return theme.caption.merge(style ?? new TextStyle());
  }

  TextStyle get button {
    /// Used for text on RaisedButton and FlatButton.
    /// medium (all caps) 14sp
    return theme.button.merge(style ?? new TextStyle());
  }

  TextStyle get display1 {
    /// Large text.
    /// regular 34sp
    return theme.display1.merge(style ?? new TextStyle());
  }

  TextStyle get display2 {
    /// Very large text.
    /// regular 45sp
    return theme.display2.merge(style ?? new TextStyle());
  }

  TextStyle get display3 {
    /// Very very large text.
    /// regular 56sp
    return theme.display3.merge(style ?? new TextStyle());
  }

  TextStyle get display4 {
    /// Extremely large text.
    /// light 112sp
    return theme.display4.merge(style ?? new TextStyle());
  }

}
