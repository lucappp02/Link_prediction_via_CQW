
%%%links removal
function y = remove_rows(BIOgrid_interactors_complete,number_rows_removed)
indexes_mantained_rows = randi(size(BIOgrid_interactors_complete,1),size(BIOgrid_interactors_complete,1)-number_rows_removed,1);
 BIOgrid_interactors_removed= BIOgrid_interactors_complete(indexes_mantained_rows,:) ;
               
    y = BIOgrid_interactors_removed;
end