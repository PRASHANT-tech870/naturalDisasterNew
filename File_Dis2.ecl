EXPORT File_Dis2 := MODULE
EXPORT Layout := RECORD

unsigned year;
string disgroup;
string dissubgroup;
string distype;
string dissubtype;
string appeal;
string eventsname;
string country;
string region;
string location;
decimal dismag;
decimal latitude;
decimal longitude;
unsigned startyear;
unsigned startmonth;
unsigned startday;
unsigned endyear;
unsigned endmonth;
unsigned endday;
unsigned homeless;
unsigned injured;
unsigned affected;
unsigned damages;
unsigned totaldeath;
decimal5_3 cpi;


    
END;


EXPORT MLProp4 := RECORD



    unsigned affected;
    
    unsigned injured;
    
    
    unsigned damages;
    
    unsigned totaldeath;
    decimal5_3 cpi;
    unsigned homeless;
    
END;




EXPORT File := DATASET('pr::test03.csv',Layout,csv);
END;
