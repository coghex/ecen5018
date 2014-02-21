function [b1,b2] = fp(M1,M2,a1,a2,N)
  b1 = zeros(length(M1),1);
  b2 = zeros(length(M2),1);
  b1(a2) = 1;
  b2(a1) = 1;

  for i = 2:N
    b1 = [b1,b2(:,i-1)];
    b2 = [b2,b2(:,i-1)];

    for j = 1:length(M1)
      c1(j) = dot(b2(:,i-1),M1(j,:));
    end
    for j = 1:length(M2)
      c2(j) = dot(b1(:,i-1),M2(:,j));
    end

    [~,nextmove1] = max(c1);
    [~,nextmove2] = max(c2);

    for k = 1:length(M1)
      if nextmove1 == k
        b1(nextmove1,i) = b1(nextmove1,i-1)*(i-1)/i + 1/i;
      elseif b1(k,i) > 0
        b1(k,i) = b1(k,i-1)*(i-1)/i;
      end
    end
    for k = 1:length(M2)
      if nextmove2 == k
        b2(nextmove2,i) = b2(nextmove2,i-1)*(i-1)/i + 1/i;
      elseif b2(k,i) > 0
        b2(k,i) = b2(k,i-1)*(i-1)/i;
      end
    end
  end
  subplot(2,1,1)
  plot(1:N,b1)
  subplot(2,1,2)
  plot(1:N,b2)

end
