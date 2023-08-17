EXPORT File_Data := MODULE
EXPORT Layout := RECORD


unsigned homeless;
unsigned injured;
unsigned affected;
unsigned damages;
unsigned totaldeath;
decimal5_3 cpi;
integer appeal;


    
END;

EXPORT MLBank := RECORD
    unsigned homeless;
unsigned injured;
unsigned affected;
unsigned damages;
unsigned totaldeath;
decimal5_3 cpi;
integer appeal;    //Appeal in relation to natural disasters refers to requests made by affected countries and communities for international humanitarian aid and assistance after a major disaster event.
END;




EXPORT File := DATASET('hthor::pr::logregdata.csv',Layout,csv);
END;
