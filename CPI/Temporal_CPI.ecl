// #OPTION('obfuscateOutput', TRUE);

import $;
Disasters := $.File_Disasters.File;
EXPORT Temporal_CPI := MODULE

myrec11 := RECORD
    
    unsigned year := disasters.year;
    string country := disasters.country;
    decimal cpi := disasters.cpi;

END;

mytable11 := table(disasters,myrec11,country,year);
export mytable12:= project(mytable11[2..] , myrec11);


END;




