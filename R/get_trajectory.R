get_trajectory <- function(point){
	
	if(is.null(point$trajectoryData) | length(point$trajectoryData[[1]]) == 0)
		return(NULL)
	else{
		shots <- unique(as.data.table(point$trajectoryData))
		shots$shot <- cumsum(shots$position == "hit")
		
		shots <- shots[, ":=" (
			court = point$court,
			set = point$set,
			game = point$game,
			point = point$point,
			serve = point$serve,
			rally = point$rallyLength,
			server = point$serverId,
			scorer = point$scorerId,
			receiver = point$receiverId,
			pointid = point$pointId,
			error = point$errorType
		)]
		
	return(shots)
	}
}