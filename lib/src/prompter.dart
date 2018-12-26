import 'package:prompter_dm/src/option.dart';
import 'package:prompter_dm/src/terminal.dart';

final Terminal _terminal = const Terminal();

class Prompter {
  bool askBinary(String prompt) {
    _terminal.clearScreen();
    _terminal.printPrompt('$prompt (y/n)');

    final input = _terminal.collectInput().toLowerCase();

    if(input != 'y' && input != 'n') {
      return askBinary(prompt);
    }

    return input == 'y';
  }

  dynamic askMultiple(String prompt, List<Option> options) {
    _terminal.clearScreen();
    _terminal.printPrompt(prompt);
    _terminal.printOptions(options);

    final input = _terminal.collectInput();

    try {
      return options[int.parse(input) - 1].value;
    } catch(err) {
      return askMultiple(prompt, options);
    }
  }
}