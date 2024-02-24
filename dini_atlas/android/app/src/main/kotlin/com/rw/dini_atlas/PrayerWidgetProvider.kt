package com.rw.dini_atlas
import android.appwidget.AppWidgetProvider
import android.appwidget.AppWidgetManager
import android.content.Context
import android.util.Log

class PrayerWidgetProvider : AppWidgetProvider(){
    override fun onUpdate(
        context: Context?,
        appWidgetManager: AppWidgetManager?,
        appWidgetIds: IntArray?
    ) {
        super.onUpdate(context, appWidgetManager, appWidgetIds)
        Log.d("APP_WIDGET_PLUGIN", "ON_UPDATE")
        if (appWidgetIds != null) {
            for (widgetId in appWidgetIds) {
                Log.d("APP_WIDGET_PLUGIN", "WIDGET_ID: $widgetId")
            }
        }
    }
}