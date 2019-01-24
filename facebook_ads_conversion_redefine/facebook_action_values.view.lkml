include: "/app-marketing-facebook-ads-adapter/*.view"

view: action_values_fb_custom {
  extends: [actions_fb_adapter]
  sql_table_name:  {{ actions.facebook_ads_schema._sql }}.ads_insights_action_values ;;
}

view: action_values_age_and_gender_fb_custom {
  extends: [actions_age_and_gender_fb_adapter]
  sql_table_name:  {{ actions.facebook_ads_schema._sql }}.ads_insights_age_and_gender_action_values ;;
}

view: action_values_hour_fb_custom {
  extends: [actions_hour_fb_adapter]
  sql_table_name:  {{ actions.facebook_ads_schema._sql }}.ads_insights_hour_action_values ;;
}

view: action_values_platform_and_device_fb_custom {
  extends: [actions_platform_and_device_fb_adapter]
  sql_table_name:  {{ actions.facebook_ads_schema._sql }}.ads_insights_platform_and_device_action_values ;;
}

view: action_values_region_fb_custom {
  extends: [actions_region_fb_adapter]
  sql_table_name:  {{ actions.facebook_ads_schema._sql }}.ads_insights_region_action_values ;;
}
