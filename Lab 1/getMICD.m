function dist = getMICD( x, y, class )
    diff = [x,y]' - class.mu;
    dist = (diff'*inv(class.sigma)*diff)^(1/2);
end