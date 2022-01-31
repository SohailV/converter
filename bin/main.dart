import 'package:prompter_sg/prompter_sg.dart';
import 'dart:io';

void main() {
  final prompter = new Prompter();

  final choice = prompter.askBinary('Are you here to convert an image');

  if (!choice) {
    exit(0);
  }

  final format = prompter.askMultiple('Select format', buildFormatOptions());
  prompter.askMultiple('Select an image to convert:', buildFileOptions());
}

List<Option> buildFormatOptions() {
  return [
    new Option('Convert to jpeg', 'jpeg'),
    new Option('Convert to png', 'png'),
  ];
}

List<Option> buildFileOptions() {
  //get a reference to the current working directory

  // Fing all the files and filders in this directory

  // Look through that list and find only the *images*

  //Take all the images and create an option object out of each
}
