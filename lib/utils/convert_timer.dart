import 'dart:async';

convertTimer(Function() function) => Timer(
      Duration(seconds: 2),
      function,
    );
