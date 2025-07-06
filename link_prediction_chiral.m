%%% implementation of the link prediction method for chiral dynamics


function y = link_prediction_chiral(BIOgrid_interactors_removed,N, max_number, phase)

G = graph(BIOgrid_interactors_removed(:,1),BIOgrid_interactors_removed(:,2));
D = degree(G);
index = find(D~=0);
G = subgraph(G,index); 
A = adjacency(G);
D = degree(G);
t = N/mean(D);
for j = 1:size(A,1)
    if j+1 <=size(A,1)
    A(j, j+1:end) = A(j, j+1:end).*exp(-1i*phase);
    end
    if  j-1 >0
    A(j, 1:j-1) =   A(j, 1:j-1) .*exp(1i*phase);
    end
end

n_nodes = size(A, 1);
n_non_edges = (sum(sum(A==0))-sum(diag(A)==0))/2+sum(diag(A)==0);

U = fastExpm(-1i*A*t);

P = U.*conj(U);



 S = zeros(n_non_edges,1);
 edges= zeros(n_non_edges,2);
count = 1;

for i= 1:n_nodes
    for j = i:n_nodes
        if A(i,j) ==0 
            if i ~= j
                S(count ) = P(i,j)*(D(i)+D(j));
            else
                S(count) = 1/2.*sum(P(i,neighbors(G,i) ));
            end
            edges(count,1) = index(j);
            edges(count,2) = index(i);
            count = count+1;
        end
    end
end
[S,index_sort] = sort(S,"descend");
final_edges(:,1)=edges(index_sort(1:max_number),1);
final_edges(:,2)=edges(index_sort(1:max_number),2);


y =  final_edges;
end


