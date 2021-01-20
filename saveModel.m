function saveModel()
    model_name = "subtract";    
%     open_system(model_name);
    load_system(model_name);
    save_system(model_name);
    close_system(model_name);
end