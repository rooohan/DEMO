%------------------------------------------------------------------------------
%   Simulink script for bug finder.
%   File Name    : BugFinder.m
%   MATLAB       : R2020a
%   Author       : Hannah
%   Time         : 2021/1/28
%  
%------------------------------------------------------------------------------
proj = polyspace.Project;
modelName = 'ControlVehicleVelocity';
folder = [modelName, '_ert_rtw'];
% Specify sources and includes
sourceFile = {fullfile(pwd, folder, '*.cpp')};
includeFolder = {fullfile(pwd, folder, '*.h'); fullfile(matlabroot, 'simulink', 'include')};

% Configure analysis
proj.Configuration.Sources = sourceFile;
proj.Configuration.EnvironmentSettings.IncludeFolders = includeFolder;
proj.Configuration.TargetCompiler.Compiler = 'generic';
proj.Configuration.ResultsDir = fullfile(pwd, 'results_BugFinder');

proj.Configuration.MergedReporting.EnableReportGeneration = true;
proj.Configuration.MergedReporting.ReportOutputFormat = 'PDF';

% Run analysis
bfStatus = run(proj, 'bugFinder');

% Read results
resObj = proj.Results;
bfSummary = getSummary(resObj, 'defects');

% pslinkfun('openresults', '-resultsfolder', proj.Configuration.ResultsDir);
