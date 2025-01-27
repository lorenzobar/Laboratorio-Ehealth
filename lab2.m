%% LAB2
  
fine = size(DatasetAtable,1);
numeroRiga = [];
str = [];
attributes=['ID','AppName','url','AppDescription','keywords','Version','AgeRating','Language','artistID','artistName','developerURL','Category','price','PriceCurrency','filesize','LastUpdateDate','releaseDate','averageUserRatingForCurrentVersion','userRatingCountForCurrentVersion','AvgUserRatingAll','NumberUserRatingAll','FiveStar','FourStar','ThreeStar','TwoStar','OneStar','DateRetrieved'];
for i = 1:100 %fine
      
    url = DatasetAtable.URL{i};
    S = webread(url);
    id = DatasetAtable.ID{i};
    urllookup = 'https://itunes.apple.com/lookup?id=XXXXX';
    urlSPLIT = split(urllookup,'=');
      
    urlSPLIT{2} = id;
    urllookup = strjoin(urlSPLIT,'=');
        Slookup = webread(urllookup);
      
    % 1
    AppID=DatasetAtable.ID{i};
    if (isempty(AppID))
        AppID = {'NULL'};
    end
      
    % 2
    AppName=DatasetAtable.Name{i};
    if (isempty(AppName))
        AppName = {'NULL'};
    end
      
    % 3
    %l'url viene gi� preso considerando la variabile URL gi� definita sopra
      
    % 4
    pattern = '<p aria-label="(.*?)" id=';
    AppDescription=regexp(S, pattern, 'tokens');
    if (isempty(AppDescription))
        AppDescription = {'NULL'};
    else
        AppDescription = AppDescription(1);
        AppDescription = string(AppDescription);    
    end

     
      
    % 5
    pattern = '<meta name="keywords" content="(.*?)" id=';
    keywords=regexp(S, pattern, 'tokens');
    if (isempty(keywords))
        keywords = {'NULL'};
    else
        keywords = keywords(1);
        keywords = string(keywords);
    end
     
      
    % 6
    pattern = '"versionString":"(.*?)","releaseDate"';
    Version=regexp(S, pattern, 'tokens');
    if (isempty(Version))
        Version = {'NULL'};
    else
        Version = Version(1);
        Version = string(Version);
    end
         
  
    % 7
    pattern = '<dd class="information-list__item__definition l-column medium-9 large-6">(.*?)</dd>';
    AgeRating=regexp(S, pattern, 'tokens');
    if (isempty(AgeRating))
        AgeRating = {'NULL'};
    else
        AgeRating = AgeRating(3);
        AgeRating = string(AgeRating);
    end
         
      
    % 8
    pattern = '>Languages</dt>(.*?)" id="ember';
    Language=regexp(S, pattern, 'tokens');
    Language = regexp(Language{1}, '="', 'split');
    Language = Language{1, 1}{1, 2};
    if (isempty(Language))
        datasetNEW.Language = {'NULL'};
    end
    EnglishTrue = strfind(Language,'English');
    if (isempty(EnglishTrue))
        numeroRiga = [numeroRiga i];
    end
      
    % 9
    pattern = ':{"data":{"type":"lockup/developer","id":"(.*?)"}}';
    artistID=regexp(S, pattern, 'tokens');
    if (isempty(artistID))
        artistID = {'NULL'};
    else
        artistID = artistID(1);
        artistID = string(artistID);
    end
          
    % 10
    pattern = '"author":{"@type":"Person","name":"(.*?)",';
    artistName=regexp(S, pattern, 'tokens');
    if (isempty(artistName))
        artistName = {'NULL'};
    else
        artistName = artistName(1);    
        artistName = string(artistName);
    end 
  
      
    % 11
    pattern = '"url":"(.*?)},"';
    developerURL=regexp(S, pattern, 'tokens');
    if (isempty(developerURL))
        developerURL = {'NULL'};
    else
        developerURL = developerURL(1);
        developerURL = string(developerURL);
    end
          
  
      
    % 12
    pattern = '"applicationCategory":"(.*?)",';
    Category=regexp(S, pattern, 'tokens');
    if (isempty(Category))
        Category = {'NULL'};
    else
        Category = Category(1);
        Category = string(Category);
    end
          
  
    % 13
    pattern = '"price":(.*?),"priceCu';
    price=regexp(S, pattern, 'tokens');
    if (isempty(price))
        price = {'NULL'};
    else
        price = price(1);
        price = cell2mat([price{:}]);
        price = str2double(price);
    end
          
      
    % 14
    pattern = '"priceCurrency":"(.*?)"';
    PriceCurrency=regexp(S, pattern, 'tokens');
    if (isempty(PriceCurrency))
        PriceCurrency = {'NULL'};
    else
        PriceCurrency = PriceCurrency(1);
        PriceCurrency = string(PriceCurrency);
    end
          
  
   %15
    pattern = '"fileSizeBytes":"(.*?)",';
    filesize=regexp(Slookup, pattern, 'tokens');
    if (isempty(filesize))
        filesize = {'NULL'};
    else
        filesize = filesize(1);
        filesize = str2double(filesize{1}); %convert to number
        filesize = filesize/1048576; % conversione byte --> Mb
        filesize = {num2str(filesize)}; %riconverto in string
    end
  
      
    % 16
    pattern = '<time data-test-we-datetime datetime="(.*?)" aria-label=';
    LastUpdateDate=regexp(S, pattern, 'tokens');
      
    if (isempty(LastUpdateDate))
        LastUpdateDate = {'NULL'};
    else
        LastUpdateDate = LastUpdateDate(1);
        LastUpdateDate = string(LastUpdateDate);
  
    end
          
      
    % 17
    pattern = '"releaseDate":"(.*?)"';
    releaseDate=regexp(S, pattern, 'tokens');
    if (isempty(releaseDate))
        releaseDate = {'NULL'};
    else
        releaseDate = releaseDate(1);
        releaseDate = string(releaseDate);
    end
         
      
