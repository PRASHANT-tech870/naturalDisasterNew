#OPTION('obfuscateOutput', TRUE);
import $;
Disasters := $.File_Disasters.File;

myrec2 := RECORD
    
    string country:= disasters.country;
    unsigned startmonth:=disasters.startmonth;
    unsigned count_disaster:= count(group);
END;

mytable2 := table(disasters,myrec2,country,startmonth);
mytable3 := PROJECT(mytable2[2..], myrec2);
mytable3;


myrec3:=RECORD

string country := mytable3.country;

unsigned avgdisasters := ave(group, mytable3.count_disaster);


END;


mytable4 := table(mytable3, myrec3,country);


mytable4;

myrec4:=RECORD
    string country:= disasters.country;
    unsigned startmonth:=mytable3.startmonth;
    unsigned count_disaster:= mytable3.count_disaster;
    unsigned avgdisasters := mytable4.avgdisasters;
    
END;

myrec4 T1(mytable3 l,mytable4 r) := TRANSFORM
self:=l;
self.avgdisasters:=r.avgdisasters;
end;

mytable5:= join(mytable3 , mytable4 ,left.country=right.country, T1(left,right));
mytable5;

myrec5 :=RECORD
string country:= mytable5.country;
    unsigned startmonth:=mytable5.startmonth;
    unsigned count_disaster:= mytable5.count_disaster;
    unsigned avgdisasters := mytable5.avgdisasters;
    integer deviation;
    
END;

myrec5 T2(mytable5 l) := TRANSFORM
self:=l;
self.deviation := ABS(l.count_disaster - l.avgdisasters);

end;

mytable6 := PROJECT(mytable5,T2(left));
OUTPUT(mytable6,named('MostVariedMonths'));


