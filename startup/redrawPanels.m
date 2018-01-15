function gui = redrawPanels(gui)
% this gets called when the user makes a change to the data being viewed-
% eg, opens a movie, adds tracking data, etc. In the future, there will
% also be a menu option that will let you toggle ui elements on/off.
enabled     = fieldnames(gui.enabled);
config      = gui.config;

ctrlSize = ones(size(gui.config.ctrl));
for i = 1:length(gui.config.ctrl)
    if(isfield(gui.config.ctrlSc,gui.config.ctrl{i}))
        ctrlSize(i) = gui.config.ctrlSc.(gui.config.ctrl{i});
    end
end
ctrlSize = sum(ctrlSize)*gui.config.rowscale;


for i = 1:length(enabled)
    if(gui.enabled.(enabled{i})(2))
        gui.(enabled{i}).panel.Visible = 'on';
    else
        gui.(enabled{i}).panel.Visible = 'off';
    end
end

if(gui.enabled.movie(2) && gui.enabled.traces(2))
    gui.movie.panel.Position  = [0 ctrlSize config.midline 1-ctrlSize];
    gui.ctrl.panel.Position   = [0 0 config.midline ctrlSize];
    
    if(gui.enabled.traces(2) && gui.enabled.features(2) && gui.enabled.audio(2))
        gui.traces.panel.Position   = [config.midline 0    1-config.midline 0.5];
        gui.features.panel.Position = [config.midline 0.5  1-config.midline 0.25];
        gui.audio.panel.Position    = [config.midline 0.75 1-config.midline 0.25];
        
    elseif(gui.enabled.traces(2) && gui.enabled.features(2))
        gui.traces.panel.Position   = [config.midline 0 1-config.midline 0.5];
        gui.features.panel.Position = [config.midline 0.5 1-config.midline 0.5];
        
    elseif(gui.enabled.traces(2) && gui.enabled.audio(2))
        gui.traces.panel.Position   = [config.midline 0 1-config.midline 0.7];
        gui.audio.panel.Position    = [config.midline 0.7 1-config.midline 0.3];
        
    else
        gui.traces.panel.Position   = [config.midline 0 1-config.midline 1];
    end
    
elseif(gui.enabled.movie(2) && gui.enabled.audio(2))
    gui.movie.panel.Position  = [0 ctrlSize+.25 1 1-.25-ctrlSize];
    gui.audio.panel.Position  = [0 ctrlSize 1 .25];
    gui.ctrl.panel.Position   = [0 0 1 ctrlSize];
    if(gui.enabled.fineAnnot(2))
        gui.fineAnnot.panel.Visible='off';
    end
    
elseif(gui.enabled.movie(2) && gui.enabled.fineAnnot(2) && ~gui.enabled.audio(2))
    gui.movie.panel.Position     = [0 ctrlSize*.75+.15 1 1-.15-ctrlSize*.75];
    gui.fineAnnot.panel.Position = [0 ctrlSize*.75 1 .15];
    gui.ctrl.panel.Position      = [0 0 1 ctrlSize*.75];
    
elseif(gui.enabled.movie(2) && gui.enabled.features(2))
    gui.movie.panel.Position    = [0 ctrlSize config.midline 1-ctrlSize];
    gui.ctrl.panel.Position     = [0 0 config.midline ctrlSize];
    gui.features.panel.Position = [config.midline 0 1-config.midline 1];
    
elseif(gui.enabled.movie(2))
    gui.movie.panel.Position  = [0 ctrlSize 1 1-ctrlSize];
    gui.ctrl.panel.Position   = [0 0 1 ctrlSize];
    
elseif(gui.enabled.traces(2) && gui.enabled.features(2))
    gui.traces.panel.Position    = [0 ctrlSize 0.5 1-ctrlSize];
    gui.features.panel.Position  = [0.5 ctrlSize 1 1-ctrlSize];
    gui.ctrl.panel.Position      = [0 0 1 ctrlSize];
    
elseif(gui.enabled.traces(2) && gui.enabled.audio(2))
    gui.traces.panel.Position   = [0 ctrlSize       1 1-.3-ctrlSize];
    gui.audio.panel.Position    = [0 0.3+ctrlSize   1 0.3];
    gui.ctrl.panel.Position      = [0 0 1 ctrlSize];
    
elseif(gui.enabled.traces(2))
    gui.traces.panel.Position = [0 ctrlSize 1 1-ctrlSize];
    gui.ctrl.panel.Position   = [0 0 1 ctrlSize];
    
elseif(gui.enabled.features(2))
    gui.features.panel.Position = [0 ctrlSize 1 1-ctrlSize];
    gui.ctrl.panel.Position   = [0 0 1 ctrlSize];
    
elseif(gui.enabled.audio(2))
    gui.audio.panel.Position    = [0 ctrlSize 1 1-ctrlSize];
    gui.ctrl.panel.Position      = [0 0 1 ctrlSize];
else
    gui.welcome.panel.Position = [0 0 1 1];
end