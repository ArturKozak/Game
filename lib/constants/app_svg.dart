class AppIcons {
  const AppIcons._();

  static const _base = 'assets/image/';

  static String _fullSvgPath(String name) => '$_base$name.svg';

  static final crystal = _fullSvgPath('crystal');
  static final common = _fullSvgPath('common');
  static final uncommon = _fullSvgPath('uncommon');
  static final rare = _fullSvgPath('rare');
  static final epic = _fullSvgPath('epic');
  static final legendary = _fullSvgPath('legendary');
  static final teddyAttr = _fullSvgPath('teddy');
  static final notesAttr = _fullSvgPath('notes');
  static final heartAttr = _fullSvgPath('heart');
  static final lanternAttr = _fullSvgPath('lantern');
    static final powerAttr = _fullSvgPath('power');
}
