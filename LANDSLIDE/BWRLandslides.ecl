// #OPTION('obfuscateOutput', TRUE);
export BWRlandslides := MODULE
import $;
Dis2 := $.File_Dis2.FIle;

myrec41 := RECORD

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

myrec41 T41(dis2 l) := TRANSFORM
self:= L;
end;



mytable41 := project(dis2 , T41(left) );
filter := mytable41.affected <> 0  or mytable41.totaldeath<>0;
filtmytable41 := mytable41(filter);


export Landslides := filtmytable41(distype='Landslide');


END;