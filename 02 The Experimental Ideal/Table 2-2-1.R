# Create variables 
gen white_asian = (inlist(srace, 1, 3)) 
if !missing(srace)
label var white_asian "White/Asian"

# get percentiles of test scores
local testscores "treadssk tmathssk treadss1 tmathss1 treadss2 tmathss2 treadss3 tmathss3"
foreach var of varlist `testscores' {
	xtile pct_`var' = `var', nq(100)
}

egen avg_pct = rowmean(pct_*)
label var avg_pct "Percentile score in kindergarten"

