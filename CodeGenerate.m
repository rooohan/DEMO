%------------------------------------------------------------------------------
%   Simulink scrip for devops code generated.
%   File Name    : SlkCodeGen.m
%   MATLAB       : R2017b
%   Author       : Tomato
%   Time         : 2020/1/21
%   Instructions : Creat initial version           2020/1/21           V0.1
%  
%------------------------------------------------------------------------------
function CodeGenerate()
    % Open project
    proj_name = './Subtract_main.prj';
    open(proj_name);
%     proj = simulinkproject;
    % Open the model
    target_mdl = 'subtract';
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
%-----End of Function----------------------------------------------------------
