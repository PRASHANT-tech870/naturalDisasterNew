#OPTION('obfuscateOutput', TRUE);
import $;
Disasters := $.File_Disasters.File;
mytable2:= $.Equake_Country.mytable2;
x:=disasters(distype='Earthquake');
x;
mytable3 := mytable2(distype='Earthquake');
mytable3;


myrec8:=RECORD
    string country:=x.country;
    string distype:=x.distype;
    unsigned y:=count(Group);

END;

z:= table(x,myrec8,country);

z;

myrec9:=RECORD
string country;
    decimal3_2 avr_mag;
    unsigned total_equake;
END;
 
myrec9 T2(z l, mytable3 r) := TRANSFORM
self.country := l.country;
 self.avr_mag:= r.avr_mag;
    SELF.total_equake := l.y;
    
   

END;

mytable8 := join(z,mytable3,left.country =right.country,T2(left,right));
mytable8;


myrec10 := RECORD
    string country:= mytable8.country;
    decimal3_2 avr_mag := mytable8.avr_mag;
    unsigned total_equake := mytable8.total_equake;
    decimal def_ratio;


END;

myrec10 T3(mytable8 l):= TRANSFORM
    SELF := l;
    self.def_ratio:= (l.total_equake/ l.avr_mag)*100;


END;
mytable10 := PROJECT(mytable8,T3(left));
OUTPUT(mytable10,named('SeismicEfficiencyIndex'))