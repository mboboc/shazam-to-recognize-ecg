
function id = ecg_function(input_signal, israw)
    id = 0;

    Fs = 500;           %Sampling frequency
    T = 1/Fs;           %Sampling period
    L = 5000;           %Length of signal
    t = (0:L-1)*T;      %Time vector
    f = Fs*(0:(L/2))/L;
    if(israw == 1)
 %      fc = 40;
 %      Wn = (2/Fs)*fc;
 %      b = fir1(20,Wn,'low',kaiser(21,140));
%         windowSize = 5; 
%         b = (1/windowSize)*ones(1,windowSize);
%         a = 1;
%         input_singal = filter(b,a,input_signal);
%         w = fir1(34,0.48,'high',chebwin(35,30));
%         input_signal = conv(input_signal, w);
    end
    Y = fft(input_signal);

    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    pks_sample = maxk(P1, 20);
    %norm_sample = norm(pks_sample)
    
    for i = 1:90
       c =int2str(i);
       if i < 10
            str = strcat('ECG-DB\ECG-DB\Person_0', c, '\', 'rec_1m.mat');
       else
            str = strcat('ECG-DB\ECG-DB\Person_', c, '\', 'rec_1m.mat');
       end
       fid = fopen(str);
       data_database = importdata(str);
       database_signal = data_database(2, :);
       
       Y_database = fft(database_signal);

        P2_database = abs(Y_database/L);
        P1_database = P2_database(1:L/2+1);
        P1_database(2:end-1) = 2*P1_database(2:end-1);
       
       pks_database = maxk(P1_database, 20); 
       for j = 1 : 6
        dif(j) = pks_database(j) - pks_sample(j);
       end
       values(1,i) = norm(dif);
       fclose(fid);
    end
    index = 1:90;
    matrix = [values(:), index(:)];
    matrix = sortrows(matrix);
    id = matrix(1,2);
    %disp(matrix(1,2));
end