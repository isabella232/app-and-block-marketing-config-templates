# Marketing Analytics, Facebook Ads Config Template by Looker

### Summary:
Configuration LookML files meant to be used alongside the standard Marketing Analytics Configuration files found below:
https://github.com/looker/app-marketing-config

### Includes:
- `facebook_ads_config.view.lkml`: modified version of the standard facebook_ads_config.view.lkml file
- `facebook_actions.view.lkml`: views for Facebook action tables 
- `facebook_action_values.view.lkml`: views for Facebook action value tables

### How-To:
The views and explores for fb_ad_impressions, fb_ad_impressions_age_and_gender, fb_ad_impressions_geo, 
and fb_ad_impressions_platform_and_device have been modified to allow for action_type filtering.

To filter for a specific action_type(s), set the `${actions.action_type}` field equal to your preferred action type(s)
in the `sql_on:` parameters for both the actions and action_values joins. Do this for the fb_ad_impressions,
fb_ad_impressions_age_and_gender, fb_ad_impressions_geo, and fb_ad_impressions_platform_and_device explores.


```
explore: fb_ad_impressions {
  extends: [fb_ad_impressions_template]

  join: actions {
    from: actions_fb_custom
    view_label: "Impressions"
    type: left_outer
    sql_on: ${fact.ad_id} = ${actions.ad_id} AND
      ${fact._date} = ${actions._date} AND
      ${fact.breakdown} = ${actions.breakdown} AND
      ${actions.action_type}  = '_________________' ;;
    relationship: one_to_one
  }

  join: action_values {
    from: action_values_fb_custom
    view_label: "Impressions"
    type: left_outer
    sql_on: ${fact.ad_id} = ${action_values.ad_id} AND
      ${fact._date} = ${action_values._date} AND
      ${fact.breakdown} = ${action_values.breakdown} AND
      ${action_values.action_type}  = '_________________' ;;
    relationship: one_to_one
  }
}
```

Then, in the corresponding view files, replace the blank spaces in the `conversion` and `conversionvalue` dimensions with
the appropriate action types.

```
 dimension: conversions {
    sql: if(${actions.action_type} = '_________________', ${actions.value}, null) ;;
  }

  dimension: conversionvalue {
    sql: if(${action_values.action_type} = '_________________', ${action_values.value}, null) ;;
  }
```

You can look up the values of action_type with this query:
```
select distinct action_type, count (*) from <schema_name>.ads_insights_platform_and_device_actions 
group by 1
```
