import 'package:flutter_bloc/flutter_bloc.dart';
import 'settings_event.dart';
import 'settings_state.dart';
import '../../../core/secure_data_storage.dart';      // ✅ FIXED
import '../../../core/secure_storage_keys.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitialState()) {
    on<LoadUserDataEvent>(_onLoadUserData);
    on<ToggleDarkModeEvent>(_onToggleDarkMode);
    on<ToggleNotificationsEvent>(_onToggleNotifications);
    on<ToggleSoundEffectsEvent>(_onToggleSoundEffects);
  }

  void _onLoadUserData(LoadUserDataEvent event, Emitter<SettingsState> emit) async {
    final email = await readData(emailKey);
    final name = await readData('user_name'); // optional

    emit(SettingsLoadedState(
      name: name ?? 'User',
      email: email ?? 'Not Available',
      isDarkMode: false,
      isNotificationsEnabled: false,
      isSoundEffectsEnabled: false,
    ));
  }


  void _onToggleDarkMode(
      ToggleDarkModeEvent event, Emitter<SettingsState> emit) {
    if (state is SettingsLoadedState) {
      final current = state as SettingsLoadedState;
      emit(SettingsLoadedState(
        name: current.name,
        email: current.email,
        isDarkMode: !current.isDarkMode,
        isNotificationsEnabled: current.isNotificationsEnabled,
        isSoundEffectsEnabled: current.isSoundEffectsEnabled,
      ));
    }
  }

  void _onToggleNotifications(
      ToggleNotificationsEvent event, Emitter<SettingsState> emit) {
    if (state is SettingsLoadedState) {
      final current = state as SettingsLoadedState;
      emit(SettingsLoadedState(
        name: current.name,
        email: current.email,
        isDarkMode: current.isDarkMode,
        isNotificationsEnabled: !current.isNotificationsEnabled,
        isSoundEffectsEnabled: current.isSoundEffectsEnabled,
      ));
    }
  }

  void _onToggleSoundEffects(
      ToggleSoundEffectsEvent event, Emitter<SettingsState> emit) {
    if (state is SettingsLoadedState) {
      final current = state as SettingsLoadedState;
      emit(SettingsLoadedState(
        name: current.name,
        email: current.email,
        isDarkMode: current.isDarkMode,
        isNotificationsEnabled: current.isNotificationsEnabled,
        isSoundEffectsEnabled: !current.isSoundEffectsEnabled,
      ));
    }
  }
}
