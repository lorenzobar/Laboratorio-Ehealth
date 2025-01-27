%% Lab - parte 1
 
Dataset = {};
%preallocate variable Dataset
url1= 'https://itunes.apple.com/us/genre/ios-medical/id6020?mt=8&letter=A&page=1#page';
url2 = 'https://itunes.apple.com/us/genre/ios-health-fitness/id6013?mt=8&letter=A&page=1#page';
urltot = {url1;url2};
%definisco un url iniziale (di default sulla lettera A)
 
alfabeto = ['A';'B';'C';'D';'E';'F';'G';'H';'I';'J';'K';'L';'M';'N';'O';'P';'Q';'R';'S';'T';'U';'V';'W';'X';'Y';'Z';'*'];
%'A';'B';'C';'D';'E';'F';'G';'H';'I';'J';'K';'L';'M';'N';'O';'P';'Q';'R';'S';'T';'U';'V';'W';'X';'Y';'Z';'*'
%creo un vettore che contiene tutte le lettere dell'alfabeto
 
for a = 1:length(urltot)
     
    Dataset = {};
    %preallocate variable Dataset
     
    url = urltot(a);
     
    urlSplit = split(url,{'https://itunes.apple.com/us/genre/ios-(.*?)/id(.*?)?mt=8&letter=','&'});
    %divido l'URL in 3: nella cell 2 trovo la pagina
     
    for i = 1:length(alfabeto)
         
        urlSplit{2}=alfabeto(i);
        %vado a mettere nella cell 2 la lettera dell'alfabeto di cui voglio
        %trovare le app
         
        urlAttached = strjoin(urlSplit,{'https://itunes.apple.com/us/genre/ios-(.*?)/id(.*?)?mt=8&letter=','&'});
        %'riattacco' l'URL insieme
         
        %options = weboptions('Timeout',60);
         
         
        S1 = webread(urlAttached);
        %S1 = webread(urlAttached,options);
       %leggo l'URL
         
        %cerco il numero delle pagine
        pattern = ' <ul class="list paginate"><li><a(.*?)</a></li></ul>';
        %prendo tutto ci� che c'e in mezzo quello tra [] do sotto con (.*?).
        %<ul class="list paginate"><li><a [href="https://itunes.apple.com/us/genre/ios-medical/id6020?mt=8&amp;letter=A&amp;page=1#page" class="selected">1]</a></li><li><a
         
        URLnumero = regexp(S1, pattern,'match');
        %creo array con tutti gli URL
         
        if(isempty(URLnumero) == 1)
            numeroPagine = 1;
        else
             
            arrayNumeri = split(URLnumero(1),{'#page">','</a></li>'});
            numeroChar = arrayNumeri{length(arrayNumeri)-2};
            numeroPagine = str2double(numeroChar);
             
            if (numeroPagine == 18)
                 
                urlSplit18 = split(urlAttached,{'&page=','#page'});
                %spezzo di nuovo l'URL per andare a inserire i numeri
                 
                urlSplit18{2}='18'; %%%%%%%%devo concertirlo in char
                %sostituisco j
                 
                urlAttached18 = strjoin(urlSplit18,{'&page=','#page'});
                %riattacco l'URL
                 
                S18 = webread(urlAttached18);
                %leggo l'URL
                 
                pattern18 = ' <ul class="list paginate"><li><a(.*?)</a></li></ul>';
                %prendo tutto ci� che c'e in mezzo con (.*?).
                 
                URLnumero18 = regexp(S18, pattern18,'match');
                %creo array con tutti gli URL
                 
                arrayNumeri18 = split(URLnumero18(1),{'#page">','</a></li>'});
                numeroChar18 = arrayNumeri18{length(arrayNumeri18)-2};
                numeroPagine = str2double(numeroChar18);
                 
                if (numeroPagine == 26)
                     
                    urlSplit26 = split(urlAttached18,{'&page=','#page'});
                    %spezzo di nuovo l'URL per andare a inserire i numeri
                     
                    urlSplit26{2}='26'; %%%%%%%%devo concertirlo in char
                    %sostituisco j
                     
                    urlAttached26 = strjoin(urlSplit26,{'&page=','#page'});
                    %riattacco l'URL
                     
                    S26 = webread(urlAttached26);
                    %leggo l'URL
                     
                    pattern26 = ' <ul class="list paginate"><li><a(.*?)</a></li></ul>';
                    %prendo tutto ci� che c'e in mezzo con (.*?).
                     
                    URLnumero26 = regexp(S26, pattern26,'match');
                    %creo array con tutti gli URL
                     
                    arrayNumeri26 = split(URLnumero26(1),{'#page">','</a></li>'});
                    numeroChar26 = arrayNumeri26{length(arrayNumeri26)-2};
                    numeroPagine = str2double(numeroChar26);
                     
                    if (numeroPagine == 34)
                         
                        urlSplit34 = split(urlAttached26,{'&page=','#page'});
                        %spezzo di nuovo l'URL per andare a inserire i numeri
                         
                        urlSplit34{2}='34'; %%%%%%%%devo concertirlo in char
                        %sostituisco j
                         
                        urlAttached34 = strjoin(urlSplit34,{'&page=','#page'});
                        %riattacco l'URL
                         
                        S34 = webread(urlAttached34);
                        %leggo l'URL
                         
                        pattern34 = ' <ul class="list paginate"><li><a(.*?)</a></li></ul>';
                        %prendo tutto ci� che c'e in mezzo con (.*?).
                         
                        URLnumero34 = regexp(S34, pattern34,'match');
                        %creo array con tutti gli URL
                         
                        arrayNumeri34 = split(URLnumero34(1),{'#page">','</a></li>'});
                        numeroChar34 = arrayNumeri34{length(arrayNumeri34)-2};
                        numeroPagine = str2double(numeroChar34);
                         
                        if (numeroPagine == 42)
                             
                            urlSplit42 = split(urlAttached34,{'&page=','#page'});
                            %spezzo di nuovo l'URL per andare a inserire i numeri
                             
                            urlSplit42{2}='42'; %%%%%%%%devo concertirlo in char
                            %sostituisco j
                             
                            urlAttached42 = strjoin(urlSplit42,{'&page=','#page'});
                            %riattacco l'URL
                             
                            S42 = webread(urlAttached42);
                            %leggo l'URL
                             
                            pattern42 = ' <ul class="list paginate"><li><a(.*?)</a></li></ul>';
                            %prendo tutto ci� che c'e in mezzo con (.*?).
                             
                            URLnumero42 = regexp(S42, pattern42,'match');
                            %creo array con tutti gli URL
                             
                            arrayNumeri42 = split(URLnumero42(1),{'#page">','</a></li>'});
                            numeroChar42 = arrayNumeri42{length(arrayNumeri42)-2};
                            numeroPagine = str2double(numeroChar42);
                             
                            if (numeroPagine == 50)
                                 
                                urlSplit50 = split(urlAttached42,{'&page=','#page'});
                                %spezzo di nuovo l'URL per andare a inserire i numeri
                                 
                                urlSplit50{2}='50'; %%%%%%%%devo concertirlo in char
                                %sostituisco j
                                 
                                urlAttached50 = strjoin(urlSplit50,{'&page=','#page'});
                                %riattacco l'URL
                                 
                                S50 = webread(urlAttached50);
                                %leggo l'URL
                                 
                                pattern50 = ' <ul class="list paginate"><li><a(.*?)</a></li></ul>';
                                %prendo tutto ci� che c'e in mezzo con (.*?).
                                 
                                URLnumero50 = regexp(S50, pattern50,'match');
                                %creo array con tutti gli URL
                                 
                                arrayNumeri50 = split(URLnumero50(1),{'#page">','</a></li>'});
                                numeroChar50 = arrayNumeri50{length(arrayNumeri50)-2};
                                numeroPagine = str2double(numeroChar50);
                                 
                            end
                        end
                    end
                end
            end
        end
         
         
         
        for j = 1:numeroPagine
             
            urlSplitNumeri = split(urlAttached,{'&page=','#page'});
            %spezzo di nuovo l'URL per andare a inserire i numeri
             
            urlSplitNumeri{2}=num2str(j); %%%%%%%%devo concertirlo in char
            %sostituisco j
             
            urlAttached2 = strjoin(urlSplitNumeri,{'&page=','#page'});
            %riattacco l'URL
             
            S = webread(urlAttached2);
            %leggo l'URL
             
            pattern = '<li><a href="https://itunes.apple.com/us/app/(.*?)</a> </li>';
            %prendo tutto ci� che c'e in mezzo con (.*?). Riesco a prendere cosi tutti gli URL
            %<li><a href="https://itunes.apple.com/us/app/(.*?)</a> </li>
            %<li><a href="https://itunes.apple.com/us/app/(.*?)/(.*?)?mt=8">(.*?)</a> </li>
            
            URLapps = regexp(S, pattern,'match');
            %creo array con tutti gli URL
             
            for k=1:length(URLapps) 
              
                splitURL = split(URLapps(k),{'/id','?mt=8">','<'});
                canc1 = '<li><a href="';
                canc2 = '</a> </li>';
                URL = regexprep(URLapps(k),canc1,'');
                URL = regexprep(URL,canc2,'');
                Dataset(1,end+1) = URL;
                 
                dimDataset = size(Dataset);
                Dataset(2,dimDataset(2)) = splitURL(5);
                Dataset(3,dimDataset(2)) = splitURL(4);
%                 ID = split(splitURL(7),{'id','?'});
%                 Dataset(1,end+1) = ID(2);
%                 
%                 Name = split(ID(3),{'mt=8">','<'});
%                 Dataset(2,length(Dataset)) = Name(2);
                 
            end
        end
    end
     
    if a == 1
        DatasetA = Dataset';
    end
     
    if a == 2
        DatasetB = Dataset';
    end
     
    if a == 3
        DatasetC = Dataset';
    end
     
    clear Dataset
end
 
DatasetAtable = cell2table(DatasetA, 'VariableNames',{'URL','Name','ID'});
DatasetBtable = cell2table(DatasetB, 'VariableNames',{'URL','Name','ID'});
DatasetMergedTable = intersect(DatasetAtable,DatasetBtable,'sorted');
 
%DatasetMergedTable = sortrows(DatasetMergedTable,'Name','ascend');
 
%esporto su excel
% fileNameDatasetA = 'datasetA.xlsx'
% writetable(DatasetAtable, fileNameDatasetA);
% winopen(fileNameDatasetA);