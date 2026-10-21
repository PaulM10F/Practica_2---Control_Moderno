% PASO 3 
% Reto - Señal propia
t5 = 0:0.01:50;                     
u5 = zeros(size(t5));               

% Rampa ascendente: Sube de 0 a 10 (t=5 a t=15)
idx_up = (t5 >= 5 & t5 < 15);
u5(idx_up) = t5(idx_up) - 5;   

% Escalón de subida: Salta a 20 (t=15 a t=25)
u5(t5 >= 15 & t5 < 25) = 20;

% Escalón de bajada: Cae a 10 (t=25 a t=35)
u5(t5 >= 25 & t5 < 35) = 10;

% Rampa descendente: Baja de 10 a 0 (t=35 a t=50)
idx_down = (t5 >= 35 & t5 <= 50);
u5(idx_down) = 10 - (10/15) * (t5(idx_down) - 35); 

% Simulación de la respuesta
[y5, ~] = lsim(Gd, u5, t5);

% Valor maximo e inicio
[ymax5, kmax5] = max(y5);
k_ini5 = find(y5 > 1e-3, 1);
fprintf('Señal Reto -> Max: %.2f en t=%.2fs | Inicio: %.2fs\n', ymax5, t5(kmax5), t5(k_ini5));

% Gráfica
figure('Name', 'Paso 3 - Reto'); 
plot(t5, u5, 'Color', [.8 .8 .8], 'LineWidth', 1.5); hold on;
plot(t5, y5, 'Color', '#77AC30', 'LineWidth', 1.5); grid on;
plot(t5(kmax5), ymax5, 'rx', 'MarkerSize', 10, 'LineWidth', 2); % Marca el máximo
xline(t5(k_ini5), ':r', 'LineWidth', 1.5);                      % Marca el inicio
xlabel('Tiempo [s]'); ylabel('Amplitud'); 
legend('u(t) (Entrada)', 'y(t) (Salida)', 'Location', 'best');
title('Reto: Respuesta a señal arbitraria propia');