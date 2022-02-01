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
  return Directory.current.listSync().where((entity) {
    return FileSystemEntity.isFileSync(entity.path) &&
        entity.path.contains(new RegExp(r'\.(png|jpg|jpeg)'));
  }).map((entity) {
    final filename = entity.path.split(Platform.pathSeparator).last;
    return new Option(filename, entity);
  }).toList();

  //Take all the images and create an option object out of each
}
