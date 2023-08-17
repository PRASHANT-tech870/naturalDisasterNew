// #OPTION('obfuscateOutput', TRUE);
import $;
import ML_Core;

myTrainData := $.Prep01.myTrainData;
myTestData := $.Prep01.myTestData;

ML_Core.AppendSeqId(myTrainData ,id,myTrainIDData);
ML_Core.AppendSeqId(myTestData,id,myTestIDData);



ML_Core.ToField(myTrainIDData,myTrainDataNF); 
ML_Core.ToField(myTestIDData,myTestDataNF);
// output(myTrainDataNF);
// output(myTestDataNF);
EXPORT Convert02 := MODULE 


EXPORT myIndTrainDataNF := myTrainDataNF(number <6);
EXPORT myDepTrainDataNF := PROJECT(myTrainDataNF(number = 6),
                                    TRANSFORM(RECORDOF(LEFT),
                                                SELF.number := 1,
                                                SELF := LEFT));

EXPORT myIndTestDataNF := myTestDataNF(number <6);
EXPORT myDepTestDataNF := PROJECT(myTestDataNF(number = 6),
                                    TRANSFORM(RECORDOF(LEFT),
                                                SELF.number := 1,
                                                SELF := LEFT));
END;