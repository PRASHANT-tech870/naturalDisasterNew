// #OPTION('obfuscateOutput', TRUE);
export epidemic_prop := MODULE
import $;
epidemics := $.BWRepidemic.epidemics;

maxhomeless := max(epidemics, homeless);
maxinjured := max(epidemics,injured);
maxaffected := max(epidemics,affected);
maxdamages := max(epidemics,damages);
maxtotaldeath := max(epidemics,totaldeath);

myrec16 := RECORD
    recordof(epidemics);
    decimal RelHomeless;
    decimal RelInjured;
    decimal RelAffected;
    decimal RelDamages;
    decimal RelTotalDeath;





END;

weighttotaldeaths := 0.3;
weightdamages := 0.00;
weightaffected := 0.45;
weightinjured := 0.07;
weighthomeless := 0.13;

myrec16 T6(epidemics l) := TRANSFORM
    SELF := l;
    self.RelHomeless := (l.homeless/maxhomeless) * weighthomeless;
    self.RelInjured:= (l.injured/maxinjured) * weightinjured;
    self.RelAffected:= (l.affected/maxaffected)*weightaffected;
    self.RelDamages:= (l.damages/maxdamages)*weightdamages;
    self.RelTotalDeath:= (l.totaldeath/maxtotaldeath)*weighttotaldeaths;

END;


export mytable16 := PROJECT(epidemics,T6(left) );
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


//  AddSeverity_Score;
end;