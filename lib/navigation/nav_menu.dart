import 'package:productivity_app/navigation/nav_option.dart';

class NavMenu{
  static const List<NavOption> nav1 = [
    notes,
    signOut,
  ];

  static const List<NavOption> nav2 = [
    lists,
    signOut,
  ];

  static const lists = NavOption(text: 'Lists');
  static const notes = NavOption(text: 'Notes');
  static const signOut = NavOption(text: 'Sign Out');
}
