import 'package:bloc/bloc.dart';

part 'settingscubit_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState(appNotifications: false, emailNotifications: false));

   onToggleAppNotifications(bool newValue) {
    return  emit (state.copyWith(appNotifications: newValue));
   }
  onToggleEmailNotifications(bool newValue) {
    return  emit (state.copyWith(emailNotifications: newValue));
  }
}
