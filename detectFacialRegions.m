%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  [BBFace,BBMouth,BBLeftEye,BBRightEye,BBLeftEyebrow,BBRightEyebrow] = detectFacialRegions(I)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%To detect face
FaceDetect = vision.CascadeObjectDetector;

%Returns bounding box values based on number of objects
BBFace = step(FaceDetect,I);

% Face = insertObjectAnnotation(I,'rectangle',BBFace,'Face');
% figure,
% imshow(Face);
% title('Face Detection');
Face = imcrop(I,BBFace);

% figure,
% imshow(Face);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
% %To detect nose
% NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16);
% 
% %Returns bounding box values based on number of objects
% BBNose = step(NoseDetect,Face);
% 
% % Nose = insertObjectAnnotation(Face,'rectangle',BBNose,'Nose');
% % figure,
% % imshow(Nose);
% % title('Nose Detection');
% Nose = imcrop(Face,BBNose);
% 
% % figure,
% % imshow(Nose);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%To detect mouth
MouthDetect = vision.CascadeObjectDetector('Mouth');

%Returns bounding box values based on number of objects
BBMouth = step(MouthDetect,Face);

%Return the row of bounding box matrix with highest value of y
[~,I] = max(BBMouth(:,2));
BBMouth = BBMouth(I,:);

% Mouth = insertObjectAnnotation(Face,'rectangle',BBMouth,'Mouth');
% figure,
% imshow(Mouth);
% title('Mouth Detection');
% Mouth = imcrop(Face,BBMouth);

% figure,
% imshow(Mouth);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%To detect left eye
LeftEyeDetect = vision.CascadeObjectDetector('LeftEye','MergeThreshold',16);

%Returns bounding box values based on number of objects
BBLeftEye = step(LeftEyeDetect,Face);

%Return the row of bounding box matrix with lowest value of x
[~,I] = min(BBLeftEye(:,1));
BBLeftEye = BBLeftEye(I,:);

%Backup
BBLeftEyeB = BBLeftEye;

%Subimage for better extraction of eye
SILE = [BBLeftEye(2),(BBLeftEye(2)+BBLeftEye(4)),BBLeftEye(1),(BBLeftEye(1)+BBLeftEye(3))];
BBLeftEye = step(LeftEyeDetect,Face(SILE(1):SILE(2),SILE(3):SILE(4)));
[~,I] = min(BBLeftEye(:,1));
BBLeftEye = BBLeftEye(I,:);
if(size(BBLeftEye))
    BBLeftEye(1) = BBLeftEye(1) + SILE(3);
    BBLeftEye(2) = BBLeftEye(2) + SILE(1);
else
    BBLeftEye = BBLeftEyeB;
end

% LeftEye = insertObjectAnnotation(Face,'rectangle',BBLeftEye,'LeftEye');
% figure,
% imshow(LeftEye);
% title('LeftEye Detection');
% LeftEye = imcrop(Face,BBLeftEye);

% figure,
% imshow(LeftEye);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%To detect right eye
RightEyeDetect = vision.CascadeObjectDetector('RightEye');

%Returns bounding box values based on number of objects
BBRightEye = step(RightEyeDetect,Face);

%Return the row of bounding box matrix with highest value of x
[~,I] = max(BBRightEye(:,1));
BBRightEye = BBRightEye(I,:);

%Backup
BBRightEyeB = BBRightEye;

%Subimage for better extraction of eye
SIRE = [BBRightEye(2),(BBRightEye(2)+BBRightEye(4)),BBRightEye(1),(BBRightEye(1)+BBRightEye(3))];
BBRightEye = step(RightEyeDetect,Face(SIRE(1):SIRE(2),SIRE(3):SIRE(4)));
[~,I] = min(BBRightEye(:,1));
BBRightEye = BBRightEye(I,:);
if(size(BBRightEye))
    BBRightEye(1) = BBRightEye(1) + SIRE(3);
    BBRightEye(2) = BBRightEye(2) + SIRE(1);
else
    BBRightEye = BBRightEyeB;
end

% RightEye = insertObjectAnnotation(Face,'rectangle',BBRightEye,'RightEye');
% figure,
% imshow(RightEye);
% title('RightEye Detection');
% RightEye = imcrop(Face,BBRightEye);

% figure,
% imshow(RightEye);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%To detect left eyebrow
BBLeftEyebrow = BBLeftEyeB;
BBLeftEyebrow(1) = BBLeftEyebrow(1)-5;
BBLeftEyebrow(2) = BBLeftEyebrow(2)-27;
BBLeftEyebrow(3) = BBLeftEyebrow(3)+8;
BBLeftEyebrow(4) = BBLeftEyebrow(4)+5;

% LeftEyebrow = insertObjectAnnotation(Face,'rectangle',BBLeftEyebrow,'LeftEyebrow');
% figure,
% imshow(LeftEyebrow);
% title('LeftEyebrow Detection');
% LeftEyebrow = imcrop(Face,BBLeftEyebrow);

% figure,
% imshow(LeftEyebrow);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%To detect right eyebrow
BBRightEyebrow = BBRightEyeB;
BBRightEyebrow(1) = BBRightEyebrow(1)-5;
BBRightEyebrow(2) = BBRightEyebrow(2)-27;
BBRightEyebrow(3) = BBRightEyebrow(3)+8;
BBRightEyebrow(4) = BBRightEyebrow(4)+5;

% RightEyebrow = insertObjectAnnotation(Face,'rectangle',BBRightEyebrow,'RightEyebrow');
% figure,
% imshow(RightEyebrow);
% title('RightEyebrow Detection');
% RightEyebrow = imcrop(Face,BBRightEyebrow);

% figure,
% imshow(RightEyebrow);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
