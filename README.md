## courtvisionr

This package provides a few functions for extracting summary tracking data included in the courtvision applet of the Australian Open and Roland Garros Grand Slams. The package does not include the data itself but rather provides the means for extracting what current and historical data is publicly available. 

## Installation

To get started with the package, you can install the latest version using `remotes`. 

`
remotes::install_github("skoval/courtvisionr")
`

A quick way to get started is to look at the examples for the package's primary funciton `get_match`.

`
library(courtvisionr)
`

`
example(get_match)
`


## Coverage

The _Court Vision_ data is part of the match results for matches where Hawkeye was in operation. This should cover all courts for the Australian Open since 2021 and all show courts for Roland Garros (and the Aussie Open prior to 2021). Beyond that, the coverage will depend on web design of Infosys.

Because the event websites focus on the most recent year, some historical data may no longer be available once that year has passed. I believe match data is still accessible for 2020+ for the Australian Open and 2019+ for Roland Garros.

There are other data elements that are also available (rally analysis, matchbeats, etc.). I haven't included this because those are less interesting, I think. But it would just be a matter of updating the URL pattern for those JSON sources to add those to the package.


## Match Codes

Match does follow a specific formula and are the same from year to year (at least so far). They do differ at each event, however. Below is a general guide:


|Event | Event Type | Formula | Example 
|:-----|:-----:|:-----:|:-----:
| Roland Garros |  Men's Singles | SM### | SM001 (Final match) 
|  | Women's Singles | SD### | SD127 (First match)  
|  | Men's Doubles | DM### | DM001 (Final) 
|  | Women's Doubles | DD### | DD001 (Final) 
|  | Mixed Doubles | MX### | MX001 (Final) 
| Australian Open |  Men's Singles | MS### | MS701 (Final match) 
|  | Women's Singles | WS### | WS001 (First match)  
|  | Men's Doubles | MD### | MD601 (Final) 
|  | Women's Doubles | WD### | WD001 (Final) 
|  | Mixed Doubles | XD### | XD501 (Final) 

So all matchids have a 2-character event code and then 3 digits. For Roland Garros the digit is the match number starting from the biggest number and working toward 1 for the final. For the Australian Open, the first digit is the round (beginning with 1 and working up) and then a 2-digit match number starting at 1 and working up within each round. 


## Terms of Use

Scraping and use of data obtained through the package functions fall under the individual terms on each events webiste. For the Australian Open, the terms can be found at [this link](https://www.tennis.com.au/conditions-of-use). I can't find the comparable terms for Roland Garros.

In general, good practice would dictate that any downloaded data is used for the informational/research, non-commerical purposes of individuals. Any uses outside of this or extensive scraping over a small period of time, would warrant pre-approval from the events.

It is quite possible that, as more people attempt to access the data, that the site will be altered or made less accessible. If you notice any changes to accessibility, especially if it impacts the functionality of the package utilities, please post that on the repo `Issues` page.