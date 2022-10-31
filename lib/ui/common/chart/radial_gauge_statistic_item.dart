import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGaugeStatisticItem extends PageWidget {
  static const _maxPoint = 20;
  static const _globalAngle = 90.0;
  static const _firstlAngle = 124.0;
  static const _secondAngle = 54.0;
  static const _positionFactor = 1.6;
  static const _markerSize = 14.0;
  static const _bottomPadding = 5.0;
  static const _gaugeHeight = 100.0;
  static const _gaugeWidth = 85.0;
  static const _widthStroke = 8.0;

  final double stat;
  final Color color;
  final bool enableLoadingAnimation;
  final String? point;

  const RadialGaugeStatisticItem({
    required this.stat,
    required this.color,
    this.enableLoadingAnimation = false,
    this.point,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: _bottomPadding),
      child: SizedBox(
        width: _gaugeWidth,
        height: _gaugeHeight,
        child: SfRadialGauge(
          enableLoadingAnimation: enableLoadingAnimation,
          axes: <RadialAxis>[
            RadialAxis(
              showLabels: false,
              showTicks: false,
              radiusFactor: 0.8,
              maximum: _maxPoint.toDouble(),
              axisLineStyle: const AxisLineStyle(
                cornerStyle: CornerStyle.startCurve,
                thickness: 7,
                color: AppColors.darkBackColor,
              ),
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  angle: _globalAngle,
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        stat.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: color,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        point ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: color,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const GaugeAnnotation(
                  angle: _firstlAngle,
                  positionFactor: _positionFactor,
                  widget: Text(
                    '0',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.lightBackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                GaugeAnnotation(
                  angle: _secondAngle,
                  positionFactor: _positionFactor,
                  widget: Text(
                    _maxPoint.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.lightBackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
              pointers: <GaugePointer>[
                RangePointer(
                  value: stat,
                  width: _widthStroke,
                  pointerOffset: -1,
                  cornerStyle: CornerStyle.bothCurve,
                  color: color,
                ),
                MarkerPointer(
                  markerHeight: _markerSize,
                  markerWidth: _markerSize,
                  borderWidth: 2,
                  borderColor: Colors.white,
                  value: stat,
                  color: AppColors.activeColor,
                  markerType: MarkerType.circle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
