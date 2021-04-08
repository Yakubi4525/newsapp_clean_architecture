import 'dart:async';

enum NavBarItem { HOME, SOURCES, SEARCH, SAVED }

class BottomNavbarBloc {
  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.HOME;

  Stream<NavBarItem> get itemStream => _navBarController.stream;
    void pickItem(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarItem.HOME);
        break;
      case 1:
        _navBarController.sink.add(NavBarItem.SOURCES);
        break;
      case 2:
        _navBarController.sink.add(NavBarItem.SEARCH);
        break;
         case 3:
        _navBarController.sink.add(NavBarItem.SAVED);
        break;
    }
  }

  close() {
    _navBarController?.close();
  }
}
