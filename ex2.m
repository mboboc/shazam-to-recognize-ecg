%%%%%%%%%%              checker                 %%%%%%%%%%%
israw = 1;
count = 0;
for i = 1:90
   c =int2str(i);
   if i < 10
        str = strcat('ECG-DB\ECG-DB\Person_0', c, '\', 'rec_1m.mat');
   else
        str = strcat('ECG-DB\ECG-DB\Person_', c, '\', 'rec_1m.mat');
   end
   fid = fopen(str);
   data_sample = importdata(str);
   fclose(fid);
   if(israw == 0)
       sample_signal = data_sample(2, :);
   else
       sample_signal = data_sample(1, :);
   end
   if(ecg_function(sample_signal, israw) == i)
       count = count + 1
   end
end
disp(count);