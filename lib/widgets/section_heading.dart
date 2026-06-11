import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading(
    this.text, {
    super.key,
    this.padding = const EdgeInsets.only(left: 4, bottom: 8),
  });

  final String text;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: padding,
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: scheme.onSurfaceVariant,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
