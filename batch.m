% %%%% INSTRUCTIONS: open a PPI_* folder open the variable called
% %%%% BIOgrid_interactors_complete and run the code. Here there are some
% %%%% examples of prediction using the QW and CQW-based methods
% 
% %%%% WARNING: fastexpm is required
% %%%% WARNING: computational times can be quite long (0.5-20 h) on common
% %%%% devices
% 
% 
% 
%     %%% NO phases Auroc-time for different perc removal
% mat = zeros(10, 2,5 );
% n_averages = 10;
% N0 = 0.3;
% stepN = 0.4;
% for i = 1:10
% perc_rows_removed = 0.1*i;
% number_rows_removed = round(size(BIOgrid_interactors_complete,1)*perc_rows_removed) ;
% max_number = round(1.5*number_rows_removed);
%     for j = 1:5
%         N = N0+(j-1)*stepN;
%         tot = 0;
%         for l = 1:n_averages
% 
% 
%             tot = tot+auroc_RP(BIOgrid_interactors_complete,number_rows_removed,max_number,N);
% 
% 
%         end
%         mat(j,1,i) = N;
%         mat(j,2,i) = tot/n_averages;
%     end
% end
% 
% 
% figure
% for i = 1:5
%     plot(mat(:,1,i),mat(:,2,i),'-o', 'LineWidth',2.5);
%     hold on
% end
% axis([0.3 3.9 0.2 1 ])
% a = xlabel('$N$','interpreter','latex');
% b = ylabel('Average AURP','interpreter','latex');
% 
% 
% 
%  h.FontSize= 45;
% a.FontSize= 40;
%  b.FontSize= 40;
% 
% set(gca, 'FontSize', 14);
% 
% leg = legend({'% Removed links = 10%', '% Removed links = 20%', ...
%    '% Removed links = 30%','% Removed links = 40%','% Removed links = 50%'} ,'interpreter','latex','Location','northwest');
% leg.FontSize = 13;
% hold off








%%% optimal phases Auroc-time for different perc removal
n_averages = 10;
N = 2.3;
  mat = zeros(20,2,5);
 count = 0;
for k = 1:5
    perc_rows_removed = 0.1*k;
    number_rows_removed = round(size(BIOgrid_interactors_complete,1)*perc_rows_removed) ;
    max_number = round(1.5*number_rows_removed);

    for i= 1:20
        tot = 0;
        phase = -pi+pi/10*i;
        mat(i,1,k) = phase;
        for j = 1:n_averages
            count = count+1;
            
            tic
            tot = tot+auroc_RP_chiral(BIOgrid_interactors_complete,number_rows_removed,max_number,N, phase);
            

        end
         mat(i,2,k) = tot/n_averages;


    end
end





figure
for i = 1:5
    plot(mat(:,1,i),mat(:,2,i),'-o', 'LineWidth',2.5);
    hold on
end
axis([-2.8274 pi 0.2 1 ])
a = xlabel('$\phi$','interpreter','latex');
b = ylabel('Average AURP','interpreter','latex');

   
 h.FontSize= 45;
a.FontSize= 40;
 b.FontSize= 40;

set(gca, 'FontSize', 14);

leg = legend({'% Removed links = 10%', '% Removed links = 20%', ...
   '% Removed links = 30%','% Removed links = 40%','% Removed links = 50%'} ,'interpreter','latex','Location','northwest');
leg.FontSize = 13;
hold off









