#' Update tables
#' 
#' This function updates one or more tables in a table_code object.
#' 
#' @param tscodes a \code{ts_code} object. This object can be created
#' and modified with function \code{\link{edit_ts_code}}, which starts a Shiny
#' app
#' @param ids ids of tables to be updated
#' @param base_url optionally specify a different server. Useful for third party
#' data services implementing the same protocol.
#' @export
update_tables <- function(tscodes, ids, base_url = NULL) {
 
  for (id in  ids) {
    
    if (id %in% names(tscodes$table_code)) {
      table <- tscodes$table_code[[id]]
    } else {
      stop(paste("Table", id, "not in list of tables"))
    }
    
    new_table <- create_new_table(id, base_url)
    
    
    table <- update_table(new_table, table)
    
    tscodes$table_code[[id]] <- table
    
  }
  
  return(tscodes)
}