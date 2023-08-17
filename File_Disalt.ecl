EXPORT File_Disalt := MODULE
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
EXPORT File := DATASET('hthor::pr::ndisastersalt.csv',Layout,csv);
END;
