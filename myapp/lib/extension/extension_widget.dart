import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationHelper on Widget {
  AppLocalizations l10n(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}