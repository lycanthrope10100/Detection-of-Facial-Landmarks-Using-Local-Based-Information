# Detection-of-Facial-Landmarks-Using-Local-Based-Information
The method presented here is based on local information. Firstly, the face detection is performed with the traditional Viola–Jones object detection framework. The Viola-Jones framework consists of Haar-like features extraction method and Adaboost classifier. After face detection, the same Viola-Jones framework is used to detect the facial regions. The eyebrows region was estimated from the eye region position.
Active shape model (ASM) is used to model the change of face shape using principal component analysis (PCA) to make sure the initial shape model is at a perfect position.

## Usage:
```cs
Matlab.exe -r Main
```

## Debugging:
* The code has been tested using the JAFFE Database, avaiable at http://www.kasrl.org/jaffe.html.
  * If the eye landmarks are distorted, you may need to change this value
  ```cs
  Line 24 - FaceBinary = imbinarize(Face,0.25);
  ```
  * If the mouth landmarks are distorted, you may need to change these value
  ```cs
  Line 42 - FaceBinary = imbinarize(Face,0.50);
  Line 44 - ImageMorph = bwareaopen(ImageOutline,150);
  ```
  * If the eyebrow landmarks are distorted, you may need to change these value
  ```cs
  Line 53 - FaceBinary = imbinarize(Face,0.50);
  Line 55 - ImageMorph = bwareaopen(ImageOutline,150);
  ```

## Sample:
![.](https://github.com/lycanthrope10100/Detection-of-Facial-Landmarks-Using-Local-Based-Information/blob/master/Image.jpg)
