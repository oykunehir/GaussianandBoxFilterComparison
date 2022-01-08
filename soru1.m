
gaussFilteredImage = applyGaussOnImage(21, "images/im1_L.png");
imshow(filteredImage);

boxFilteredImage = applyBoxOnImage(3, "images/im1_L.png");
imshow(boxFilteredImage);

function filteredImage = applyGaussOnImage(radius, img)
    inputImage = imread(img);
    [row,column,~] = size(inputImage);
    sigma = max(double(radius / 2), 1);

    for x =-radius:radius
            for y=-radius:radius
                exponentNumerator = double(-(x * x + y * y));
                exponentDenominator = (2 * sigma * sigma);

                eExpression = exp(1)^(exponentNumerator / exponentDenominator);
                kernelValue = (eExpression / (2 * double(pi) * sigma * sigma));

                kernel(x + radius+1,y + radius+1) = kernelValue;
            end
    end

    for x=radius:(row - radius)-1
        for y=radius:(column - radius)-1

                redValue = 0.0;
                greenValue = 0.0;
                blueValue = 0.0;

                for kernelX= -radius:radius 
                    for kernelY= -radius:radius 

                        kernelValue = kernel(kernelX + radius+1,kernelY + radius+1);

                        redValue = redValue + double(inputImage(x - kernelX+1, y - kernelY+1,1)) * kernelValue;
                        greenValue = greenValue + double(inputImage(x - kernelX+1, y - kernelY+1,2)) * kernelValue;
                        blueValue =blueValue+ double(inputImage(x - kernelX+1, y - kernelY+1,3)) * kernelValue;
                    end
                end

                filteredImage(x,y,1) = uint8(redValue);
                filteredImage(x,y,2) = uint8(greenValue);
                filteredImage(x,y,3) = uint8(blueValue);
        end
    end
end

function filteredImage = applyBoxOnImage(radius, img)
    inputImage = imread(img);
    [row,column,~] = size(inputImage);
    
    for x =-radius:radius
        for y=-radius:radius
            kernel(x + radius+1,y + radius+1) = 1/21;
        end
    end

    for x=radius:(row - radius)-1
        for y=radius:(column - radius)-1

                redValue = 0.0;
                greenValue = 0.0;
                blueValue = 0.0;

                for kernelX= -radius:radius
                    for kernelY= -radius:radius
                        kernelValue = kernel(kernelX + radius+1,kernelY + radius+1);

                        redValue = redValue + (inputImage(x - kernelX+1, y - kernelY+1,1)/(49)); 
                        greenValue = greenValue + (inputImage(x - kernelX+1, y - kernelY+1,2)/(49)) ;
                        blueValue =blueValue+ (inputImage(x - kernelX+1, y - kernelY+1,3)/(49));
                   
                    end
                end

                filteredImage(x,y,1) = uint8(redValue);
                filteredImage(x,y,2) = uint8(greenValue);
                filteredImage(x,y,3) = uint8(blueValue);
        end
    end

end



