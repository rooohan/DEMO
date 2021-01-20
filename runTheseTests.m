function runTheseTests()
    %RUNTESTS 

    %   Copyright 2018 MathWorks, Inc.

    project = matlab.project.currentProject;
    % The runtests function provides a simple way to run a collection of
    % tests
%     disp(project.RootFolder);
    result = runtests(project.RootFolder);
    disp(result);
end

