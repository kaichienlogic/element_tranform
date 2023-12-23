clc;
clear all
fid1=dlmread('element.dat');
fid2=dlmread('node.dat');
[r1,c1]=size(fid1);
[r2,c2]=size(fid2);
c=cell(2+r1+r2,10);
prep7='/prep7';
n='n';
c{1,1}=prep7;
c{1,2}='';
c{1,3}='';
c{1,4}='';
c{1,5}='';
c{1,6}='';
c{1,7}='';
c{1,8}='';
c{1,9}='';
c{1,10}='';

for j=2:r2+1
    c{j,1}=n;
    for k=2:10
        if k <= 5
           c{j,k}=fid2(j-1,k-1);
        elseif k > 5
            c{j,k}='';
        end
    end
end

c{j+1,1}='et'
c{j+1,2}=1;
c{j+1,3}=182;
c{j+1,4}='';
c{j+1,5}='';
c{j+1,6}='';
c{j+1,7}='';
c{j+1,8}='';
c{j+1,9}='';
c{j+1,10}='';
for h=j+2:j+2+r1-1
    c{h,1}='en';
    for r=2:10
        if r <= 6
            c{h,r}=fid1(h-(j+1),r-1);
        elseif k > 6
            c{j,k}='';
        end
    end
end

c{j+2+r1,1}='cdwrite';
c{j+2+r1,2}='db';
c{j+2+r1,3}='test';
c{j+2+r1,4}='cdb';
c{j+2+r1,5}='';
c{j+2+r1,6}='';
c{j+2+r1,7}='';
c{j+2+r1,8}='';
c{j+2+r1,9}='';
c{j+2+r1,10}='';

writecell(c,'axisymmetric.csv');