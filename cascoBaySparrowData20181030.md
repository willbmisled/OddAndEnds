cascoBaySparrowData20181030
================
bryan
October 29, 2018

Introduction
------------

-   Whitley Gilbert has requested the MRB1 sparrow data for three sites (see below).
-   Sites will be interesected with MRB1 catchments to determine the closest flowline (results checked in arcMap)
-   Flowline COMID will be used to extract the N & P loads from the MRB1 SPARROW model
-   Correspondence from Whitley below:

<!-- -->

    From: Whitley Gray [mailto:whitley.gilbert@maine.edu] 
    Sent: Wednesday, October 24, 2018 10:13 AM
    To: Milstead, Bryan <Milstead.Bryan@epa.gov>
    Cc: Liebman, Matt <Liebman.Matt@epa.gov>; Damian Brady <damian.brady@maine.edu>
    Subject: Re: Casco Bay nitrogen loading estimates
     
    Hi Bryan,
     
    Wanted to follow up on the possibility of rerunning the Casco Bay specific sparrow model using the 
    2017-2018 Nitrogen sampling locations. My previous Presumpscot River TN loading estimate 
    (~400,000 kg/year) was incorrect due to a simple calculation error so I'd like to see how my new 
    estimate (~175,000 kg/year) will compare to the sparrow estimate at my sampling location. I know 
    that there are a couple point source outfalls down stream of my sampling site and the DEP's TN 
    concentrations from sampling at Walton Park/Presumpscot Falls Park, collected on the same days, 
    are higher so I'm eager to see if a sparrow estimate run from my sampling locations will be similar 
    to my loading estimate.
     
    Hope all is well and I look forward to hearing from you!
     
    Best,
    Whitley

    Sent: Thursday, October 25, 2018 10:35 AM
    Sample site coordinates:

    Presumpscot River: 43.6869534, -70.3472226
    Royal River: 43.7991590,-70.1782698
    Capisic Brook: 43.670431, -70.30850

Output
------

-   Data are available here: <https://github.com/willbmisled/OddAndEnds/blob/master/output/casco_bay_sparrow_data.csv>
    -   Note: to download the data follow the link above. From the github page right click on the "RAW" tab and choose "Save target as...". This will allow you to download the csv file to your directory.
-   This document is available here: <https://github.com/willbmisled/OddAndEnds/blob/master/cascoBaySparrowData20181030.md>
-   The code is available here: <https://github.com/willbmisled/OddAndEnds/blob/master/cascoBaySparrowData20181030.Rmd>
-   Below are the data tables for total nitrogen and incremental nitrogen for the study sites and the data definitions.

### Total Nitrogen Load for Flowline

| site              |    comid|        cfs|    n\_total|  n\_sewer|  n\_corn\_soy\_alf\_fert|       n\_tin|    n\_manure|  n\_develop|  n\_other\_fert|
|:------------------|--------:|----------:|-----------:|---------:|------------------------:|------------:|------------:|-----------:|---------------:|
| Royal River       |  6722249|   275.8868|   98228.120|      0.00|              5454.122457|   30218.1993|   7081.34693|   43992.547|      11481.9042|
| Capisic Brook     |  6721495|     3.8242|    6299.374|      0.00|                 5.246544|     460.2377|     10.31095|    5808.964|         14.6148|
| Presumpscot River |  6721459|  1136.7064|  451438.690|  79995.68|             14074.922239|  136199.9859|  13572.56019|  180752.891|      26842.6526|

### Incremental Nitrogen Load for Flowline

| site              |    comid|        cfs|  n\_total\_inc|  n\_sewer\_inc|  n\_corn\_soy\_alf\_fert\_inc|  n\_tin\_inc|  n\_manure\_inc|  n\_develop\_inc|  n\_other\_fert\_inc|
|:------------------|--------:|----------:|--------------:|--------------:|-----------------------------:|------------:|---------------:|----------------:|--------------------:|
| Royal River       |  6722249|   275.8868|       4717.125|           0.00|                     21.534475|     524.6902|        34.26568|         4076.648|             59.98655|
| Capisic Brook     |  6721495|     3.8242|       6420.726|           0.00|                      5.347613|     469.1037|        10.50958|         5920.868|             14.89634|
| Presumpscot River |  6721459|  1136.7064|      86769.968|       79995.68|                     10.630866|     517.0644|        19.12450|         6197.857|             29.61340|

