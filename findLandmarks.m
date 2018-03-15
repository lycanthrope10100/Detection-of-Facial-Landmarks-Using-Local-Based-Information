%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [LM] = findLandmarks(BB,ImageOutline,Region)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Matrix operations
if(Region == 1||Region == 2)
    LM = zeros(4,2);

    for i = BB(1):(BB(1)+BB(3))
        if max(ImageOutline(BB(2):(BB(2)+BB(4)),i)) == 1
            for j = (BB(2)+BB(4)):-1:BB(2)
                if(ImageOutline(j,i) == 1)
                    LM(1,:) = [i,j];
                    break;
                end
            end
            break;
        end
    end

    for i = (BB(1)+BB(3)):-1:BB(1)
        if max(ImageOutline(BB(2):(BB(2)+BB(4)),i)) == 1
            for j = (BB(2)+BB(4)):-1:BB(2)
                if(ImageOutline(j,i) == 1)
                    LM(2,:) = [i,j];
                end
            end
            break;
        end
    end

    for j = BB(2):(BB(2)+BB(4))
        if max(ImageOutline(j,BB(1):(BB(1)+BB(3)))) == 1
            for i = BB(1):(BB(1)+BB(3))
                if(ImageOutline(j,i) == 1)
                    LM(3,:) = [i,j];
                end
            end
            break;
        end
    end

    for j = (BB(2)+BB(4)):-1:BB(2)
        if max(ImageOutline(j,BB(1):(BB(1)+BB(3)))) == 1
            for i = BB(1):(BB(1)+BB(3))
                if(ImageOutline(j,i) == 1)
                    LM(4,:) = [i,j];
                    break;
                end
            end
            break;
        end
    end

    LM(3,1) = (LM(1,1)+LM(2,1))/2;
    LM(4,1) = (LM(1,1)+LM(2,1))/2;
    
elseif(Region == 3)
    LM = zeros(3,2);

    for i = BB(1):(BB(1)+BB(3))
        if max(ImageOutline(BB(2):(BB(2)+BB(4)),i)) == 1
            for j = (BB(2)+BB(4)):-1:BB(2)
                if(ImageOutline(j,i) == 1)
                    LM(1,:) = [i,j];
                    break;
                end
            end
            break;
        end
    end

    for i = (BB(1)+BB(3)):-1:BB(1)
        if max(ImageOutline(BB(2):(BB(2)+BB(4)),i)) == 1
            for j = (BB(2)+BB(4)):-1:BB(2)
                if(ImageOutline(j,i) == 1)
                    LM(2,:) = [i,j];
                end
            end
            break;
        end
    end

    for j = BB(2):(BB(2)+BB(4))
        if max(ImageOutline(j,BB(1):(BB(1)+BB(3)))) == 1
            for i = BB(1):(BB(1)+BB(3))
                if(ImageOutline(j,i) == 1)
                    LM(3,:) = [i,j];
                end
            end
            break;
        end
    end

    LM(3,1) = (LM(1,1)+LM(2,1))/2;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
