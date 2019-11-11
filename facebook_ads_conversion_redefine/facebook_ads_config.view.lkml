# Facebook Ads configuration for Marketing Analytics by Looker

include: "/app-marketing-facebook-ads-adapter/*.view"
include: "/app-marketing-facebook-ads/*.view"
include: "/app-marketing-facebook-ads/*.dashboard"
include: "facebook_actions.view"
include: "facebook_action_values.view"

# TODO: Update datagroup policy
datagroup: facebook_ads_etl_datagroup {
  sql_trigger: SELECT COUNT(*) FROM `facebook_ads_for_looker.ads_insights` ;;
  max_cache_age: "24 hours"
}

view: facebook_ads_config {
  extension: required

  # TODO: Update Facebook Ads schema
  dimension: facebook_ads_schema {
    hidden: yes
    sql:facebook_ads_for_looker;;
  }
}

view: fb_adcreative {
  extends: [adcreative_fb_adapter]
  # Customize: Add adcreative fields
}

view: fb_ad {
  extends: [ad_fb_adapter]
  # Customize: Add ad fields
}

view: fb_adset {
  extends: [adset_fb_adapter]
  # Customize: Add ad group fields
}

view: fb_campaign {
  extends: [campaign_fb_adapter]
  # Customize: Add campaign fields
}

view: fb_account {
  extends: [account_fb_adapter]
  # Customize: Add customer fields
}

view: fb_ad_metrics_base {
  extends: [fb_ad_metrics_base_template]
  # Customize: Add metrics or customize drills / labels / descriptions
}

# Ad Creative Aggregation
explore: fb_ad_impressions {
  extends: [fb_ad_impressions_template]

  join: actions {
    from: actions_fb_custom
    view_label: "Impressions"
    type: left_outer
    sql_on: ${fact.ad_id} = ${actions.ad_id} AND
      ${fact._date} = ${actions._date} AND
      # TODO: Set action_type equal to specific action_type(s)
      ${actions.action_type}  =  _________________ ;;
    relationship: one_to_many
  }
}

view: fb_ad_impressions {
  extends: [fb_ad_impressions_template]

  measure: total_conversions {
    type: number
    sql: ${action_1_d_view} + ${action_28_d_click} ;;
  }

  measure: action_1_d_view {
    hidden: yes
    type: sum
    sql: ${actions._1_d_view} ;;
  }
  measure: action_28_d_click {
    hidden: yes
    type: sum
    sql: ${actions._28_d_click} ;;
  }

  dimension: conversions {
    # TODO: Set action_type equal to specific action_type(s)
    sql: if(${actions.action_type} = _________________, ${actions.value}, null) ;;
  }
}

# Hourly Age and Gender Aggregation
explore: fb_ad_impressions_age_and_gender {
  extends: [fb_ad_impressions_age_and_gender_template]

  join: actions {
    from: actions_age_and_gender_fb_custom
    view_label: "Impressions"
    type: left_outer
    # TODO: Set action_type equal to specific action_type(s)
    sql_on: ${fact.ad_id} = ${actions.ad_id} AND
      ${fact._date} = ${actions._date} AND
      ${actions.action_type}  = _________________ ;;
    relationship: one_to_many
  }
}

view: fb_ad_impressions_age_and_gender {
  extends: [fb_ad_impressions_age_and_gender_template]

  measure: total_conversions {
    type: number
    sql: ${action_1_d_view} + ${action_28_d_click} ;;
  }

  measure: action_1_d_view {
    hidden: yes
    type: sum
    sql: ${actions._1_d_view} ;;
  }
  measure: action_28_d_click {
    hidden: yes
    type: sum
    sql: ${actions._28_d_click} ;;
  }

  dimension: conversions {
    # TODO: Set action_type equal to specific action_type(s)
    sql: if(${actions.action_type} = _________________, ${actions.value}, null) ;;
  }
}

# Hourly Geo Aggregation
explore: fb_ad_impressions_geo {
  extends: [fb_ad_impressions_geo_template]

  join: actions {
    from: actions_region_fb_custom
    view_label: "Impressions"
    type: left_outer
    
    # TODO: Set action_type equal to specific action_type(s). Something like this is common: 
    sql_on: ${fact.ad_id} = ${actions.ad_id} AND
      ${fact._date} = ${actions._date} AND
      ${actions.action_type}  = _________________ ;;
    relationship: one_to_many
  }
}

view: fb_ad_impressions_geo {
  extends: [fb_ad_impressions_geo_template]

  measure: total_conversions {
    type: number
    sql: ${action_1_d_view} + ${action_28_d_click} ;;
  }

  measure: action_1_d_view {
    hidden: yes
    type: sum
    sql: ${actions._1_d_view} ;;
  }
  measure: action_28_d_click {
    hidden: yes
    type: sum
    sql: ${actions._28_d_click} ;;
  }

  dimension: conversions {
    # TODO: Set action_type equal to specific action_type(s)
    sql: if(${actions.action_type} = _________________, ${actions.value}, null) ;;
  }
}

# Hourly Platform and Device Aggregation
explore: fb_ad_impressions_platform_and_device {
  extends: [fb_ad_impressions_platform_and_device_template]

  join: actions {
    from: actions_platform_and_device_fb_custom
    view_label: "Impressions"
    type: left_outer
    # TODO: Set action_type equal to specific action_type(s)
    sql_on: ${fact.ad_id} = ${actions.ad_id} AND
      ${fact._date} = ${actions._date} AND
      ${actions.action_type}  = _________________;;
    relationship: one_to_many
  }
}

view: fb_ad_impressions_platform_and_device {
  extends: [fb_ad_impressions_platform_and_device_template]

  measure: total_conversions {
    type: number
    sql: ${action_1_d_view} + ${action_28_d_click} ;;
  }

  measure: action_1_d_view {
    hidden: yes
    type: sum
    sql: ${actions._1_d_view} ;;
  }
  measure: action_28_d_click {
    hidden: yes
    type: sum
    sql: ${actions._28_d_click} ;;
  }

  dimension: conversions {
    # TODO: Set action_type equal to specific action_type(s)
    sql: if(${actions.action_type} = _________________, ${actions.value}, null) ;;
  }
}
