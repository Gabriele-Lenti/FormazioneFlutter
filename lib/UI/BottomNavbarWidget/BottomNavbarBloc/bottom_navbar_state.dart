
enum Pages { search, favourites, profile }

class BottomNavbarState {
  final Pages selectedPage;
  final int selectedIndex;

  BottomNavbarState(this.selectedPage, this.selectedIndex);
}