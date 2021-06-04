% Read image
pic=imread('PictureRGB.png');

% Gray scale
pic=rgb2gray(pic);

% Show image
figure(1)
imshow(pic)

% Find x,y
[y,x] = imhist(pic);
x=x'
y=y'

% Polynomial function f(x) in the case of using the built-in function of MATLAB
p=polyfit(x,y,3);
fx1=polyval(p,x)

% Polynomial function f(x) in the case of using my function: Lagrange
l=lagrange(x,y);
fx2=polyval(l,x)

% Relative Error (n=3)
polywithN3=polyfit(x,y,3);
resultN3=polyval(polywithN3,x);
RelativeErrorN3=abs(y-resultN3/y)

% Relative Error (n=4)
polywithN4=polyfit(x,y,4);
resultN4=polyval(polywithN4,x);
RelativeErrorN4=abs(y-resultN4/y)

% Relative Error (n=5)
polywithN5=polyfit(x,y,5);
resultN5=polyval(polywithN5,x);
RelativeErrorN5=abs(y-resultN5/y)

% Relative Error (n=6)
polywithN6=polyfit(x,y,6);
resultN6=polyval(polywithN6,x);
RelativeErrorN6=abs(y-resultN6/y)

% Comparison of the relative errors
% Calculate the average relative error
disp(['Average relative error (degree n=3) : ' num2str(avgRelativeError(RelativeErrorN3))])
disp(['Average relative error (degree n=4) : ' num2str(avgRelativeError(RelativeErrorN4))])
disp(['Average relative error (degree n=5) : ' num2str(avgRelativeError(RelativeErrorN5))])
disp(['Average relative error (degree n=6 ): ' num2str(avgRelativeError(RelativeErrorN6))])

% plot
figure(2)
hold on
plot(x,y,'-r')
plot(x,resultN3,'k')
plot(x,resultN4,'b')
plot(x,resultN5,'y')
plot(x,resultN6,'g')
legend('Actual','Poly n=3','Poly n=4','Poly n=5','Poly n=6')
hold off

% y'' of y^ vector from g(x)
pd=abs(diff(polyval(polywithN3,x)));
pd=diff(pd);

% Find the index
IndexJ=find(pd == min(pd(:)))

% Find maximum intensity
L = max(pic(:))

% Find Theta
Theta=IndexJ/L-1

% Matrix Binary
for i=1:length(pic)
    for j=1:length(pic)
        if((pic(i,j)/length(x))>Theta)
            pic(i,j)=1;
        else
            pic(i,j)=0;
        end
    end
end
pic=pic>Theta;

% Display Binary image
figure(3)
imshow(pic)






