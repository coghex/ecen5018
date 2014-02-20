function [b1,b2] = fp(M1,M2,a1,a2,N)
  b1 = zeros(N)
  b2 = zeros(N)
  p = zeros(size(M1))
  q = zeros(size(M2))

  b1(1) = a1;
  b2(1) = a2;

  for i = 1,N
    for j = 1,i
      p(b2(j)) = p(b2(j)) + 1/i;
      q(b1(j)) = q(b1(j)) + 1/i;
    end
    b1(i+1) = 1;
    b2(i+1) = 1;
  end
end
