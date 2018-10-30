Untitled
================

| First Header | Second Header |
|--------------|---------------|
| Content Cell | Content Cell  |
| Content Cell | Content Cell  |

### Putting it all together

-   test

<table>
<colgroup>
<col width="18%" />
<col width="15%" />
<col width="12%" />
<col width="53%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Field</strong></th>
<th><strong>Source</strong></th>
<th><strong>Units</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>year</strong></td>
<td>lmorpho</td>
<td>YYYY</td>
<td>year sample of NLA survey (2007 or 2012)</td>
</tr>
<tr class="even">
<td><strong>comid</strong></td>
<td>lmorpho</td>
<td>integer</td>
<td>nhdplus comid from the lmorpho dataset</td>
</tr>
<tr class="odd">
<td><strong>nla_id</strong></td>
<td>nla design</td>
<td>character</td>
<td>unique identifiers for the NLA lakes</td>
</tr>
<tr class="even">
<td><strong>visit_no</strong></td>
<td>nla design</td>
<td>integer</td>
<td>1 == first visit to lake; 2 == 2nd visit (a subset)</td>
</tr>
<tr class="odd">
<td><strong>sample_date</strong></td>
<td>nla design</td>
<td>YYYY-MM-DD</td>
<td>date of lake visit</td>
</tr>
<tr class="even">
<td><strong>lon_dd</strong></td>
<td>nla design</td>
<td>NAD83 dd</td>
<td>longitude of sample location (not exact)</td>
</tr>
<tr class="odd">
<td><strong>lat_dd</strong></td>
<td>nla design</td>
<td>NAD83 dd</td>
<td>latitude of sample location (not exact)</td>
</tr>
<tr class="even">
<td><strong>temperature_mean_2m</strong></td>
<td>nla profile</td>
<td>degrees C</td>
<td>mean temperature for depth &lt;= 2 m</td>
</tr>
<tr class="odd">
<td><strong>temperature_n</strong></td>
<td>nla profile</td>
<td>integer</td>
<td>number of observations used for &quot;temperature_mean_2m&quot;</td>
</tr>
<tr class="even">
<td><strong>tmin_dm30:tmin_dm1</strong></td>
<td>prism</td>
<td>degrees C</td>
<td>&quot;tmin&quot; = estimated minimum air temperature; &quot;dm?&quot; == sample_date minus (30:1) days</td>
</tr>
<tr class="odd">
<td><strong>tmin_d0</strong></td>
<td>prism</td>
<td>degrees C</td>
<td>&quot;tmin&quot; = estimated minimum air temperature for sample_date</td>
</tr>
<tr class="even">
<td><strong>tmax_dm30:tmax_dm1</strong></td>
<td>prism</td>
<td>degrees C</td>
<td>&quot;tmax&quot; = estimated maximum air temperature; &quot;dm?&quot; == sample_date minus (30:1) days</td>
</tr>
<tr class="odd">
<td><strong>tmax_d0</strong></td>
<td>prism</td>
<td>degrees C</td>
<td>&quot;tmin&quot; = estimated maximum air temperature for sample_date</td>
</tr>
<tr class="even">
<td><strong>tmean_dm30:tmean_dm1</strong></td>
<td>prism</td>
<td>degrees C</td>
<td>&quot;tmean&quot; = estimated mean air temperature; &quot;dm?&quot; == sample_date minus (30:1) days; calculated as ((tmin_dm? + tmax_dm?) / 2)</td>
</tr>
<tr class="odd">
<td><strong>tmean_d0</strong></td>
<td>prism</td>
<td>degrees C</td>
<td>&quot;tmin&quot; = estimated mean air temperature for sample_date; calculated as ((tmin_d0 + tmax_d0) / 2</td>
</tr>
</tbody>
</table>
