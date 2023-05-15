
part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentThemeEvent extends ThemeEvent {}

class ThemeChangedEvent extends ThemeEvent {
  final AppTheme theme;
  const ThemeChangedEvent({
    required this.theme,
  });
  @override
  List<Object> get props => [theme];
}
