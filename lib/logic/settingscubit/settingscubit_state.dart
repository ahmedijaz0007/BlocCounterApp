part of 'settingscubit_cubit.dart';

class SettingsState {
 final bool appNotifications;
 final bool emailNotifications;
  SettingsState({required this.appNotifications, required this.emailNotifications});

  SettingsState copyWith({bool? appNotifications, bool? emailNotifications}){
    return SettingsState(appNotifications: appNotifications ?? this.appNotifications, emailNotifications: emailNotifications ?? this.emailNotifications);
  }
}

class SettingsInitial extends SettingsState {
  SettingsInitial():super(appNotifications: false,emailNotifications: false);
}

