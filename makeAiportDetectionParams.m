function p = makeAiportDetectionParams()
 
p = {};                              
p.ThetaTao = 5;                 % parameter of airport support regions
p.DisTao = 30;                   % parameter of airport support regions                           
p.overlap = 0.2;                 % parameter of airport support regions 
p.delnum = 0;                    % parameter of airport support regions

p.spSize = 8;                    % size of superpixel
p.tau = 0;                       % cutoff
p.NumWins = 1;                   % number of background windows
p.plotf = true;                 % plot figures
