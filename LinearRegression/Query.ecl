IMPORT ML_Core;
IMPORT ML_Core.Types as Types;
import LinearRegression AS LR;
IMPORT $; 
test03:= $.File_Dis2.File;
ML_prop := $.File_Dis2.MLProp4;
EXPORT Query() := FUNCTION

unsigned totaldeath:= 0 : STORED('TOTAL_DEATHS');

    decimal5_3 cpi:= 0: STORED('COMUNITY_PREPARDENESS_INDEX');
    unsigned affected:= 0 : STORED('NO_OF_AFFECTED');
    unsigned injured:=0 : STORED('NO_OF_INJURED');
     
     unsigned damages:=0 : STORED('DAMAGES_IN_USD');
    //  unsigned homeless:=0 : STORED('NO_OF_HOMELESS');


 blockdimensions_max_partition_size := 0 : STORED('NULL');
 blockdimensions_single_partition_size := 0 : STORED('NULL');
 blockdimensions_nodes := 0 : STORED('NULL');

 Rec := RECORD
UNSIGNED totaldeath;
UNSIGNED cpi;
UNSIGNED affected;
unsigned injured;
UNSIGNED damages;



END;


XTrain := $.Convert02.myIndTrainDataNF;
YTrain := $.Convert02.myDepTrainDataNF;
// XTest := $.Convert02.myIndTestDataNF;
// YTest := $.Convert02.myDepTestDataNF;


myLearner := LR.OLS(XTrain,YTrain);
MyModel := myLearner.GetModel;
// Betas := myLearner.Betas();
// OUTPUT(Betas,Named('Betas'));

InDSA := DATASET([{totaldeath, cpi,affected,injured,damages}], REC);

ML_Core.AppendSeqId(InDsa,id,myTestIDData);
ML_Core.ToField(myTestIDData,test); 

MyPredict := myLearner.Predict(test,MyModel);
// OUTPUT(MyPredict,Named('PredictedValues'));


Rsq := myLearner.RSquared;
// OUTPUT(Rsq,Named('RSq'));
ARsq := myLearner.AdjRSquared;
// OUTPUT(ARsq , Named('AdjRSq'));

RETURN OUTPUT(mypredict,{Homeless:=value});

end;