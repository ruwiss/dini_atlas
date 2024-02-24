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

        // check if widgetId store sharedPreferences
        // fetch data from sharedPreferences
        // then update
//        for (widgetId in appWidgetIds!!) {
//            val remoteViews = RemoteViews(context!!.packageName, R.layout.example_layout).apply() {
//                setTextViewText(R.id.widget_title, "Widget Title")
//                setTextViewText(R.id.widget_message, "This is my message")
//            }
//
//            appWidgetManager!!.partiallyUpdateAppWidget(widgetId, remoteViews)
//        }
    }
}