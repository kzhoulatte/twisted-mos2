% Used to get Nth line with no \n 

function Mydataread_No_N(filein,fileout,line)
    fidin=fopen(filein,'r');
    fidout=fopen(fileout,'a');
    nline=0;
while ~feof(fidin) 
    tline=fgetl(fidin); 
    nline=nline+1; 
if nline==line
    fprintf(fidout,'%s',tline);
    dataout=tline;
end
end
    fclose(fidin);
    fclose(fidout);