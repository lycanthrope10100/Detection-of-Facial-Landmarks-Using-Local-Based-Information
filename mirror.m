%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [LM] = mirror(OLM,Image,Region)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Mirroring
if(Region == 1)
    LM = zeros(4,2);
    
    sizeIM = size(Image);
    sizeIM = sizeIM(2);
    if OLM(1,1)>(sizeIM/2.0)
        for i = 1:size(OLM)
            LM(i,1) = sizeIM/2-(OLM(i,1)-(sizeIM/2));
            LM(i,2) = OLM(i,2);
        end
    else
        for i = 1:size(OLM)
            LM(i,1) = sizeIM/2+(sizeIM/2)-OLM(i,1);
            LM(i,2) = OLM(i,2);
        end
    end
    
    temp = LM(1,2);
    LM(1,2) = LM(2,2);
    LM(2,2) = temp;
    
elseif(Region == 2)
    LM = zeros(3,2);
    
    sizeIM = size(Image);
    sizeIM = sizeIM(2);
    if OLM(1,1)>(sizeIM/2.0)
        for i = 1:3
            LM(i,1) = sizeIM/2-(OLM(i,1)-(sizeIM/2));
            LM(i,2) = OLM(i,2);
        end
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%