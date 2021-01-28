%------------------------------------------------------------------------------
%   Simulink script for code prover.
%   File Name    : CodeProver.m
%   MATLAB       : R2020a
%   Author       : Hannah
%   Time         : 2021/1/28
%  
%------------------------------------------------------------------------------
proj = polyspace.Project;
modelName = 'ControlVehicleVelocity';
folder = [modelName, '_ert_rtw'];
% Specify sources and includes
sourceFile = fullfile(pwd, folder, '*.cpp');
includeFolder = fullfile(pwd, folder, '*.h');

% Configure analysis
proj.Configuration.Sources = {sourceFile};
proj.Configuration.TargetCompiler.Compiler = 'generic';
proj.Configuration.EnvironmentSettings.IncludeFolders = {includeFolder};
proj.Configuration.ResultsDir = fullfile(pwd, 'results');

% proj.CodingRulesCodeMetrics.EnableMisraC3 = true;
% proj.CodingRulesCodeMetrics.MisraC3Subset = 'all';
proj.MergedReporting.EnableReportGeneration = true;
proj.MergedReporting.ReportOutputFormat = 'PDF';

% code prover
proj.Configuration.CodeProverVerification.MainGenerator = true;

% Run analysis
cpStatus = run(proj, 'codeProver');

% cpStatus = proj.run('codeProver');
% proj.Results.getResults('readable');

% Read results
resObj = proj.Results;
cpSummary = getSummary(resObj, 'runtime');

pslinkfun('openresults', '-resultsfolder', proj.Configuration.ResultsDir);
