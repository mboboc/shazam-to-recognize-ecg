
function id = ecg_function(input_signal, israw)
    id = 0;

    Fs = 500;           %Sampling frequency
    T = 1/Fs;           %Sampling period
    L = 5000;           %Length of signal
    t = (0:L-1)*T;      %Time vector
    f = Fs*(0:(L/2))/L;
    
    %daca semnalul este filtrat
    if (israw == 0)
        Y = fft(input_signal);
        P2 = abs(Y/L);
        P1 = P2(1:L/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        pks_sample = maxk(P1, 20);
       
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
           for j = 1 : 20
                dif(j) = pks_database(j) - pks_sample(j);
           end
           values(1,i) = norm(dif);
           fclose(fid);
        end
        index = 1:90;
        matrix = [values(:), index(:)];
        matrix = sortrows(matrix);
        id = matrix(1,2);
    else
    %daca semnalul nu este filtrat
    s1 = spectrogram(input_signal,kaiser(1000));
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
       s2 = spectrogram(database_signal,kaiser(1000));
       
       %distanta euclidiana
       for j = 1 : size(s1)
            dif(j) = s2(j) - s1(j);
       end
       values(1,i) = norm(dif);
       fclose(fid);
    end
    %in prima coloana din matrice sunt valorile vectorului caracteristic
    %pe a doua coloana sunt indecsii(ca sa pot sorta cu sortrows)
    index = 1:90;
    matrix = [values(:), index(:)];
    matrix = sortrows(matrix);
    id = matrix(1,2);
    end
end