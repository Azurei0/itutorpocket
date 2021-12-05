import 'package:flutter/material.dart';

final List<String> notesDescription = [];
final List<String> notesHeading = [];
TextEditingController notesHeadingController = TextEditingController();
TextEditingController notesDescriptionController = TextEditingController();
FocusNode textSecondFocusMode = FocusNode();

int notesHeaderMaxLength = 25;
int notesDescriptionMaxLines = 100;
int notesDescriptionMaxLength = 100;
String deletedNoteHeading = "";
String deletedNoteDescription = "";

List<Color> noteColor = [
  // Colors.pink,
  // Colors.blue,
  // Colors.green,
  Colors.blueGrey,
];

List<Color> noteMarginColor = [
  Colors.black87,
];