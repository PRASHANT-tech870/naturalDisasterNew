#OPTION('obfuscateOutput', TRUE);
import $.DROUGHTS;
RelD := $.DROUGHTS.Drought_prop.mytable16;
SI:= $.DROUGHTS.Drought_prop.mytable17;
TotalSI:= $.DROUGHTS.Drought_prop.mytable51;
Position:= $.DROUGHTS.Drought_prop.AddSeverity_Score;
// position;
output(RelD,named('NORMALISED_VALUES_DROUGHTS'));
output(SI,named('SEVERITY_INDEX_DROUGHTS'));
output(TotalSI,named('COUNTRY_SI_DROUGHTS'));
output(position,named('SAFETY_RANK_DROUGHTS'));

 
import $.EARTHQUAKE;
RelD2 := $.Earthquake.Earthquake_prop.mytable16;
SI2 := $.Earthquake.Earthquake_prop.mytable17;
TotalSI2 := $.Earthquake.Earthquake_prop.mytable51;
Position2 := $.Earthquake.Earthquake_prop.AddSeverity_Score;
// position2;
output(RelD2,named('NORMALISED_VALUES_EARTHQUAKE'));
output(SI2,named('SEVERITY_INDEX_EARTHQUAKE'));
output(TotalSI2,named('COUNTRY_SI_EARTHQUAKE'));
output(position2,named('SAFETY_RANK_EARTHQUAKE'));


import $.epidemic;
RelD3 := $.epidemic.epidemic_prop.mytable16;
SI3 := $.epidemic.epidemic_prop.mytable17;
TotalSI3 := $.epidemic.epidemic_prop.mytable51;
Position3 := $.epidemic.epidemic_prop.AddSeverity_Score;
output(RelD3,named('NORMALISED_VALUES_EPIDEMIC'));
output(SI3,named('SEVERITY_INDEX_EPIDEMIC'));
output(TotalSI3,named('COUNTRY_SI_EPIDEMIC'));
output(position3,named('SAFETY_RANK_EPIDEMIC'));

import $.flood;
RelD4 := $.flood.flood_prop.mytable16;
SI4 := $.flood.flood_prop.mytable17;
TotalSI4 := $.flood.flood_prop.mytable51;
Position4 := $.flood.flood_prop.AddSeverity_Score;
output(RelD4,named('NORMALISED_VALUES_FLOOD'));
output(SI4,named('SEVERITY_INDEX_FLOOD'));
output(TotalSI4,named('COUNTRY_SI_FLOOD'));
output(position4,named('SAFETY_RANK_FLOOD'));


import $.landslide;
RelD5 := $.landslide.landslide_prop.mytable16;
SI5 := $.landslide.landslide_prop.mytable17;
TotalSI5 := $.landslide.landslide_prop.mytable51;
Position5 := $.landslide.landslide_prop.AddSeverity_Score;
output(RelD5,named('NORMALISED_VALUES_LANDSLIDE'));
output(SI5,named('SEVERITY_INDEX_LANDSLIDE'));
output(TotalSI5,named('COUNTRY_SI_LANDSLIDE'));
output(position5,named('SAFETY_RANK_LANDSLIDE'));


import $.Volcano;
RelD6 := $.Volcano.Volcano_prop.mytable16;
SI6 := $.Volcano.Volcano_prop.mytable17;
TotalSI6 := $.Volcano.Volcano_prop.mytable51;
Position6 := $.Volcano.Volcano_prop.AddSeverity_Score;
output(RelD6,named('NORMALISED_VALUES_VOLCANO'));
output(SI6,named('SEVERITY_INDEX_VOLCANO'));
output(TotalSI6,named('COUNTRY_SI_VOLCANO'));
output(position6,named('SAFETY_RANK_VOLCANO'));



import $.wildfire;
RelD7 := $.wildfire.wildfire_prop.mytable16;
SI7:= $.wildfire.wildfire_prop.mytable17;
TotalSI7 := $.wildfire.wildfire_prop.mytable51;
Position7 := $.wildfire.wildfire_prop.AddSeverity_Score;
output(RelD7,named('NORMALISED_VALUES_WILDFIRE'));
output(SI7,named('SEVERITY_INDEX_WILDFIRE'));
output(TotalSI7,named('COUNTRY_SI_WILDFIRE'));
output(position7,named('SAFETY_RANK_WILDFIRE'));




