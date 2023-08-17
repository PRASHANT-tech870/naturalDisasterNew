export wildfire_prop := MODULE
import $;
wildfires := $.BWRwildfire.wildfires;

maxhomeless := max(wildfires, homeless);
maxinjured := max(wildfires,injured);
maxaffected := max(wildfires,affected);
maxdamages := max(wildfires,damages);
maxtotaldeath := max(wildfires,totaldeath);

myrec16 := RECORD
    recordof(wildfires);
    decimal RelHomeless;
    decimal RelInjured;
    decimal RelAffected;
    decimal RelDamages;
    decimal RelTotalDeath;





END;

weighttotaldeaths := 0.35;
weightdamages := 0.30;
weightaffected := 0.15;
weightinjured := 0.07;
weighthomeless := 0.13;

myrec16 T6(wildfires l) := TRANSFORM
    SELF := l;
    self.RelHomeless := (l.homeless/maxhomeless) * weighthomeless;
    self.RelInjured:= (l.injured/maxinjured) * weightinjured;
    self.RelAffected:= (l.affected/maxaffected)*weightaffected;
    self.RelDamages:= (l.damages/maxdamages)*weightdamages;
    self.RelTotalDeath:= (l.totaldeath/maxtotaldeath)*weighttotaldeaths;

END;


export mytable16 := PROJECT(wildfires,T6(left) );
// mytable16;


myrec17 := RECORD
   recordof(mytable16);
   decimal SeverityIndex;

END;

myrec17 T7(mytable16 l) := TRANSFORM
    SELF := l;
    self.SeverityIndex := (l.RelAffected + l.RelHomeless + l.RelDamages + l.RelInjured + l.RelTotalDeath) * 1000;
END;

export mytable17 := PROJECT(mytable16, T7(left));
//mytable17;

myrec51 := RECORD
    string country := mytable17.country;
    decimal SI := sum(group , mytable17.SeverityIndex);


END;

export mytable51 := table(mytable17, myrec51, country);
//mytable51;


myrec52 := RECORD
    string country := mytable51.country;
    decimal Severity := mytable51.SI;
    unsigned Severity_Score := 0;

END;

mytable52 := TABLE(mytable51 , myrec52);

export AddSeverity_Score := ITERATE(SORT(mytable52,Severity),TRANSFORM(MyRec52, SELF.Severity_Score := IF(LEFT.Severity=RIGHT.Severity,LEFT.Severity_SCORE,LEFT.Severity_SCORE+1),
                         SELF := RIGHT)); 


//AddSeverity_Score;
END;