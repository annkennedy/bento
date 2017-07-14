function Manager_applyLabelChanges(source,~)
h = guidata(source);
gui = h.gui;

data    = gui.allData;
inds    = gui.allPopulated;

mpre=0; spre='';
for i = 1:size(inds,1)
    m       = inds(i,1);
    if(m~=mpre)
        disp(' ');
        disp(['Mouse ' num2str(m)]);
        mpre = m;
    end
    sess    = ['session' num2str(inds(i,2))];
    if(~strcmpi(sess,spre))
        disp(['session ' sess(end) '----------']);
        spre=sess;
    end
    trial   = inds(i,3);
    disp(['Trial ' num2str(trial)]);
    
    dat     = data(m).(sess)(trial);
    saveAnnotSheetTxt(gui,dat,m,sess,trial);
end
helpbox('Done!');