myrec100 := RECORD
string country;
    unsigned epidemic;
    unsigned earthquakes;
    
END;

myrec100 T100(position3 l , position2 r) := TRANSFORM
    SELF.country := l.country;
    self.epidemic := l.severity_score;
    self.earthquakes := r.severity_score;
    
END;

mytable100 := join(position3,position2,left.country = right.country,T100(left,right), left outer);

//mytable100;

//

myrec101 := RECORD
string country;
    unsigned epidemic;
    unsigned earthquakes;
    unsigned droughts;
END;

myrec101 T101(mytable100 l , position r) := TRANSFORM
    SELF.country := l.country;
    self.epidemic := l.epidemic;
    self.earthquakes := l.earthquakes;
    self.droughts := r.severity_score;
    
END;

mytable101 := join(mytable100,position,left.country = right.country,T101(left,right),left outer);

//mytable101;

//

myrec102 := RECORD
string country;
    unsigned droughts;
    unsigned earthquakes;
    unsigned epidemic;
    unsigned flood;
END;

myrec102 T102(mytable101 l , position4 r) := TRANSFORM
    SELF.country := l.country;
    self.droughts := l.droughts;
    self.earthquakes := l.earthquakes;
    self.epidemic := l.epidemic;
    self.flood := r.severity_score;
END;

mytable102 := join(mytable101,position4,left.country = right.country,T102(left,right),left outer);

//mytable102;

//

myrec103 := RECORD
string country;
    unsigned droughts;
    unsigned earthquakes;
    unsigned epidemic;
    unsigned flood;
    unsigned landslide;
END;

myrec103 T103(mytable102 l , position5 r) := TRANSFORM
    SELF.country := l.country;
    self.droughts := l.droughts;
    self.earthquakes := l.earthquakes;
    self.epidemic := l.epidemic;
    self.flood := l.flood;
    self.landslide := r.severity_score;
END;

mytable103 := join(mytable102,position5,left.country = right.country,T103(left,right),left outer);

//mytable103;

//

myrec104 := RECORD
string country;
    unsigned droughts;
    unsigned earthquakes;
    unsigned epidemic;
    unsigned flood;
    unsigned landslide;
    unsigned volcano;
END;

myrec104 T104(mytable103 l , position6 r) := TRANSFORM
    SELF.country := l.country;
    self.droughts := l.droughts;
    self.earthquakes := l.earthquakes;
    self.epidemic := l.epidemic;
    self.flood := l.flood;
    self.landslide :=l.landslide;
    self.volcano := r.severity_score;
END;

mytable104 := join(mytable103,position6,left.country = right.country,T104(left,right),left outer);

//mytable104;

//

myrec105 := RECORD
string country;
    unsigned droughts;
    unsigned earthquakes;
    unsigned epidemic;
    unsigned flood;
    unsigned landslide;
    unsigned volcano;
    unsigned wildfire;
END;

myrec105 T105(mytable104 l , position7 r) := TRANSFORM
    SELF.country := l.country;
    self.droughts := l.droughts;
    self.earthquakes := l.earthquakes;
    self.epidemic := l.epidemic;
     self.flood := l.flood;
    self.landslide :=l.landslide;
    self.volcano := l.volcano;
    self.wildfire := r.severity_score;
END;

mytable105 := join(mytable104,position7,left.country = right.country,T105(left,right),left outer);

//mytable105;

//

myrec200 := RECORD
string country := mytable105.country;
     unsigned droughts := mytable105.droughts;
    unsigned earthquakes := mytable105.earthquakes;

    unsigned epidemic := mytable105.epidemic;
    unsigned flood := mytable105.flood;
    unsigned landslide := mytable105.landslide;
    unsigned volcano := mytable105.volcano;
    unsigned wildfire := mytable105.wildfire;
    unsigned finalScore;
END;

myrec200 T200(mytable105 l) := TRANSFORM
   self := l;
   self.finalscore := l.droughts + l.earthquakes + l.epidemic + l.flood + l.landslide + l.volcano + l.wildfire;
end;

mytable200 := Project(mytable105 , T200(left));
MYTABLE201 := SORT(mytable200 , finalscore);
output(mytable201, named('FinalSafetyScore'));

