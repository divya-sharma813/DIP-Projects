import math
import numpy as np
import matplotlib.pyplot as plt
import cv2

path = "image.jpg" #declaring path of image
image = cv2.imread(path)                                  #Reading the image
m,n,v = np.shape(image)

gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)      #Converting color image to grayscale
gray_image_1 = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

#performing histogram equalization
unique_array = np.unique(gray_image)     #getting the unique elements(pixel intensities)
frequency_array = np.zeros(len(unique_array),int)  #getting the frequency of corresponding pixel intensities
cdf_array = np.zeros(len(unique_array),int)
hv_array = np.zeros(len(unique_array),int)

for i in range(0,len(unique_array)):
    frequency_array[i] = np.count_nonzero(gray_image == unique_array[i])

cdf_array[0] = frequency_array[0]

for i in range(1,len(unique_array)):
    cdf_array[i] = cdf_array[i-1] + frequency_array[i]

cdf_min = min(cdf_array)

for i in range(0,len(unique_array)):
    hv_array[i] = round(((cdf_array[i] - cdf_min)*255)/((m*n) - cdf_min))

for i in range(0,len(unique_array)):
    for j in range(m):
        for k in range(n):
            if(gray_image_1[j][k] == unique_array[i]):
                gray_image_1[j][k] = hv_array[i]
            else:
                continue

#Dispalying original image, image after Histogram Equalization using manual and built-in function 
cv2.imshow('Original Image',gray_image)
cv2.waitKey(0)
cv2.imshow('Histogram equalization on Image ',gray_image_1)
cv2.waitKey(0)

#Now using built-in function 'equalizeHist' and comparing the results
cv2.imshow('Histogram equalization on Image with built-in function',cv2.equalizeHist(gray_image))
cv2.waitKey(0)
cv2.destroyAllWindows()

#Histogram of pixel intensities before and after histogram equalization
plt.subplot(3,1,1)
plt.hist(gray_image.ravel(),256,[0,256])
plt.subplot(3,1,2)
plt.hist(gray_image_1.ravel(),256,[0,256])
plt.subplot(3,1,3)
plt.hist(cv2.equalizeHist(gray_image).ravel(),256,[0,256])
plt.show()