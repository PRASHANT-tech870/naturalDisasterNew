#OPTION('obfuscateOutput', TRUE);

import $;
Disasters := $.File_Disasters.File;


myrec:=RECORD
string country := disasters.country;

unsigned deaths := sum(group, disasters.totaldeath);


END;


mytable := table(Disasters, myrec,country);
mytable1 := PROJECT(mytable[2..], myrec);
// OUTPUT(mytable);
output(mytable1, named('CountryWiseDeath'));
