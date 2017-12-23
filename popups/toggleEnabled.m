function toggleEnabled(source,~)

gui = guidata(source);

h = dialog('Name','Toggle object visibility','KeyReleaseFcn',{@toggleKeyEval,[]});
p = h.Position;
    
count = 0;
for f = fieldnames(gui.enabled)'
    if(strcmpi(f{:},'ctrl')|strcmpi(f{:},'welcome'))
        continue;
    end
    if(gui.enabled.(f{:})(1))
        count = count+1;
        uicontrol(h,'Style','checkbox','KeyReleaseFcn',{@toggleKeyEval,h},...
                'Value',gui.enabled.(f{:})(2),...
                'String',['  ' f{:}],'fontsize',12,...
                'Position',[75 count*30+10 100 30],'callback',@toggleEnabledCallback);
    end
end

p(3) = 250;
p(2) = p(2) + (p(4) - 30*count+60)/2;
p(4) = 30*count+60;
h.Position = p;

guidata(h,gui.h0);
end

function toggleKeyEval(source,~,h)
if(isempty(h))
    close(source);
else
    close(h);
end
end