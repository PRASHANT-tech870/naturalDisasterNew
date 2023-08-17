#OPTION('obfuscateOutput', TRUE);

import LinearRegression AS LR;
import ML_Core;
import $;

XTrain := $.Convert02.myIndTrainDataNF;
YTrain := $.Convert02.myDepTrainDataNF;
XTest := $.Convert02.myIndTestDataNF;
YTest := $.Convert02.myDepTestDataNF;


myLearner := LR.OLS(XTrain,YTrain);
MyModel := myLearner.GetModel;
Betas := myLearner.Betas();
OUTPUT(Betas,Named('Betas'));


MyPredict := myLearner.Predict(XTest,MyModel);
OUTPUT(MyPredict,Named('PredictedValues'));


Rsq := myLearner.RSquared;
OUTPUT(Rsq,Named('RSq'));
ARsq := myLearner.AdjRSquared;
OUTPUT(ARsq , Named('AdjRSq'));


pvalue := myLearner.pval;
pvalue;