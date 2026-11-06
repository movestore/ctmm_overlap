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
*Please list and define all settings/parameters that the App requires to be set by the App user, if necessary including their unit.*

*Example:* `Radius of resting site` (radius): Defined radius the animal has to stay in for a given duration of time for it to be considered resting site. Unit: `metres`.

### Most common errors
*Please describe shortly what most common errors of the App can be, how they occur and best ways of solving them.*

### Null or error handling
*Please indicate for each setting as well as the input data which behaviour the App is supposed to show in case of errors or NULL values/input. Please also add notes of possible errors that can happen if settings/parameters are improperly set and any other important information that you find the user should be aware of.*

*Example:* **Setting `radius`:** If no radius AND no duration are given, the input data set is returned with a warning. If no radius is given (NULL), but a duration is defined then a default radius of 1000m = 1km is set. 
