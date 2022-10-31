import 'package:flutter/material.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/data/model/meme/meme_model.dart';
import 'package:game/ui/module/collection_page/widgets/animated_cutout_overlay.dart';
import 'package:game/ui/module/collection_page/widgets/swipe_detector.dart';
import 'package:game/ui/common/meme_card/meme_card.dart';

class MemeGallery extends StatefulWidget {
  final List<MemeModel> memeCollection;

  const MemeGallery({
    required this.memeCollection,
    super.key,
  });

  @override
  State<MemeGallery> createState() => _MemeGalleryState();
}

class _MemeGalleryState extends State<MemeGallery> {
  static const int _gridSize = 5;
  // Index starts in the middle of the grid (eg, 25 items, index will start at 13)
  int _index = 0;
  Offset _lastSwipeDir = Offset.zero;
  final double _scale = 1;
  bool _skipNextOffsetTween = false;
  Duration swipeDuration = const Duration(milliseconds: 300);
  final _memeIds = ValueNotifier<List<MemeModel>>([]);
  int get _imgCount => widget.memeCollection.length;

  @override
  void initState() {
    super.initState();
    _initPhotoIds();
  }

  Future<void> _initPhotoIds() async {
    setState(() => _memeIds.value = widget.memeCollection);
  }

  void _setIndex(int value, {bool skipAnimation = false}) {
    if (value < 0 || value >= _imgCount) return;

    _skipNextOffsetTween = skipAnimation;

    setState(() => _index = value);
  }

  Offset _calculateCurrentOffset(double padding, Size size) {
    double halfCount = (_gridSize / 2).floorToDouble();
    Size paddedImageSize = Size(size.width + padding, size.height + padding);

    final originOffset = Offset(
        halfCount * paddedImageSize.width, halfCount * paddedImageSize.height);

    int col = _index % _gridSize;
    int row = (_index / _gridSize).floor();
    final indexedOffset =
        Offset(-paddedImageSize.width * col, -paddedImageSize.height * row);
    return originOffset + indexedOffset;
  }

  void _handleSwipe(Offset dir) {
    int newIndex = _index;
    if (dir.dy != 0) newIndex += _gridSize * (dir.dy > 0 ? -1 : 1);
    if (dir.dx != 0) newIndex += (dir.dx > 0 ? -1 : 1);

    if (newIndex < 0 || newIndex > _imgCount - 1) {
      return;
    }
    if (dir.dx < 0 && newIndex % _gridSize == 0) {
      return;
    }
    if (dir.dx > 0 && newIndex % _gridSize == _gridSize - 1) {
      return;
    }
    _lastSwipeDir = dir;

    _setIndex(newIndex);
  }

  Future<void> _handleImageTapped(int index) async {
    _setIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    Size imgSize =
        (const Size(MemeCard.cardWidth, MemeCard.cardHeight)) * _scale;
    const padding = 10.0;
    var gridOffset = _calculateCurrentOffset(padding, imgSize);
    gridOffset += Offset(0, -MediaQuery.of(context).padding.top / 2);
    final offsetTweenDuration =
        _skipNextOffsetTween ? Duration.zero : swipeDuration;
    final cutoutTweenDuration =
        _skipNextOffsetTween ? Duration.zero : swipeDuration * .5;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: AnimatedCutoutOverlay(
        animationKey: ValueKey(_index),
        cutoutSize: imgSize,
        swipeDir: _lastSwipeDir,
        duration: cutoutTweenDuration,
        opacity: _scale == 1 ? .7 : .5,
        child: SafeArea(
          bottom: false,
          child: OverflowBox(
            maxWidth: _gridSize * imgSize.width + padding * (_gridSize - 1),
            maxHeight: _gridSize * imgSize.height + padding * (_gridSize - 1),
            alignment: Alignment.center,
            child: EightWaySwipeDetector(
              onSwipe: _handleSwipe,
              threshold: 30,
              child: TweenAnimationBuilder<Offset>(
                tween: Tween(begin: gridOffset, end: gridOffset),
                duration: offsetTweenDuration,
                curve: Curves.easeOut,
                builder: (_, value, child) =>
                    Transform.translate(offset: value, child: child),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: _gridSize,
                  childAspectRatio: imgSize.aspectRatio,
                  mainAxisSpacing: padding,
                  crossAxisSpacing: padding,
                  children: List.generate(
                      _imgCount, (i) => _buildImage(i, swipeDuration, imgSize)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(int index, Duration swipeDuration, Size imgSize) {
    bool selected = index == _index;

    return MergeSemantics(
      child: Semantics(
        focused: selected,
        liveRegion: selected,
        onIncrease: () => _handleImageTapped(_index + 1),
        onDecrease: () => _handleImageTapped(_index - 1),
        child: GestureDetector(
          onTap: () {
            _handleImageTapped(index);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: SizedBox(
              width: imgSize.width,
              height: imgSize.height,
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                tween: Tween(begin: 1, end: 1),
                builder: (_, value, child) =>
                    Transform.scale(scale: value, child: child),
                child: MemeCard(meme: widget.memeCollection[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
