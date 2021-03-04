% ------------------------------------------
% 代码SIL测试
% Matlab: R2020a
% Time: 2021.3.2
% Author: Hannah
% ------------------------------------------
model_name = 'ControlVehicleVelocity';   %gcs
load_system(model_name);

set_param(model_name,'StopTime','10.0');
set_param(model_name,'SolverType','Fixed-step');
set_param(model_name,'Solver','FixedStepDiscrete'); %Auto
set_param(model_name,'FixedStep','0.1');

set_param(model_name,'SystemTargetFile','ert.tlc');
set_param(model_name,'PortableWordSizes','off');
set_param(model_name,'TargetHWDeviceType','Custom Processor->MATLAB Host Processor');
set_param(model_name,'ProdEqTarget','off');

set_param(model_name,'GenerateReport','on');
set_param(model_name,'LaunchReport','off');
set_param(model_name,'CodeExecutionProfiling','off');

set_param(model_name,'LoadExternalInput','on');
set_param(model_name,'ExternalInput','[0, input]');
set_param(model_name,'OutputSaveName', 'SIL_out');

% MIL Simulation set
% set_param(model_name,'SimulationMode','Normal');
% [~,~,MIL_Out] = sim(model_name);

% SIL Simulation set
set_param(model_name,'SimulationMode','Software-in-the-Loop (SIL)');

%% read excel data
[num, txt] = xlsread('./test_case2.xlsx');
TestNum = length(num(1:end, 1));
TestCondition = txt(2:2, 2);
ExpectedResult = txt(2:end, 3);

%% test data
TestResult = false(1,length(ExpectedResult));

for i = 1:TestNum
    eval([TestCondition{i}]);
    sim('./ControlVehicleVelocity.slx');
    for j = 1:length(ExpectedResult)
        eval([ExpectedResult{j}]);
        TestResult(j) = (SIL_out{1}.Values.Data(j) - Out) < 0.1;
    end
end

%% write the result to excel
xlswrite('./test_case2.xlsx', TestResult', 'Sheet1', 'D2');

% [~,~,SIL_Out] = sim(model_name);
%% plot the result
% fig1 = figure;
% subplot(3,1,1), plot(MIL_Out), title('Output for Normal Simulation')
% subplot(3,1,2), plot(SIL_Out), title('Output for SIL Simulation')
% subplot(3,1,3), plot(MIL_Out-SIL_Out), ...
%     title('Difference Between Normal and SIL');
