import 'package:prompter_dm/prompter_dm.dart';

void main() {
  List<Option> options = [
    Option('Red', '#f00'),
    Option('Green', '#0f0'),
    Option('Blue', '#00f')
  ];

  final Prompter prompter = Prompter();

  final colorCode = prompter.askMultiple('Which colour do you like the most?', options);

  final magicPick = prompter.askBinary('Do you like magic?');  
  
  print(colorCode);
  print(magicPick);
}