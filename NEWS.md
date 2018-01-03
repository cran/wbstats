# wbstats 0.2.0
## Bug fixes:
* `wbdatacatalog()` now returns all catalog entries instead of first 10
* When only Namibia is queried the iso2c column now returns `"NA"` instead of logical `NA`
* For some indicators `wb()` queries would return iso3c IDs in the iso2c column. This is a behavior
  of the world bank API. This is now properly handled.
* Indicators from source `WDI Database Archives` are now accessible

## Changes:
* Now uses Version 2 of the World Bank API.

    This new version of the API returns some new columns the old version didn't. 
    Including data of last update for all available data sources
    This version also provides access to over 700 indicators that were moved to the `WDI Database Archives`.
    These indicators are not available using the older API

* added the parameter `return_wide` to `wb()` allowing data returns to be formatted
  in a wide format with each queried indicator being its own column named by its
  corresponding `indicatorID`.
  
    This added functionality was done by importing the `tidyr` package and using `tidyr::spread_`.
    While it is not ideal to add a dependency for one feature I believe the
    `tidyr` and other `tidyverse` packages are inline with future `wbstats` features and are now
    common enough that the added dependency is worth the addition.

* More explicit error messaging when encountering API call errors

* update cached data in `wb_cachelist`


# wbstats 0.1.1
## Changes:
* Add 'aggregates' and 'countries_only' options to `wb()` per bapfeld pr
* update cached data in `wb_cachelist`

