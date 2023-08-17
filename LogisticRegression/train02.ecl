#OPTION('obfuscateOutput', TRUE);
IMPORT $, LogisticRegression,ML_Core;
logdata := $.Prep01.File;//dataset
OUTPUT(logdata,NAMED('DATASET'));

recd:=$.Prep01.rec90;//record

recn:=RECORD(recd)
UNSIGNED rnd;
END;

tab987:=PROJECT(logdata,TRANSFORM(recn,SELF.rnd:=RANDOM(),SELF:=LEFT));
tab987s:=SORT(tab987,rnd);
OUTPUT(tab987s,NAMED('SORT'));


train:= PROJECT(tab987s[1..559],recd);
test:=PROJECT(tab987s[560..702],recd);
OUTPUT(train,NAMED('train'));
OUTPUT(test,NAMED('test'));
//numeric field matrix conversion

ML_Core.AppendSeqID(train, id, trainid);
ML_Core.AppendSeqID(test, id, testid);


ML_Core.ToField(trainid,trainNF);
ML_Core.ToField(testid,testNF);


indtrainNF:= trainNF(number<7);
deptrainNF:=PROJECT(trainNF(number=7),
                    TRANSFORM(ML_Core.Types.DiscreteField,
                              SELF.number:= 1,
                              SELF:=LEFT));
indtestNF:=testNF(number<7);
deptestNF:=PROJECT(testNF(number=7),
                    TRANSFORM(ML_Core.Types.DiscreteField,
                              SELF.number:=1,
                              SELF:=LEFT));

indtrainNF;
deptrainNF;
indtestNF;
deptestNF;

mylearner:= LogisticRegression.BinomialLogisticRegression();
mymodel:=mylearner.getModel(indtrainNF,deptrainNF);
mypredict:=mylearner.Classify(mymodel,indtestNF);
OUTPUT(mypredict,NAMED('PREDICT'));


myconfmatrix:=LogisticRegression.Confusion(deptestNF,mypredict);
OUTPUT(myconfmatrix,NAMED('CONFUSION'));

myconfacc:=LogisticRegression.BinomialConfusion(myconfmatrix);
OUTPUT(myconfacc,NAMED('ACCURACY'));


mybeta:=LogisticRegression.ExtractBeta(mymodel);
OUTPUT(mybeta,NAMED('BETAS'));


myscores:=LogisticRegression.LogitScore(mybeta,indtestNF);

OUTPUT(myscores,NAMED('SCORES'));

mydeviance:=LogisticRegression.Deviance_Detail(deptestNF,myscores);
OUTPUT(mydeviance,NAMED('DEVIANCEvalues'));

myaic:=LogisticRegression.Model_Deviance(mydeviance,mybeta);
OUTPUT(myaic,NAMED('DEVIATION'));