function [A1,A2] = sdeliminate(M1,M2)
    m1=M1;
    m2=M2;
    done = 0;
    while done == 0
      d = 0;
      done=1;
      for i=1:size(M1,1)
        if done == 0
          break;
        end
        for j=1:size(M1,1)
          for k=1:size(M1,2)
            if i~=j
              if M1(i,k)<M1(j,k)
                d = d+1;
              end
            end
          end
          if d >= size(M1,2)
            m1(i,:)=[];
            m2(i,:)=[];
            done=0;
          end
          d = 0;
        end
      end

      M1=m1;
      M2=m2;

      d = 0;
      for i=1:size(M2,2)
        if done == 0
          break;
        end
        for j=1:size(M2,2)
          for k=1:size(M2,1)
            if i~=j
              if M2(k,i)<M2(k,j)
                d = d+1;
              end
            end
          end
          if d >= size(M2,1)
            m1(:,i)=[];
            m2(:,i)=[];
            done=0;
          end
          d = 0;
        end
      end
      M1=m1;
      M2=m2;
    end
    A1=m1;
    A2=m2;

end
