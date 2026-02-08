import 'package:flutter/cupertino.dart';

extension IntExtension on int{
  SizedBox verticalSpace()=>SizedBox(height: toDouble(),);
  SizedBox horizontalSpace()=>SizedBox(width: toDouble(),);
}