### Data Definitions

<table style="width:100%;">
<colgroup>
<col width="28%" />
<col width="10%" />
<col width="61%" />
</colgroup>
<thead>
<tr class="header">
<th>name</th>
<th>units</th>
<th>definition</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>site</td>
<td>No Units</td>
<td>Sample site</td>
</tr>
<tr class="even">
<td>comid</td>
<td>No Units</td>
<td>The flowline (reach) identification code.</td>
</tr>
<tr class="odd">
<td>cfs</td>
<td>ft3/s</td>
<td>The mean flow of the reach. [mean_flow] is the name of the variable defined by the control variable mean_flow. NOTE: M3/year=([TOT_CFS]*893593).</td>
</tr>
<tr class="even">
<td>n_total</td>
<td>kg/yr</td>
<td>Predicted total nitrogen flux leaving the reach. Estimates are corrected for retransformation bias caused by the model residuals but are not corrected for bias caused by sampling error in the coefficient estimates.</td>
</tr>
<tr class="odd">
<td>n_sewer</td>
<td>kg/yr</td>
<td>Predicted flux leaving the reach attributed to nitrogen mass in permitted wastewater discharge.</td>
</tr>
<tr class="even">
<td>n_corn_soy_alf_fert</td>
<td>kg/yr</td>
<td>Predicted flux leaving the reach attributed to nitrogen mass in commercial fertilizer applied to agricultural land in corn / soybeans / alfalfa.</td>
</tr>
<tr class="odd">
<td>n_tin</td>
<td>kg/yr</td>
<td>Predicted flux leaving the reach attributed to wet deposition of inorganic nitrogen (ammonia and nitrate).</td>
</tr>
<tr class="even">
<td>n_manure</td>
<td>kg/yr</td>
<td>Predicted flux leaving the reach attributed to nitrogen mass in manure from livestock production.</td>
</tr>
<tr class="odd">
<td>n_develop</td>
<td>kg/yr</td>
<td>Predicted flux leaving the reach attributed to nitrogen mass from developed lands.</td>
</tr>
<tr class="even">
<td>n_other_fert</td>
<td>kg/yr</td>
<td>Predicted flux leaving the reach attributed to nitrogen mass in commercial fertilizer applied to agricultural land in other crops.</td>
</tr>
<tr class="odd">
<td>n_total_inc</td>
<td>kg/yr</td>
<td>Predicted nitrogen total flux generated within the reach’s incremental watershed. Estimates receive an adjustment for stream attenuation within the reach.</td>
</tr>
<tr class="even">
<td>n_sewer_inc</td>
<td>kg/yr</td>
<td>Predicted total flux generated within the reach’s incremental watershed and attributed to nitrogen mass in permitted wastewater discharge.</td>
</tr>
<tr class="odd">
<td>n_corn_soy_alf_fert_inc</td>
<td>kg/yr</td>
<td>Predicted total flux generated within the reach’s incremental watershed and attributed to nitrogen mass in commercial fertilizer applied to agricultural land in corn / soybeans / alfalfa.</td>
</tr>
<tr class="even">
<td>n_tin_inc</td>
<td>kg/yr</td>
<td>Predicted total flux generated within the reach’s incremental watershed and attributed to wet deposition of inorganic nitrogen (ammonia and nitrate).</td>
</tr>
<tr class="odd">
<td>n_manure_inc</td>
<td>kg/yr</td>
<td>Predicted total flux generated within the reach’s incremental watershed and attributed to nitrogen mass in manure from livestock production.</td>
</tr>
<tr class="even">
<td>n_develop_inc</td>
<td>kg/yr</td>
<td>Predicted total flux generated within the reach’s incremental watershed and attributed to nitrogen mass from developed lands.</td>
</tr>
<tr class="odd">
<td>n_other_fert_inc</td>
<td>kg/yr</td>
<td>Predicted total flux generated within the reach’s incremental watershed and attributed to nitrogen mass in commercial fertilizer applied to agricultural land in other crops.</td>
</tr>
</tbody>
</table>
