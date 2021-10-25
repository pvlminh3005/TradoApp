import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/constants.dart';

//SIZE 24
const kTextCaption = TextStyle(
  fontFamily: 'Raleway',
  fontSize: 24,
  shadows: [
    Shadow(
      offset: Offset(2.5, 4.0),
      blurRadius: 10.0,
      color: Color.fromRGBO(0, 0, 0, 0.5),
    ),
  ],
  fontWeight: FontWeight.w700,
  color: kTextDark,
);
const kTextMediumDark_24 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w500,
);
const kTextBoldDark_24 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

//SIZE 20
const kTextBoldDark_20 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: kTextDark,
);
const kTextBoldLight_20 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: kTextLight,
);

//SIZE 18
const kTextBoldLight_18 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
  color: kTextLight,
);
const kTextMediumDark_18 = TextStyle(
  fontSize: 18,
  color: kTextDark,
);
const kTextBoldDark_18 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
  color: kTextDark,
);
TextStyle kTextBoldPrimary_18 = kTextBoldDark_18.merge(TextStyle(
  color: kPrimaryColor,
));
TextStyle kTextBoldError_18 = kTextBoldDark_18.merge(TextStyle(
  color: kErrorColor,
));
TextStyle kTextMediumGrey_18 = kTextMediumDark_18.merge(TextStyle(
  color: kTextColorGrey,
));
//SIZE 16
const kTextMediumDark_16 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
const kTextBoldDark_16 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: kTextDark,
);
const kTextBoldPrimary_16 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: kPrimaryColor,
);
const kTextHighlight_16 = TextStyle(
  fontSize: 16,
  color: kHighlightColor,
);

//SIZE 15
const kTextMediumDark_15 = TextStyle(
  fontSize: 15,
  color: kTextDark,
);

//SIZE 14
const kTextMediumLight_14 = TextStyle(
  fontSize: 14,
  color: kTextLight,
);
const kTextMediumDark_14 = TextStyle(
  fontSize: 14,
  color: kTextDark,
  fontFamily: 'RobotoCondensed',
);
const kTextBoldDark_14 = TextStyle(
  // fontFamily: 'RobotoCondensed',
  fontSize: 14,
  fontWeight: FontWeight.w700,
  color: kTextDark,
);
const kTextMediumGrey_14 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: kTextColorGrey,
);
TextStyle kTextMediumPrimary_14 = kTextMediumDark_14.merge(TextStyle(
  color: kPrimaryColor,
));

//SIZE 13
TextStyle kTextPlaceholder = TextStyle(
  fontSize: 13,
  color: kTextColorGrey.withOpacity(.6),
);

//SIZE 12
const kTextMediumDark_12 = TextStyle(
  fontSize: 12,
  color: kTextDark,
);
TextStyle kTextBoldLight_12 = kTextMediumDark_12.merge(TextStyle(
  color: kTextLight,
  fontWeight: FontWeight.w700,
));
const kTextBoldDark_12 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  color: kTextDark,
);
TextStyle kTextBoldError_12 = kTextBoldDark_12.merge(TextStyle(
  color: kErrorColor,
));
