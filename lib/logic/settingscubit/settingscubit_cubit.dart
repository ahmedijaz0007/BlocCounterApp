import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settingscubit_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(SettingsState(appNotifications: false, emailNotifications: false));

   onToggleAppNotifications(bool newValue) {
    return  emit (state.copyWith(appNotifications: newValue));
   }
  onToggleEmailNotifications(bool newValue) {
    return  emit (state.copyWith(emailNotifications: newValue));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toMap();
  }
}
