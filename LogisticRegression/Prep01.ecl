IMPORT $;
EXPORT Prep01:=MODULE
 EXPORT rec90:=RECORD

    unsigned homeless;
unsigned injured;
unsigned affected;
unsigned damages;
unsigned totaldeath;
decimal5_3 cpi;
integer appeal;
END;


EXPORT File:= DATASET('pr::logregdata.csv',rec90,csv);
END;

