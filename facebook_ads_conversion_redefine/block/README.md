
# Facebook Ads Block, Config Template by Looker

### Summary:
Instruction of how to edit the definition of Conversions inside the [Facebook Ads Block] (https://github.com/looker/block-facebook-ads)

### How-To:
The views and explores for fb_ad_impressions, fb_ad_impressions_age_and_gender, fb_ad_impressions_geo, 
and fb_ad_impressions_platform_and_device have been modified to allow for action_type filtering.

To filter for a specific action_type(s), set the `${actions.action_type}` field equal to your preferred action type(s)
in the `sql_on:` parameters for both the actions and action_values joins. Do this for the fb_ad_impressions,
fb_ad_impressions_age_and_gender, fb_ad_impressions_geo, and fb_ad_impressions_platform_and_device explores.


```
explore: fb_ad_impressions_config {
  hidden: no
  group_label: "Block Facebook Ads"
  extension: required
  extends: [fb_ad_impressions_template]

join: actions {
     from: actions_fb_custom
     view_label: "Impressions"
     type: left_outer
     sql_on: ${fact.ad_id} = ${actions.ad_id} AND
       ${fact._date} = ${actions._date} AND
       ${actions.action_type}  = '______' ;;
     relationship: one_to_one
  }
```

Then, in the corresponding view files, replace the blank spaces in the `offsite_conversion_value` and dimensions with
the appropriate action types.

```
  dimension: offsite_conversion_value {
     hidden: yes
     type: number
     sql: if(${action_type} = "test", ${value}, null) ;;
  }

```

You can look up the values of action_type with this query:
```
select distinct action_type, count (*) from <schema_name>.ads_insights_platform_and_device_actions 
group by 1
```
