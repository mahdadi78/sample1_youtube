import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider_base_tools/provider_base_tools.dart';
import 'package:sample1_youtube/Provider/theme_lang_provider.dart';

class Marquee1 extends StatelessWidget {
  const Marquee1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 25,
        child: Marquee(
          text: AppLocalizations.of(context)!.marquee,
          style: Theme.of(context).textTheme.labelSmall,
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          blankSpace: 70.0,
          textDirection:
              provider.isEnglish ? TextDirection.ltr : TextDirection.rtl,
          velocity: 70.0,
          pauseAfterRound: const Duration(seconds: 2),
          startPadding: 30.0,
          accelerationDuration: const Duration(seconds: 10),
          accelerationCurve: Curves.linear,
          decelerationDuration: const Duration(milliseconds: 3000),
          decelerationCurve: Curves.linear,
        ),
      ),
    );
  }
}
