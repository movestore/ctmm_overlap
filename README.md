# Home Range Overlap

MoveApps

GitHub repository: https://github.com/movestore/ctmm_overlap

## Description
Calculate the pairwise overlap (i.e., similarity) between the aKDE home ranges
of a set of tracked animals, with confidence intervals.

## Documentation
This App calculates how much the home ranges of each pair of animals overlap,
based on their estimated utilization distributions (UDs).
The overlap estimates range from 0 (the home ranges share no area) to 1
(the home ranges are identical). Each estimate includes a 95% confidence
interval.

This App is part of a ctmm workflow. You must run the *Autocorrelated
Kernel Density Estimate (aKDE)* App before this one, as its output is
necessary to calculate the overlap.

See the ctmm documentation of [`overlap()`][1] for more details on the method.

[1]: https://ctmm-initiative.github.io/ctmm/reference/overlap.html

### Application scope
#### Generality of App usability
This App was developed for any taxonomic group that displays range-resident
behavior.

#### Required data properties
This App is only applicable to data that reflect range-resident behavior. Use
the *Variogram* App to evaluate whether this property holds for your data.

The input must contain at least 2 animals.

### Input type
`ctmm ud with data`: a list with three elements, as produced by the
*Autocorrelated Kernel Density Estimate (aKDE)* App:

1. `model`: a list containing the selected `ctmm` model for each animal.
2. `uds`: a list containing the aKDE utilization distribution (UD, an object
   of class `UD`) for each animal.
3. `data`: the tracking data (an object of type `telemetry.list`).

### Output type
`ctmm ud with data`: the input, unchanged.

### Artefacts
`overlap_summary_matrix.csv`: a table of the overlap estimates, with one row
and one column per animal. The first column (`individual`) gives the name of
the animal for each row. Each cell contains the estimated overlap between the
animals of its row and column. The table is symmetric, and the diagonal
(each animal compared with itself) is always 1. Confidence intervals are
given in `overlap_summary_long.csv`.

`overlap_summary_long.csv`: a table with one row per pair of animals. Each
pair appears only once, and animals are not compared with themselves. It
contains the following columns:
  - `from`, `to`: the names of the two animals.
  - `low`, `est`, `high`: the estimated overlap and the lower and upper bounds
    of its 95% confidence interval.

All values are rounded to 4 decimal places, so very small overlaps are shown
as 0.

### Settings
**Overlap method (`method`):** How to measure the overlap between two home
ranges. Both measures range from 0 (the home ranges share no area) to 1 (the
home ranges are identical).

- `Bhattacharyya` (default): the Bhattacharyya coefficient, the standard
  measure of how similar two home ranges are (Winner et al., 2018).
- `Encounter`: a measure based on the probability that two animals moving
  independently of each other meet. Its numerator is proportional to this
  encounter probability and to the utilization distribution overlap index
  (UDOI; Tilberg & Dixon, 2022).

### Changes in output data
The input data remain unchanged.

### Errors and null handling
**Fewer than 2 animals:** Overlap is measured between pairs of animals. If
the input contains fewer than 2, the App stops with an error.

**Wide confidence intervals:** Animals with a small effective sample size give
wide confidence intervals, which can span the full range from 0 to 1.

### Technical details
The overlap is calculated with [`ctmm::overlap()`][1] on the aKDE UDs. The
UDs must be estimated together so that they share the same grid, which the
*aKDE* App does.

Home range overlap estimation with ctmm is described in Winner, K., Noonan,
M. J., Fleming, C. H., Olson, K. A., Mueller, T., Sheldon, D., & Calabrese,
J. M. (2018). Statistical inference for home range overlap. *Methods in
Ecology and Evolution*, 9(7), 1679–1691.
https://doi.org/10.1111/2041-210X.13027

The encounter-based overlap measure is described in Tilberg, M., & Dixon,
P. M. (2022). Statistical inference for the utilization distribution overlap
index (UDOI). *Methods in Ecology and Evolution*, 13(5), 1082–1092.
https://doi.org/10.1111/2041-210X.13813

The aKDE method is described in Fleming, C. H., Fagan, W. F., Mueller, T.,
Olson, K. A., Leimgruber, P., & Calabrese, J. M. (2015). Rigorous home range
estimation with movement data: A new autocorrelated kernel density estimator.
*Ecology*, 96(5), 1182–1188. https://doi.org/10.1890/14-2010.1

The ctmm package is described in Calabrese, J. M., Fleming, C. H., &
Gurarie, E. (2016). ctmm: An R package for analyzing animal relocation data as
a continuous-time stochastic process. *Methods in Ecology and Evolution*,
7(9), 1124–1132. https://doi.org/10.1111/2041-210X.12559
