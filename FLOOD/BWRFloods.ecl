// #OPTION('obfuscateOutput', TRUE);
export bwrfloods:= module 
import $;
Dis2 := $.File_Dis2.File;




myrec15 := RECORD

    unsigned year := Dis2.year;
string dissubgroup:= dis2.dissubgroup;

string distype:= dis2.distype;
string dissubtype:= dis2.dissubtype;
string country := dis2.country;

decimal dismag:= dis2.dismag;
unsigned homeless:= dis2.homeless;

unsigned injured:= dis2.injured;

unsigned affected:= dis2.affected;
unsigned damages:=dis2.damages;

unsigned totaldeath:= dis2.totaldeath;
decimal5_3 cpi:= dis2.cpi;
END;

myrec15 T4(dis2 l) := TRANSFORM
self:= L;
end;

mytable15 := project(dis2 , T4(left) );

// mytable15;
filter := mytable15.dismag <>0;
filtmytable15 := mytable15(filter);
floodtable := filtmytable15(distype='Flood');


export file :=  group(floodtable, country);
export myrec15;
end;