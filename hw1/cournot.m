function [A1,A2] = cournot(M1,M2,a1,a2,N)
       
    [~, A1] = max(M1(a2,:));
    [~, A2] = max(M2(:,a1));
    if N > 1 
        [A1, A2] = cournot(M1, M2, A1, A2, N-1);
    end
end