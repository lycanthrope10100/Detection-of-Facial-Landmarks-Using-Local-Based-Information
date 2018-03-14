%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ CLM ] = checkLandmarks(LM,Region)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%To check for distortion error
if(Region == 1)
    if abs(LM(1,2)-LM(2,2))<abs((0.25).*(LM(1,1)-LM(2,1))) 
        CLM = true;
    else
        CLM = false;
    end
    
elseif(Region == 2)
    count_zero = zeros(1,1);
    count_one = zeros(1,1);
    [a1,a2] = size(LM);
    for col = 1:(a2/4)
        for row = 1:(a1/2)
            if(LM(row,col) == 0)
                count_zero = count_zero+1;
            else
                count_one = count_one+1;
            end
        end
    end
    
    if(count_zero > count_one)
        CLM = false;
    else
        CLM = true;
    end
    
elseif(Region == 3)
    count_zero = zeros(1,1);
    count_one = zeros(1,1);
    [b1,b2] = size(LM);
    for col = int8(b2*(3/4)):b2
        for row = 1:(b1/2)
            if(LM(row,col) == 0)
                count_zero = count_zero+1;
            else
                count_one = count_one+1;
            end
        end
    end
    
    if(count_zero > count_one)
        CLM = false;
    else
        CLM = true;
    end  
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
