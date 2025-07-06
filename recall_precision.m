
%%%% precision recall curve
function y = recall_precision(TP_FP, n_considered_edges, removed_links)
   

 TP = sum(TP_FP(1:n_considered_edges,1));
 FP = sum(TP_FP(1:n_considered_edges,2));
 FN = removed_links-TP; 
 precision = TP/(TP+FP);
 recall = TP/(TP+FN);
 y = [ recall,precision];