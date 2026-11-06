# Calculate the overlap between two stationary distributions (home ranges)


MoveApps

Github repository: https://github.com/ctmm-initiative/ctmmMoveApp_overlap

## Description
Calculate the overlap (i.e., similarity) between two or more distributions (home ranges). 

## Documentation
*Enter here a detailed description of your App. What is it intended to be used for. Which steps of analyses are performed and how. Please be explicit about any detail that is important for use and understanding of the App and its outcomes.*

### Input type
`ctmm UD with Data and Model`: a list with three elements, as produced by the
*Autocorrelated Kernel Density Estimate (aKDE)* App:

1. `model`: a list containing the selected `ctmm` model for each animal.
2. `uds`: a list containing the aKDE utilization distribution (UD, an object
   of class `UD`) for each animal.
3. `data`: the tracking data (an object of type `telemetry.list`).

### Output type
`ctmm UD with Data and Model`: the input, unchanged.

### Artefacts
*If the App creates artefacts (e.g. csv, pdf, jpeg, shapefiles, etc), please list them here and describe each.*

*Example:* `rest_overview.csv`: csv-file with Table of all rest site properties

### Settings
**Overlap method (`method`):** How to measure the overlap between two home
ranges. Both measures range from 0 (the home ranges share no area) to 1 (the
home ranges are identical). Default: `Bhattacharyya`.

- `Bhattacharyya`: the Bhattacharyya coefficient, the standard measure of how
  similar two home ranges are (Winner et al., 2018).
- `Encounter`: a measure proportional to the probability that two animals
  moving independently of each other meet, related to the utilization
  distribution overlap index (UDOI; Tilberg & Dixon, 2022).

See the ctmm documentation of
[`overlap()`](https://ctmm-initiative.github.io/ctmm/reference/overlap.html)
for details.

### Most common errors
*Please describe shortly what most common errors of the App can be, how they occur and best ways of solving them.*

### Null or error handling
*Please indicate for each setting as well as the input data which behaviour the App is supposed to show in case of errors or NULL values/input. Please also add notes of possible errors that can happen if settings/parameters are improperly set and any other important information that you find the user should be aware of.*

*Example:* **Setting `radius`:** If no radius AND no duration are given, the input data set is returned with a warning. If no radius is given (NULL), but a duration is defined then a default radius of 1000m = 1km is set. 
