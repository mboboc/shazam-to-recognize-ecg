
fclose all
clear all
close all
clc

fileID = fopen("ECG-DB\ECG-DB\Person_03\rec_1m.mat");
var1 = importdata("ECG-DB\ECG-DB\Person_03\rec_1m.mat");
var = var1(2,:);
fclose(fileID);
ecg_function(var);