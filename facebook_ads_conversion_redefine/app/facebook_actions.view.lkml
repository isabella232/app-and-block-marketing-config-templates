include: "/app-marketing-facebook-ads-adapter/*.view"

view: actions_fb_custom {
  extends: [actions_fb_adapter]
  sql_table_name:  {{ actions.facebook_ads_schema._sql }}.ads_insights_actions ;;
}

view: actions_age_and_gender_fb_custom {
  extends: [actions_age_and_gender_fb_adapter]
  sql_table_name:  {{ actions.facebook_ads_schema._sql }}.ads_insights_age_and_gender_actions ;;
}

view: actions_hour_fb_custom {
  extends: [actions_hour_fb_adapter]
  sql_table_name:  {{ actions.facebook_ads_schema._sql }}.ads_insights_hour_actions ;;
}

view: actions_platform_and_device_fb_custom {
  extends: [actions_platform_and_device_fb_adapter]
  sql_table_name:  {{ actions.facebook_ads_schema._sql }}.ads_insights_platform_and_device_actions ;;
}

view: actions_region_fb_custom {
  extends: [actions_region_fb_adapter]
  sql_table_name:  {{ actions.facebook_ads_schema._sql }}.ads_insights_region_actions ;;
}
