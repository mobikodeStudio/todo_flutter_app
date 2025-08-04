import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/presentation/settings/bloc/settings_bloc.dart';
import 'package:todo_flutter_app/presentation/settings/bloc/settings_event.dart';
import 'package:todo_flutter_app/presentation/settings/bloc/settings_state.dart';
import 'package:todo_flutter_app/core/injector.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingsBloc>()..add(LoadUserDataEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          leading: const BackButton(),
        ),
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is SettingsLoadedState) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                    title: Text(state.name),
                    subtitle: Text(state.email),
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  const Text('APP PREFERENCES', style: TextStyle(color: Colors.grey)),
                  SwitchListTile(
                    title: const Text('Dark Mode'),
                    value: state.isDarkMode,
                    onChanged: (_) {
                      context.read<SettingsBloc>().add(ToggleDarkModeEvent());
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Notifications'),
                    value: state.isNotificationsEnabled,
                    onChanged: (_) {
                      context.read<SettingsBloc>().add(ToggleNotificationsEvent());
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Sound Effects'),
                    value: state.isSoundEffectsEnabled,
                    onChanged: (_) {
                      context.read<SettingsBloc>().add(ToggleSoundEffectsEvent());
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('SUPPORT & ABOUT', style: TextStyle(color: Colors.grey)),
                  ListTile(
                    title: const Text('Help & Support'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Privacy Policy'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Terms of Service'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const ListTile(
                    title: Text('Version'),
                    trailing: Text('1.0.0'),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {

                    },
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
