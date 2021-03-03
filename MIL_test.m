% ------------------------------------------
% MIL自动化测试
% Matlab: R2020a
% Time: 2021.2.26
% Author: Hannah
% ------------------------------------------

%% load model
model_name = 'ControlVehicleVelocity'; %gcs
load_system(model_name);
%% set parameters
set_param(model_name,'StopTime','10.0 ');
set_param(model_name,'SolverType','Fixed-step');
set_param(model_name,'Solver','FixedStepDiscrete');
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

% MIL Simulation set
set_param(model_name,'SimulationMode','Normal');

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
        TestResult(j) = (yout{1}.Values.Data(j) - Out) < 0.1;
    end
end

%% write the result to excel
xlswrite('./test_case2.xlsx', TestResult', 'Sheet1', 'D2');
