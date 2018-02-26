function BEHAVIOR()
tmp = csvread('parameter.csv');
N=tmp(1);
seed=tmp(2);
y = csvread('y.csv');
P = csvread('P.csv');
G = csvread('G.csv');
Pt = csvread('Pt.csv');
Gt = csvread('Gt.csv');

[n,p]=size(P);
nt = size(Pt,1);

x=cell(1,p);
xt=cell(1,p);
z=cell(1,p);
zt=cell(1,p);
for i = 1:p
    x{i}=G(:,i);
    xt{i}=Gt(:,i);
    z{i}=double.empty(n,0);
    zt{i}=double.empty(nt,0);
end

family='w';

Npo=N/10;
thin = 5;
burnin = floor(N/2);
burninpo=floor(Npo/10);
cutoff=0.5;
%[q,r,p,n,noise,nt,atrue,ptrue,y,yt,link,linkt,lp,lpt,u,ut,x,xt,z,zt,v0_true,v0_test,v_true,v_test,utrue,u_test,t_true,dens,Zind]=setup_reg(s,seed,family);
%[q,r,p,n,nt,atrue,y,yt,link,linkt,lp,lpt,u,ut,x,xt,z,zt,v0_true,v0_test,v_true,v_test,utrue,u_test,t_true,dens]=setup_reg(s,seed);

[lin_est,nlin_est,ln_est,categ_est,const_est,~,lin_rate,nlin_rate,~,~,const_rate,~,~,~,~,~,~,~,~,~,~,~,~,~,~,~,eta_sd,xi_sd,t_sd,sigma_var]=GVSM_MCMC(y,P,x,z,cutoff,N,thin,burnin,seed,family);
[lin_coef,nlin_coef,~,const_coef,~,~,~,~,~,~,~,reg_coef,~,~,reg_rate,~,ypred,~,~,~,~,~,~,~,~,~,~,lambda,~]=postMCMC(y,P,x,z,cutoff,Pt,xt,zt,lin_est,nlin_est,categ_est,const_est,Npo,burninpo,seed,family,eta_sd,xi_sd,t_sd,sigma_var);



save('BEHAVIOR.mat','reg_coef','reg_rate','lambda','lin_coef','nlin_coef','const_coef','lin_rate','nlin_rate','const_rate','ypred')

