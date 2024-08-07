class SettingsEvent{}

class DarkModeTappedEvent extends SettingsEvent{
  late bool isDark;
  DarkModeTappedEvent(this.isDark);
}