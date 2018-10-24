function strout = Asciiconvert(strin)
str=unicode2native(strin);
lenghtstr=numel(str);
i=1;
while i<=numel(str)
    if ((str(1,i)>127)||(str(1,i)==26))
        str(:,i)=[];
        i=i-1;
    end
    i=i+1;
end
str=native2unicode(str);
strout=string(str);