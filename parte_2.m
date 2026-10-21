% DEFINICIÓN DEL SISTEMA
Gd = tf(3, [1 2 3], 'InputDelay', 2);

% PARTE 2 
% Señal Arbitraria 1
t3 = 0:0.01:30;
u3 = 5*(t3 >= 10) + 5*(t3 >= 20);

% Simulación de la respuesta
[y3, ~] = lsim(Gd, u3, t3);

% Valor máximo e inicio
[ymax3, kmax3] = max(y3);
k_ini3 = find(y3 > 1e-3, 1);
fprintf('Señal Arbitraria 1 -> Max: %.2f en t=%.2fs | Inicio: %.2fs\n', ymax3, t3(kmax3), t3(k_ini3));

% Gráficas
figure('Name', 'Paso 2 - Señal Arbitraria 1'); 
plot(t3, u3, 'Color', [.6 .6 .6], 'LineWidth', 1.5); hold on;
plot(t3, y3, 'LineWidth', 1.5); grid on;
plot(t3(kmax3), ymax3, 'rx', 'MarkerSize', 10, 'LineWidth', 2); % Marca el máximo
xline(t3(k_ini3), ':r', 'LineWidth', 1.5);                      % Marca el inicio
xlabel('Tiempo [s]'); ylabel('Amplitud'); legend('u(t)', 'y(t)');
title('Respuesta a Señal Arbitraria 1');

% Señal Arbitraria 2
t4 = 0:0.01:40;                     
u4 = zeros(size(t4));           

u4(t4 >= 10 & t4 < 20) = 5;
idx = (t4 >= 20 & t4 < 30);
u4(idx) = 15 + (t4(idx) - 20);
u4(t4 >= 30) = 25;

% Simulación de la respuesta
[y4, ~] = lsim(Gd, u4, t4);

% Valor máximo e inicio
[ymax4, kmax4] = max(y4);
k_ini4 = find(y4 > 1e-3, 1);
fprintf('Señal Arbitraria 2 -> Max: %.2f en t=%.2fs | Inicio: %.2fs\n', ymax4, t4(kmax4), t4(k_ini4));

% Gráfica
figure('Name', 'Paso 2 - Señal Arbitraria 2'); 
plot(t4, u4, 'Color', [.8 .8 .8], 'LineWidth', 1.5); hold on;
plot(t4, y4, 'Color', '#D95319', 'LineWidth', 1.5); grid on;
plot(t4(kmax4), ymax4, 'rx', 'MarkerSize', 10, 'LineWidth', 2);
xline(t4(k_ini4), ':r', 'LineWidth', 1.5);
xlabel('Tiempo [s]'); ylabel('Amplitud'); 
legend('u(t)', 'y(t)', 'Location', 'best');
title('Respuesta a Señal Arbitraria 2');