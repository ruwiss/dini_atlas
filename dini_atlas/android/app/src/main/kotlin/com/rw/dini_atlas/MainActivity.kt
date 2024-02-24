package com.rw.dini_atlas

import io.flutter.embedding.android.FlutterActivity
import tech.noxasch.app_widget.AppWidgetPlugin

class MainActivity: FlutterActivity() {
    override fun onFlutterUiDisplayed() {
        super.onFlutterUiDisplayed()

        AppWidgetPlugin.Companion.handleWidgetAction(context, intent)
    }
}