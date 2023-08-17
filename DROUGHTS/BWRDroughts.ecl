// #OPTION('obfuscateOutput', TRUE);
export BWRDroughts := MODULE
import $;
Dis2 := $.File_Dis2.FIle;

myrec21 := RECORD

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

myrec21 T21(dis2 l) := TRANSFORM
self:= L;
end;



mytable21 := project(dis2 , T21(left) );
filter := mytable21.affected <>0 or mytable21.totaldeath<>0;
filtmytable21 := mytable21(filter);


export Droughts := filtmytable21(distype='Drought');


END;