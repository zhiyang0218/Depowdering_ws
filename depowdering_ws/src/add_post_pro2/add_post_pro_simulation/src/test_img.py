import cv2
import numpy as np

# Define HSV lower and upper bounds for green color
green_lower = np.array([40, 40, 40])    # Hue: 40, Saturation: 40, Value: 40
green_upper = np.array([80, 255, 255])  # Hue: 80, Saturation: 255, Value: 255

# Define HSV lower and upper bounds for blue color
blue_lower = np.array([100, 40, 40])    # Hue: 100, Saturation: 40, Value: 40
blue_upper = np.array([140, 255, 255])  # 

# Convert an RGB image to HSV
rgb_image = cv2.imread('test_image.png')  # Replace with your image file
hsv_image = cv2.cvtColor(rgb_image, cv2.COLOR_BGR2HSV)

# Create masks for green and blue colors
green_mask = cv2.inRange(hsv_image, green_lower, green_upper)
blue_mask = cv2.inRange(hsv_image, blue_lower, blue_upper)

# Apply masks to original image
green_result = cv2.bitwise_and(rgb_image, rgb_image, mask=green_mask)
blue_result = cv2.bitwise_and(rgb_image, rgb_image, mask=blue_mask)

# Display the results or save them
cv2.imshow('Green Result', green_mask)
cv2.imshow('Blue Result', blue_mask)
cv2.waitKey(0)
cv2.destroyAllWindows()
