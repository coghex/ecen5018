function [A1,A2] = mixedcournot(M1,M2,a1,a2,N,p)
    x = sum(rand >= cumsum([p, 1-p]));
    if x==1
      [~, A1] = max(M1(a2,:));
    else
      A1 = a1;
    end
    x = sum(rand >= cumsum([p, 1-p]));
    if x==1
      [~, A2] = max(M2(:,a1));
    else
      A2 = a2;
    end

    if N > 1
        [A1, A2] = mixedcournot(M1, M2, A1, A2, N-1, p);
    end
end
