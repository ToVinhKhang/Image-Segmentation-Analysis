function [l,P]=lagrange(x,y)
    l=0;
    n=length(x);
    for i=1:n
        p=1;
        for j=1:n
            if (j~=i)
                c = poly(x(j))/(x(i)-x(j));
                p = conv(p,c);
            end
        end
        P = p*y(i);
        l = l + P;
    end
end