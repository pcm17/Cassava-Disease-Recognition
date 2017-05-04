function [healthy, disease] = load_data_cassava( leaftype )
%% Load Healthy Data
healthy = importdata(['Resources/' leaftype '/image_data/healthy.txt']);
fclose('all');
numIms = size(healthy,1);
class=zeros(numIms,1);
if size(healthy,2) == 2048
    healthy = [healthy class];
end
%% Load all bls data
bls = importdata(['Resources/' leaftype '/image_data/bls.txt']);
numIms = size(bls,1);
class=zeros(numIms,1);
class(:)=1;
if size(bls,2) == 2048
    bls = [bls class];
end
fclose('all');
%% Load all cbsv data
cbsv = importdata(['Resources/' leaftype '/image_data/cbsv.txt']);
d=cbsv;
numIms = size(d,1);
class=zeros(numIms,1);
class(:)=2;
if size(d,2) == 2048
    cbsv = [cbsv class];
end
fclose('all');
%% Load all cmv data
cmv = importdata(['Resources/' leaftype '/image_data/cmv.txt']);
d=cmv;
numIms = size(d,1);
class=zeros(numIms,1);
class(:)=3;
if size(d,2) == 2048
    cmv = [cmv class];
end
fclose('all');
%% Load all red mite damage data
rmd = importdata(['Resources/' leaftype '/image_data/rmd.txt']);
d=rmd;
numIms = size(d,1);
class=zeros(numIms,1);
class(:)=4;
if size(d,2) == 2048
    rmd = [rmd class];
end
fclose('all');
%% Load all green mite damage data
gmd = importdata(['Resources/' leaftype '/image_data/gmd.txt']);
d=gmd;
numIms = size(d,1);
class=zeros(numIms,1);
class(:)=5;
if size(d,2) == 2048
    gmd = [gmd class];
end
fclose('all');


%%
% Store data in one array
disease = [bls;cbsv;cmv;gmd;rmd];
end

