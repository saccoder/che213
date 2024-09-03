x=[0 0.02 0.04 0.06 0.08 0.10 0.20 0.30 0.40 0.50 0.60 0.70 0.80 0.90 0.95 1.0];
y=[0 0.134 0.23 0.304 0.365 0.418 0.579 0.665 0.729 0.779 0.825 0.87 0.915 0.958 0.979 1];
F_fit = @(x_fit,x_data) (x_fit(1).*x_data)./(1 + (x_fit(2).*x_data)+(x_fit(3).*x_data.^2));       % Y-X fitting
x_fit0 = [1 1 1];
[x_fit, resnorm] = lsqcurvefit(F_fit,x_fit0,x,y);
f1=figure;
plot(x,y);
hold on
d=0:0.01:1;
plot(d,(x_fit(1).*d)./(1 + (x_fit(2).*d)+(x_fit(3).*d.^2)));
legend('data point','fitted curve');
f2=figure;
plot(d,(x_fit(1).*d)./(1 + (x_fit(2).*d)+(x_fit(3).*d.^2)));
hold on
plot(d,d);
hold on
F=500;
zf=0.45;
xd=0.97;
xw=0.02;
S=50;
xs=0.7;
W=(F*zf-S*xs-F*xd+S*xd)/(xw-xd); %W = 259.4737
D=F-S-W;%   D = 190.5263
plot(xs,xs,'o');
hold on
plot(xd,xd,'o');
hold on
plot(xw,xw,'o');
hold on
plot(zf,zf,'o');
hold on
q=0.8;
slope=q/(q-1); %-4
r=0.38:0.01:zf;
plot(r,slope.*r-slope*zf+zf);
hold on
r=[xs,0.872398]; %intersection point of stream line and curve
c=[xs,xs];
plot(c,r);
hold on
k=(0.97-0.872398)/(0.97-0.7)*-0.97+0.97;
minR=xd/k-1; % minimum reflux ratio = 0.5661
R=2.5*minR; % actual refulx ratio = 1.4154
L1=R*D; % liquid rate in section  1 = 269.6631
V1=(R+1)*D; %vapor rate in section 1 = 460.1894
m1=L1/V1;
c=[0.97,0.7];
r=[0.97,m1*(0.7-0.97)+0.97];
plot(c,r);
hold on
L2=L1-S;% liquid rate in section  2 = 219.6631
V2=V1; %saturated liquid vapor rate in section 1 = 460.1894
m2=L2/V2;
xe=(slope*-1*zf+zf+m2*0.7-0.811785)/(m2-slope);
c=[0.7,xe];
r=[0.811785,m2*(xe-0.7)+0.811785];
plot(c,r);
hold on
L3=L2+0.8*F;% liquid rate in section  3 = 619.6631
V3=V2-0.2*F;%vapor rate in section 3 = 360.1894
m3=L3/V3;
c=[0.02,0.395849];
r=[0.02,0.666604];
plot(c,r);
hold on
y1=0.97;
x1=0.97;
x2=fsolve(@(x1)solve(x_fit,x1,y1),y1);
c=[x1,x2];
r=[y1,y1];
plot(c,r);
hold on
y2=m1*(x2-0.97)+0.97;
c=[x2,x2];
r=[y1,y2];
plot(c,r);
hold on
y1=y2;
x1=x2;
x2=fsolve(@(x1)solve(x_fit,x1,y1),y1);
c=[x1,x2];
r=[y1,y1];
plot(c,r);
hold on
y2=m1*(x2-0.97)+0.97;
c=[x2,x2];
r=[y1,y2];
plot(c,r);
hold on
y1=y2;
x1=x2;
x2=fsolve(@(x1)solve(x_fit,x1,y1),y1);
c=[x1,x2];
r=[y1,y1];
plot(c,r);
hold on
y2=m1*(x2-0.97)+0.97;
c=[x2,x2];
r=[y1,y2];
plot(c,r);
hold on
y1=y2;
x1=x2;
x2=fsolve(@(x1)solve(x_fit,x1,y1),y1);
c=[x1,x2];
r=[y1,y1];
plot(c,r);
hold on
y2=m1*(x2-0.97)+0.97;
c=[x2,x2];
r=[y1,y2];
plot(c,r);
hold on
y1=y2;
x1=x2;
x2=fsolve(@(x1)solve(x_fit,x1,y1),y1);
c=[x1,x2];
r=[y1,y1];
plot(c,r);
hold on
y2=m2*(x2-0.7)+0.811785;
c=[x2,x2];
r=[y1,y2];
plot(c,r);
hold on
y1=y2;
x1=x2;
x2=fsolve(@(x1)solve(x_fit,x1,y1),y1);
c=[x1,x2];
r=[y1,y1];
plot(c,r);
hold on
y2=m2*(x2-0.7)+0.811785;
c=[x2,x2];
r=[y1,y2];
plot(c,r);
hold on
y1=y2;
x1=x2;
x2=fsolve(@(x1)solve(x_fit,x1,y1),y1);
c=[x1,x2];
r=[y1,y1];
plot(c,r);
hold on
y2=m3*(x2-0.02)+0.02;
c=[x2,x2];
r=[y1,y2];
plot(c,r);
hold on
y1=y2;
x1=x2;
x2=fsolve(@(x1)solve(x_fit,x1,y1),y1);
c=[x1,x2];
r=[y1,y1];
plot(c,r);
hold on
y2=m3*(x2-0.02)+0.02;
c=[x2,x2];
r=[y1,y2];
plot(c,r);
hold on
y1=y2;
x1=x2;
x2=fsolve(@(x1)solve(x_fit,x1,y1),y1);
c=[x1,x2];
r=[y1,y1];
plot(c,r);
hold on
y2=m3*(x2-0.02)+0.02;
c=[x2,x2];
r=[y1,y2];
plot(c,r);
hold on
y1=y2;
x1=x2;
x2=fsolve(@(x1)solve(x_fit,x1,y1),y1);
c=[x1,x2];
r=[y1,y1];
plot(c,r);
hold on
y2=m3*(x2-0.02)+0.02;
c=[x2,x2];
r=[y1,y2];
plot(c,r);
hold on
legend('Equilibrium Curve','y=x line','S(xs,xs)','D(xd,xd)','W(xw,xw)','F(zf,zf)','Feed Line','side stream line','Section 1 operating line','Section 2 Operating line','Section 3 operating line');
%minimum no. of stages=10(from the graph)
% feed enters tray no. 7
% Side stream is withdrawn from try no. 4