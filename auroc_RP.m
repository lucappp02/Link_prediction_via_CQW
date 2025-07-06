%%%  evaluation of the area under the precision recall curve

function auroc = auroc_RP(BIOgrid_interactors_complete,number_rows_removed,max_number,N)



BIOgrid_interactors_removed = remove_rows(BIOgrid_interactors_complete,number_rows_removed);

Prediction =link_prediction(BIOgrid_interactors_removed,N,max_number);




 TP_FP_arr = TP_FP(Prediction , BIOgrid_interactors_complete, max_number);

 X_Y = zeros(max_number,2);
 for  i=1:max_number
   
    X_Y(i,:) = recall_precision(TP_FP_arr, i, number_rows_removed);
 end

 auroc = trapz(sort(X_Y(:,1)),sort(X_Y(:,2)));


end

