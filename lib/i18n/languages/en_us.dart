import 'package:i18n_extension/i18n_extension.dart';

final enUS = {
  "en_us": {
    "Increment": "Increment",
    "Change Language": "Change Language",
    "You clicked the button %d times:": "You clicked the button %d times:"
        .zero("You haven't clicked the button:")
        .one("You clicked it once:")
        .two("You clicked a couple times:")
        .many("You clicked %d times:")
        .times(12, "You clicked a dozen times:"),
  }
};
