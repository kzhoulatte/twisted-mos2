% This function can be used to get the Nth line 
function Mydataread(filein,fileout,line)
    fidin=fopen(filein,'r');
    fidout=fopen(fileout,'a');
    nline=0;
while ~feof(fidin) 
    tline=fgetl(fidin); 
    nline=nline+1; 
if nline==line
    fprintf(fidout,'%s\n',tline);
    dataout=tline;
end
end
    fclose(fidin);
    fclose(fidout);