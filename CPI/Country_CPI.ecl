#OPTION('obfuscateOutput', TRUE);

import $;
Disasters := $.File_Disasters.File;
mytable12 := $.Temporal_CPI.mytable12;

myrec14 :=RECORD
    string country := mytable12.country;
    decimal avg_cpi := ave(group,mytable12.cpi);
    
END;

mytable14 := Table(mytable12,myrec14,country );
output(mytable14, named('CountrywiseAvgCpi'))