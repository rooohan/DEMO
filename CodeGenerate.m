%------------------------------------------------------------------------------
%   Simulink scrip for devops code generated.
%   File Name    : CodeGenerate.m
%   MATLAB       : R2020a
%   Author       : Hannah
%   Time         : 2021/1/20
%   Instructions : Creat initial version           2021/1/20           V0.1
%  
%------------------------------------------------------------------------------
function CodeGenerate()
    % Open project
%     proj_name = './Control_Vehicle_velocity.prj';
%     open(proj_name);
%     proj = simulinkproject;
    % Open the model
    target_mdl = 'ControlVehicleVelocity';
%     open_system(target_mdl);
    load_system(target_mdl);
    % Set model parameters
    set_param(target_mdl,'LaunchReport','off');
    try
        rtwbuild(target_mdl);
    catch
        warning(['Error while building model - ',target_mdl]);
%         exit(1);
    end
    % Restore model parameters
    set_param(target_mdl,'LaunchReport','on');
    % Close all simulink model without save
    bdclose;
%     exit(0);
end
