#' Create point-level data.table for court vision match
#' @param x List from JSON input, return from \code{get_match}
#' @param matchid character matchid as on grand slam results page (e.g. 'MS001')
#' @param year Year of match (yyyy)
#' @export
get_points <- function(x, matchid = NULL, year = NULL){
	
	points <- lapply(x$pointsData, get_trajectory)
	
	points <- rbindlist(points)
	
	players <- rbindlist(lapply(x$playersData, as.data.table))
	
	points <- merge(
		points,
		players[, .(server = id, servername = name)],
		by = "server"
	)
	
	points <- merge(
		points,
		players[, .(receiver = id, receivername = name)],
		by = "receiver"
	)
	
	points <- points[, matchid := matchid]
	points <- points[, year := year]
	
return(points)
}
