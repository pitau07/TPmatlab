function [ proba ] = computeProbaKPPV( KPPV,k )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    proba=zeros(100,10);

    for i=1:100
          N=histc(KPPV(i,:),0:9);
          proba(i,:)=N./k;
    end
end

