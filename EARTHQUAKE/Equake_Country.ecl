// #OPTION('obfuscateOutput', TRUE);
import $;
Disasters := $.File_Disasters.File;
EXPORT Equake_country := MODULE


EXPORT myrec2 := RECORD
    // decimal dismag:= disasters.dismag;
    string country:= disasters.country;
    string distype:=disasters.distype;
    decimal3_2 avr_mag:= ave(group,disasters.dismag);
END;

EXPORT mytable2 := table(disasters,myrec2,country,distype);

// mytable2;
// mytable2(distype='Earthquake');


END;