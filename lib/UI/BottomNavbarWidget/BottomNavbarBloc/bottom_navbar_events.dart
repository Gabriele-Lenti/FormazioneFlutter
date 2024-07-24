class BottomNavbarEvents {}

class OnTabChangedEvent extends BottomNavbarEvents {
  int selectedTabIndex = 0;
  OnTabChangedEvent(this.selectedTabIndex);
}
