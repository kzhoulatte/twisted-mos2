clear all
Nk1=1000;
Nk2=8;

divv=0.2;

%%%

iii=28

    en(iii)=iii;
    En(iii)=0.2-(iii-1)*0.01;
    if En(iii) > 0.095
        dir=['E0',num2str(21-iii)]
    elseif En(iii) > -0.005
        dir=['E00',num2str(21-iii)]
    elseif  En(iii) > -0.095
        dir=['E_00',num2str(iii-21)]
    else
        dir=['E_0',num2str(iii-21)]
    end
    
    TEk=read_trans(en(iii),Nk1,Nk2,dir);
    TE=cal_trans(TEk,Nk1,Nk2);


%%%







LA=1.42*sqrt(3);
b1=2*pi/LA*[1,1/sqrt(3),0];
b2=2*pi/LA*[1,-1/sqrt(3),0];





aa=1.0;
aas=0.0;
a=aa/(-1);
as=aas/(-1);
%where angle between b1 and b2 is 60 degree


X=Nk2;
N=Nk1;

for kk=1:1
    if mod(kk,2)        
angles=linspace(-pi/3+(kk-1)*pi/3,(kk-1)*pi/3,X+1);
    else
angles=linspace((kk-1)*pi/3,-pi/3+(kk-1)*pi/3,X+1);
    end
Kp=[1/3,1/3,1];
    
 for i = 1 : X    
    rotangle=angles(1,i);
    numbs(i,1)=as*(sin(rotangle)/sqrt(3)+cos(rotangle)/3)+1/3;
    numbs(i,2)=as*(-sin(rotangle)/sqrt(3)+cos(rotangle)/3)+1/3;
    numbs(i,3)=1;
    
    
    
    numb(i,1)=a*(sin(rotangle)/sqrt(3)+cos(rotangle)/3)+1/3;
    numb(i,2)=a*(-sin(rotangle)/sqrt(3)+cos(rotangle)/3)+1/3;
    numb(i,3)=1;
                XXX=linspace(numbs(i,1),numb(i,1),N+1);
                YYY=linspace(numbs(i,2),numb(i,2),N+1);
                ZZZ=linspace(numbs(i,3),numb(i,3),N+1);
                allk=[XXX',YYY',ZZZ'];
    kpoints((i-1)*N+1:i*N,:)=allk(2:N+1,:);   
 end
 
 for j=1:N*X
    K_card(j,:)=kpoints(j,1)*b1+kpoints(j,2)*b2;
 end

 
 TK=zeros(N*X,3);
for j=1:N
    for jj=1:X
    TK((j-1)*X+jj,1:3)=K_card((jj-1)*N+j,:);
    TK((j-1)*X+jj,4)=TEk(j,jj);
    end
end

RoundTK(N*X*(kk-1)*divv+1:N*X*kk*divv,:)=TK(1:N*X*divv,:);

end

MAXVAL=max(RoundTK(:,4));
MAXT=MAXVAL;

NORM_color=RoundTK(:,4)/MAXT;


%%% R G B
for i=1:size(NORM_color,1)
    if NORM_color(i,1) > 0.5
    MC(i,:)=[(NORM_color(i,1)-0.5)*2,sqrt(1-4*(NORM_color(i,1)-0.5)*(NORM_color(i,1)-0.5)),0];
    else
        MC(i,:)=[0,NORM_color(i,1)*2,sqrt(1-4*NORM_color(i,1)*NORM_color(i,1))];
    end

    if NORM_color(i,1)>0
    MS(i,1)=50;
    else
    MS(i,1)=10;
    end
end

% for i=1:size(NORM_color,1)
%     MC(i,:)=[NORM_color(i,1),0,sqrt(1-NORM_color(i,1)*NORM_color(i,1))];
%     if NORM_color(i,1)>0
%     MS(i,1)=50;
%     else
%     MS(i,1)=10;
%     end
% end


figure('units','normalized','outerposition',[0 0 0.444444444 1])
scatter3(RoundTK(:,1),RoundTK(:,2),RoundTK(:,4),MS,MC,'filled');
% plot3(RoundTK(:,1),RoundTK(:,2),RoundTK(:,4));
axis equal
view(0, 90);
hold on

%annotation('textbox',[x y w h]) creates an editable text box annotation
%with its lower left corner at the point x,y, a width w, and a height h, specified in normalized figure units. Specify x, y, w, and h in a single vector.
annotation ('textbox', [0.23,0.9,0.08,0.02],...
    'String', ['MAX T=',num2str(MAXVAL)]);
annotation ('textbox', [0.7,0.9,0.08,0.02],...
    'String', ['E =',num2str(En(iii)),' eV']);

