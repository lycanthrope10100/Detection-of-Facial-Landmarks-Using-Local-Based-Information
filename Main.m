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

    if(checkLandmarks(RELM) == false||checkLandmarks(LELM) == false)
        if ~checkLandmarks(LELM)&&checkLandmarks(RELM) 
            LELM = mirror(RELM,ImageOutline,1);
        elseif ~checkLandmarks(RELM)&&checkLandmarks(LELM)
            RELM = mirror(LELM,ImageOutline,1);
        end
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %To find mouth landmarks
    %Optimising image
    FaceBinary = imbinarize(Face,0.25);
    ImageOutline = edge(FaceBinary,'zerocross');
    ImageMorph = bwareaopen(ImageOutline,150);
    ImageOutline = ImageOutline-ImageMorph;

    MLM = findLandmarks(BBMouth,ImageOutline,2);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %To find eyebrow landmarks
    %Optimising image
    ImageBinary = imbinarize(Face,0.50);
    ImageOutline = edge(ImageBinary,'zerocross');
    ImageMorph = bwareaopen(ImageOutline,150);
    ImageOutline = ImageOutline-ImageMorph;
    
    LEBLM = findLandmarks(BBLeftEyebrow,ImageOutline,3);
    REBLM = findLandmarks(BBRightEyebrow,ImageOutline,3);
    
    if(checkLandmarks(LEBLM) == false)
            LEBLM = mirror(REBLM,ImageOutline,2);
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Plotting the landmarks on face
    figure,
    imshow(Face);
    hold on;
    for j = 1:size(REBLM(:,1))
        plot(REBLM(j,1),REBLM(j,2),'r.','MarkerSize',10);
        plot(LEBLM(j,1),LEBLM(j,2),'r.','MarkerSize',10);
    end
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
