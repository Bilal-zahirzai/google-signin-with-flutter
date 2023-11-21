import 'package:flutter/material.dart';
getHalfWidth(BuildContext context) {
  return MediaQuery.of(context).size.width / 2;
}

getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

getQuarterWidth(BuildContext context) {
  return ((MediaQuery.of(context).size.width) * 3 / 4);
}

getOneFourthWidth(BuildContext context) {
  return ((MediaQuery.of(context).size.width) / 4);
}

getHalfHeight(BuildContext context) {
  return MediaQuery.of(context).size.height / 2;
}

getQuarterHeight(BuildContext context) {
  return ((MediaQuery.of(context).size.height) / 2) * 3;
}

getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
getOneFourthHeight(BuildContext context) {
  return ((MediaQuery.of(context).size.height) / 4);
}