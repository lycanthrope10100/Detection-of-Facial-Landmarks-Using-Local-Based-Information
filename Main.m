%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Cleanup
clc;
clear;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Read the input images
for i = 37
    I = imread(strcat('Image Database\Test(',num2str(i),').tiff'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %To detect facial regions
    [BBFace,BBMouth,BBLeftEye,BBRightEye,BBLeftEyebrow,BBRightEyebrow] = detectFacialRegions(I); 
    Face = imcrop(I,BBFace);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %To find eye landmarks
    %Optimising image
    FaceBinary = imbinarize(Face,0.25);
    ImageOutline = edge(FaceBinary,'zerocross');

    LELM = findLandmarks(BBLeftEye,ImageOutline,1);
    RELM = findLandmarks(BBRightEye,ImageOutline,1);

    if(checkLandmarks(RELM,1) == false||checkLandmarks(LELM,1) == false)
        if ~checkLandmarks(LELM,1)&&checkLandmarks(RELM,1) 
            LELM = mirror(RELM,ImageOutline);
        elseif ~checkLandmarks(RELM,1)&&checkLandmarks(LELM,1)
            RELM = mirror(LELM,ImageOutline);
        end
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %To find mouth landmarks
    %Optimising image
    FaceBinary = imbinarize(Face,0.25);
    ImageOutline = edge(FaceBinary,'zerocross');
    BoundaryOutline = bwareaopen(ImageOutline,155);
    ImageOutline = ImageOutline-BoundaryOutline;
    
    MLM = findLandmarks(BBMouth,ImageOutline,2);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Plotting the landmarks on face
    figure
    imshow(Face);
    hold on;
    for j = 1:size(RELM(:,1))
        plot(RELM(j,1),RELM(j,2),'r.','MarkerSize',10);
        plot(LELM(j,1),LELM(j,2),'r.','MarkerSize',10);
    end
    for j = 1:size(MLM(:,1))
        plot(MLM(j,1),MLM(j,2),'r.','MarkerSize',10);
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
