#' Scrape JSON of Match court vision data
#' @param year Year of match (yyyy)
#' @param matchid Character matchid (SM001)
#' @param event One of "ao" (Aussie Open) or "rg" (Roland Garros)
#' @export
#' @examples
#' get_match(2021, "SM001", "rg")
#' get_match(2021, "MS701", "ao")
get_match <- function(year, matchid, event = c("ao", "rg")){
	
	if(year < 2021 & event == "rg")
		url <- glue::glue("https://itp.infosys-platforms.com/api/rg/court-vision/year/{year}/eventId/520/matchId/{matchid}/pointId/0_0_0")
	else 
		if(event == "rg")
		url <- glue::glue("https://itp-rg-sls.infosys-platforms.com/prod/api/court-vision/year/{year}/eventId/520/matchId/{matchid}/pointId/0_0_0")
		else
		url <- glue::glue("https://itp-ao.infosys-platforms.com/api/court-vision/year/{year}/eventId/580/matchId/{matchid}/pointId/0_0_0")
	
jsonlite::fromJSON(url)[[1]]
}