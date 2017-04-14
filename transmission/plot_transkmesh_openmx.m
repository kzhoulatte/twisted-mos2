clc;clear;

load negf-mos2.tran0_0;
x = negf_mos2;
plot(x(:,4),x(:,6),x(:,4),x(:,6),'o');
xlim([-3,2]);

hold on;

load negf-mos2.tran0_1;
x1 = negf_mos2;
plot(x1(:,4),x1(:,6),x1(:,4),x1(:,6),'+');
xlim([-3,2]);

load negf-mos2.tran0_2;
x2 = negf_mos2;
plot(x2(:,4),x2(:,6),x2(:,4),x2(:,6),'.');
xlim([-3,2]);

load negf-mos2.tran1_0;
x3 = negf_mos2;
plot(x3(:,4),x3(:,6),x3(:,4),x3(:,6),'v');
xlim([-3,2]);

load negf-mos2.tran1_1;
x4 = negf_mos2;
plot(x4(:,4),x4(:,6),x4(:,4),x4(:,6),'>');
xlim([-3,2]);

load negf-mos2.tran1_2;
x1 = negf_mos2;
plot(x1(:,4),x1(:,6),x1(:,4),x1(:,6),'+');
xlim([-3,2]);

load negf-mos2.tran2_0;
x2 = negf_mos2;
plot(x2(:,4),x2(:,6),x2(:,4),x2(:,6),'.');
xlim([-3,2]);

load negf-mos2.tran2_1;
x3 = negf_mos2;
plot(x3(:,4),x3(:,6),x3(:,4),x3(:,6),'v');
xlim([-3,2]);

load negf-mos2.tran2_2;
x4 = negf_mos2;
plot(x4(:,4),x4(:,6),x4(:,4),x4(:,6),'>');
xlim([-3,2]);
