import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_bar_state.dart';

class TabBarCubit extends Cubit<String> {
  TabBarCubit() : super('Tips');

  onTabChanged(String currentTab) => emit(currentTab);
}
