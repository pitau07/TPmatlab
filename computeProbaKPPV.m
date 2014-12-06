function [ proba ] = computeProbaKPPV( KPPV,k )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    l=size(KPPV,1);
    proba=zeros(100,10);

    for i=1:l
          N=histc(KPPV(i,:),0:9);
          proba(i,:)=N./k;
    end
end

