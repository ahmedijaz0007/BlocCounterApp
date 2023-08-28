part of 'settingscubit_cubit.dart';

class SettingsState {
 final bool appNotifications;
 final bool emailNotifications;
  SettingsState({required this.appNotifications, required this.emailNotifications});

  SettingsState copyWith({bool? appNotifications, bool? emailNotifications}){
    return SettingsState(appNotifications: appNotifications ?? this.appNotifications, emailNotifications: emailNotifications ?? this.emailNotifications);
  }

 Map<String, dynamic> toMap() {
    return {
      'appNotifications': appNotifications,
      'emailNotifications': emailNotifications,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      appNotifications: map['appNotifications'] as bool,
      emailNotifications: map['emailNotifications'] as bool,
    );
  }
}

class SettingsInitial extends SettingsState {
  SettingsInitial():super(appNotifications: false,emailNotifications: false);
}

