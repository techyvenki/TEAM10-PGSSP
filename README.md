# TEAM10-PGSSP

# Project Title: Learning to Detect Natural Image Boundaries Using Local Brigtness,Color and Texture Cues.

# Team Members:
1. Aarathi Ramesh Muppalla : 20173018 
2. Mahesh Pathakoti        : 20173022
3. Duvvuri Venkatesh       : 20173025
4. Krishna Sss Tuttagunta  : 20173026

This work is carried out as part of SMAI course in IIIT-Hyderabad. 

The objective of this work is to detect object boundaries from local images. 
Matlab is used for this purpose.

# Dataset

Berkeley segmentation dataset (BSDS500) 
https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/segbench/ 

# Features

  - Brightness Gradient

  - Colour Gradient

  - Texture Gradient

# Code Overview


All third party code is provided in folder named third_party


 Matlabfile | Description 
------------|------------
Feature_Extraction.m | Extracts features mentioned above and stores in CSV file 
Data_Visualisation.m | [visualising the dataset and the extracted features for a sigle training image 
Feature_Extraction_com.m | Extracts features mentioned above, compress the image and stores in CSV file 
K_means_com.m | K-means clustering using training data
Linear_Regression.m | Implementation of linear regression
kmeans_supervised.m | supervised classification using kmeans with Linear Regression
nb_com.m | Naive Bayes implementation
svm_com.m | SVM implementation
rtree_com.m | Classification Tree Implementation
PR_com.m | Calculation of precision, Recall and F-measure

# References
  - http://www.aces.edu/dept/fisheries/education/pond_to_plate/documents/ExplanationoftheLABColorSpace.pdf
  - The Berkeley Segmentation Dataset and Benchmark - https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/bsds/
  - Area Under the Precision-Recall Curve: Point Estimates and Confidence Intervals -http://pages.cs.wisc.edu/~boyd/aucpr_final.pdf
  - http://davidjohnstone.net/pages/lch-lab-colour-gradient-picker