%     % 18
%     pattern = '"averageUserRatingForCurrentVersion":(.*?),';
%     averageUserRatingForCurrentVersion=regexp(Slookup, pattern, 'tokens');
%     if (isempty(averageUserRatingForCurrentVersion))
%         averageUserRatingForCurrentVersion = {'NULL'};
%     else
%         averageUserRatingForCurrentVersion = averageUserRatingForCurrentVersion(1);
%         averageUserRatingForCurrentVersion = string(averageUserRatingForCurrentVersion);
%     end
%       
%          
%     % 19
%     pattern = '"userRatingCountForCurrentVersion":(.*?),';
%     userRatingCountForCurrentVersion=regexp(Slookup, pattern, 'tokens');
%       
%     if (isempty(userRatingCountForCurrentVersion))
%         userRatingCountForCurrentVersion = {'NULL'};
%     else
%         userRatingCountForCurrentVersion = userRatingCountForCurrentVersion (1);
%         userRatingCountForCurrentVersion = string(userRatingCountForCurrentVersion);
%     end
%       
  
    %20
    pattern='"ratingValue":(.*?),"';
    AvgUserRatingAll = regexp(S, pattern, 'tokens');
    if (isempty( AvgUserRatingAll))
         AvgUserRatingAll = {'NULL'};
    else
         AvgUserRatingAll =  AvgUserRatingAll(1);
         AvgUserRatingAll = string(AvgUserRatingAll);
 
    end
      
    %21
    pattern='"reviewCount":(.*?)},';
    NumberUserRatingAll = regexp(S, pattern, 'tokens');
      
    if (isempty(NumberUserRatingAll))
        NumberUserRatingAll = {'NULL'};
    else
        NumberUserRatingAll = NumberUserRatingAll(1); 
        NumberUserRatingAll = string(NumberUserRatingAll);
    end
      
     %22-23-24-25-26
    pattern = '<div class="we-star-bar-graph__bar__foreground-bar" style="width:(.*?);' ;
    userratingstars = regexp(S, pattern, 'tokens');
     
     if (isempty(userratingstars))
        userratingstars = {'NULL','NULL','NULL','NULL','NULL'};  
     end
      
      %27
    DateRetrived = datetime('today');
    DateRetrieved = string(DateRetrived);
      
       
       
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      
    datasetNEW.ID{1,i} = AppID;
    datasetNEW.AppName{1,i} = AppName;
    datasetNEW.url{1,i} = url;
    datasetNEW.AppDescription{1,i} = AppDescription;
    datasetNEW.keywords{1,i} = keywords; %5
    datasetNEW.Version{1,i} = Version;
    datasetNEW.AgeRating{1,i} = AgeRating;
    datasetNEW.Language{1,i} = Language;
    datasetNEW.artistID{1,i} = artistID;
    datasetNEW.artistName{1,i} = artistName; %10
    datasetNEW.developerURL{1,i} = developerURL;
    datasetNEW.Category{1,i} = Category;
    datasetNEW.price{1,i} = price;
    datasetNEW.PriceCurrency{1,i} = PriceCurrency;
    datasetNEW.filesize{1,i} = filesize; %15
    datasetNEW.LastUpdateDate{1,i} = LastUpdateDate;
    datasetNEW.releaseDate{1,i} = releaseDate;
%     datasetNEW.averageUserRatingForCurrentVersion{1,i} = averageUserRatingForCurrentVersion;
%     datasetNEW.userRatingCountForCurrentVersion{1,i} = userRatingCountForCurrentVersion;
    datasetNEW.AvgUserRatingAll{1,i} = AvgUserRatingAll;
    datasetNEW.NumberUserRatingAll{1,i} = NumberUserRatingAll;
    datasetNEW.FiveStar{1,i} = userratingstars{1};
    datasetNEW.FourStar{1,i} = userratingstars{2};
    datasetNEW.ThreeStar{1,i} = userratingstars{3};
    datasetNEW.TwoStar{1,i} = userratingstars{4};
    datasetNEW.OneStar{1,i} = userratingstars{5};
    datasetNEW.DateRetrieved{1,i} = DateRetrieved ;
      
end
 
datasetNEW1=structfun(@transpose,datasetNEW,'UniformOutput',false);   
T=struct2table(datasetNEW1);
 
%elimino le app che non hanno la lingua inglese
T(numeroRiga,:)=[];