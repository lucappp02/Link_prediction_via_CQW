

%%% true positive and false positive predictions
function y = TP_FP(Prediction , BIOgrid_interactors_complete, max_number)




True_Positive = int8(ismember(Prediction(1:max_number , [1,2]), BIOgrid_interactors_complete,'rows'));
True_Positive = True_Positive+int8(ismember(Prediction(1:max_number , [2,1]), BIOgrid_interactors_complete,'rows'));
True_Positive = changem(True_Positive,1,2);
False_Positive = int8(ones(max_number,1))-True_Positive;

y = [True_Positive,False_Positive];