% 2018-10-03 creating a figure to demonstrate the impact of power
% and pre-study odds on positive predictive value

% there's probably a more efficient way to do this using matrices
% instead of loops... I was just being lazy

clc;clear;close all

powers = 0:.01:1;
Rs = 0:.01:1; % odds ratios
alpha = .05;

for npower = 1:length(powers)
    power = powers(npower);
    for nR = 1:length(Rs)
        R = Rs(nR);
        PPV(nR,npower) = (power * R) / (power * R + alpha);
    end
end

imagesc((PPV))
set(gca(),'Ydir','normal')

title('Effect of power and odds ratio on positive predictive value')

xlabel('Pre-study odds R')
set(gca,'XTickLabel',.1:.1:1)

ylabel('Power (%)')

h = colorbar;
ylabel(h,'Positive Predictive Value (%)')
set(h,'YTickLabel',0:10:100)
