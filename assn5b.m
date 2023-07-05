x = linspace(0, 1, 100);
a = 0.5;
b = 0.2;
c = 0.4;
f = @(x) a * sin(2*pi*x) + b * exp(-c*x);

del = 0.02;
y = f(x) + del * randn(size(x));

degree = 3;  
coeffs = polyfit(x, y, degree); 
fprintf('Original function constants: a=%.2f, b=%.2f, c=%.2f\n', a, b, c);
fprintf('Fitted function constants: a=%.2f, b=%.2f, c=%.2f\n', coeffs(4), coeffs(3), coeffs(2));
y_fit = polyval(coeffs, x);

figure;
subplot(1, 2, 1);
plot(x, f(x), 'r', 'LineWidth', 2);
hold on;
plot(x, y, 'bo');
plot(x, y_fit, 'g--', 'LineWidth', 2);
title('Original Function, Noisy Data, and Fitted Function');
legend('Original Function', 'Noisy Data', 'Fitted Function');
xlabel('x');
ylabel('y');
pause;