import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_constants.dart';

class NewGameKeyInfo extends PageWidget {
  const NewGameKeyInfo({super.key});

  @override
  Widget widgetBody(BuildContext context, Size size) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(
          AppConstants.smallPadding * 2,
          0,
          AppConstants.smallPadding * 2,
          0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: size.height * 0.08,
              decoration: BoxDecoration(
                color: const Color(0xFF48416C),
                boxShadow: const [AppColors.darkShadow],
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              ),
              child: const Align(
                alignment: AlignmentDirectional(0, 0),
                child: SelectionArea(
                    child: Text(
                  'Some code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppConstants.smallPadding),
              child: Text(
                'You must send a unique key to your friends so they can join you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
