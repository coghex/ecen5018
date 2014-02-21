function [A1,A2] = mixedcournot(M1,M2,a1,a2,N,p)
  A1 = a1;
  A2 = a2;
  for i = 2:N
    x = sum(rand >= cumsum([p, 1-p]));
    if x==1
      [~, a1new] = max(M1(a2,:));
      A1 = [A1;a1new];
    else
      A1 = [A1;a1];
    end
    x = sum(rand >= cumsum([p, 1-p]));
    if x==1
      [~, a2new] = max(M2(:,a1));
      A2 = [A2;a2new];
    else
      A2 = [A2;a2];
    end


end
