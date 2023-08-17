// #OPTION('obfuscateOutput', TRUE);
export BWRepidemic := MODULE
import $;
Dis2 := $.File_Dis2.FIle;

myrec31 := RECORD

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

myrec31 T31(dis2 l) := TRANSFORM
self:= L;
end;



mytable31 := project(dis2 , T31(left) );
filter := mytable31.affected <>0 or mytable31.totaldeath<>0;
filtmytable31 := mytable31(filter);


export epidemics := filtmytable31(distype='Epidemic');


END;