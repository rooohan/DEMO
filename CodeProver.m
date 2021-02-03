%------------------------------------------------------------------------------
%   Simulink script for code prover.
%   File Name    : CodeProver.m
%   MATLAB       : R2020a
%   Author       : Hannah
%   Time         : 2021/1/28
%  
% red: 代表每次执行都会发生的错误
% orange: 代表在某种特殊情况下才会出现的错误
% gray: 此段代码永远不会被执行
% green: 安全
%% ------------------------------------------------------------------------------
proj = polyspace.Project;
modelName = 'ControlVehicleVelocity';
folder = [modelName, '_ert_rtw'];
%% Specify sources and includes
sourceFile = {fullfile(pwd, folder, '*.cpp')};
includeFolder = {fullfile(pwd, folder, '*.h'); fullfile(matlabroot, 'simulink', 'include')};

%% Configure analysis
proj.Configuration.Sources = sourceFile;
proj.Configuration.EnvironmentSettings.IncludeFolders = includeFolder;
proj.Configuration.TargetCompiler.Compiler = 'generic';
proj.Configuration.ResultsDir = fullfile(pwd, 'results_CodeProver');

% proj.CodingRulesCodeMetrics.EnableMisraC3 = true;
% proj.CodingRulesCodeMetrics.MisraC3Subset = 'all';
proj.Configuration.MergedReporting.EnableReportGeneration = true;
proj.Configuration.MergedReporting.ReportOutputFormat = 'PDF';

%% code prover
proj.Configuration.CodeProverVerification.MainGenerator = true;

%% Run analysis
cpStatus = run(proj, 'codeProver');

% cpStatus = proj.run('codeProver');
% proj.Results.getResults('readable');

%% Read results
resObj = proj.Results;
cpSummary = getSummary(resObj, 'runtime');

% pslinkfun('openresults', '-resultsfolder', proj.Configuration.ResultsDir);
