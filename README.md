# Gaussian and Box Filter Comparison

This code filter the gray-level image and a 21x21 Gaussian filter. Shows the result. Does the same with a 21x21 box filter and compare the results. There is a discussion in the later of this document why there are differences in the results obtained with the Gaussian filter and the box filter.

You may found more information about [Gaussian Filtering](http://daringfireball.net/projects/markdown/syntax) and [Box Filtering](https://en.wikipedia.org/wiki/Box_blur).

## Discussion and Results
Two filters were applied on the image with the convolution method.

For the Gaussian filtering method, 21x21 kernel size was selected and tested at different sigma values. As the sigma value increased, the blurring of the image increased. The reason for this is the increase in the rate of the pixel being affected by the neighboring pixels.

While filtering with Box filter, 21x21 matrix is filled with 1/441 number and the image is filtered with this matrix.

The difference between these two filtering methods is that, as shown in the output images below, the image filtered with the gaussian filter has smoother lines, while the image using the box filter has sharper lines. The reason for this is that when calculating each pixel value of the gaussian filter, a kernel value is calculated according to the values of its neighbors, while the box filter is multiplied by a fixed kernel value. It is a linear function by the Gaussian formula and takes neighbor values into account when filtering.

Original Image| Gaussian Filter | Box Filter
:-------------------------:|:-------------------------:|:-------------------------:
![](https://iili.io/YrSDaS.png)  |  ![](https://iili.io/YrSp99.png) | ![](https://iili.io/YrUHZb.png)
