import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

/// Editorial wordmark: serif italic "Skill" + lime swap-glyph + serif italic
/// "Swap". The glyph (·) is the one point of color — it carries the whole
/// brand. Sits like a magazine masthead, not a tech logo.
class AppLogo extends StatelessWidget {
  const AppLogo._({this.size = 28});

  /// Big wordmark for sign-in / sign-up / splash.
  const AppLogo.large() : this._(size: 38);

  /// Compact wordmark for floating top-left placement.
  const AppLogo.compact() : this._(size: 20);

  final double size;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final ink = scheme.onSurface;

    TextStyle word(Color color) => GoogleFonts.fraunces(
          fontSize: size,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          letterSpacing: -size * 0.025,
          color: color,
          height: 1.0,
        );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Skill', style: word(ink)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size * 0.14),
          child: Container(
            width: size * 0.42,
            height: size * 0.42,
            decoration: const BoxDecoration(
              color: AppColors.sunburst500,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Container(
              width: size * 0.18,
              height: size * 0.18,
              decoration: BoxDecoration(
                color: ink,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Text('Swap', style: word(ink)),
      ],
    );
  }
}
