EXPORT File_Disasters := MODULE
EXPORT Layout := RECORD

unsigned year;
string disgroup;
string dissubgroup;
string distype;
string dissubtype;
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
unsigned totaldeath;
decimal cpi;


    
END;


EXPORT MLProp := RECORD
    decimal cpi;
    unsigned totaldeath;
END;


EXPORT File := DATASET('hthor::pr::ndisasters.csv',Layout,csv);
END;
