abstract class SettingsState {}

class SettingsInitialState extends SettingsState {}

class SettingsLoadedState extends SettingsState {
  final String name;
  final String email;
  final bool isDarkMode;
  final bool isNotificationsEnabled;
  final bool isSoundEffectsEnabled;

  SettingsLoadedState({
    required this.name,
    required this.email,
    required this.isDarkMode,
    required this.isNotificationsEnabled,
    required this.isSoundEffectsEnabled,
  });
}

