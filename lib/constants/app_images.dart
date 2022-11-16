class AppImages {
  static const _base = 'assets/rive/';

  static String _fullSvgPath(String name) => '$_base$name.riv';

  static final newGame = _fullSvgPath('new_game');
  static final joinToGame = _fullSvgPath('join_to_game');
  static final collection = _fullSvgPath('collection');
  static final pigeons = _fullSvgPath('pigeons_button');
  static final logo = _fullSvgPath('logo');
  static final account = _fullSvgPath('account');
}
