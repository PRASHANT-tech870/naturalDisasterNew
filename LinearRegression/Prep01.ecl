import $;
test03:= $.File_Dis2.File;

ML_Prop := $.File_Dis2.MLProp4;


export prep01 := MODULE
MLPropExt := RECORD(ML_Prop)
unsigned rnd;
end;

CleanFilter :=  test03.totaldeath <> 0 AND test03.cpi <>0 AND test03.affected <>0 AND  test03.homeless<>0 AND test03.injured<>0 AND test03.damages<>0;

Export myDataE := PROJECT(test03(CleanFilter), TRANSFORM(MLPropExt,
                                                            SELF.rnd := RANDOM(),
                                                            SELF := LEFT));
                                                            // :PERSIST('~poster::LinearRegression::PPR::PrepProp');




SHARED myDataES := SORT(myDataE,rnd);

EXPORT myTrainData := PROJECT(myDataES[1..250] , ML_Prop);
                                // :PERSIST('~poster::LinearRegression::PPR::Train');  

EXPORT myTestData := PROJECT(myDataES[251..315] , ML_Prop);
                                // :PERSIST('~poster::LinearRegression::PPR::Test');        

end;
