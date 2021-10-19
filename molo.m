clear all, close all, clc
nu=0.001; % Diffusion constant
% Define spatial domain
L = 20; % Length of domain
N = 1000; % Number of discretization points
dx = L/N;
x = -L/2:dx:L/2-dx; % Define x domain
% Define discrete wavenumbers
kappa = (2*pi/L)*[-N/2:N/2-1];
kappa = fftshift(kappa’); % Re-order fft wavenumbers
% Initial condition
u0 = sech(x);
% Simulate PDE in spatial domain
dt = 0.025;
t = 0:dt:100*dt;
[t,u] = ode45(@(t,u)rhsBurgers(t,u,kappa,nu),t,u0);