function BayesPosterior = calculateBayesPosterior(prior,observer,r,c)
%% Calculate the Bayesian posterior probability.
% X. Li, H. Lu, L. Zhang, X. Ruan and M. Yang, "Saliency Detection via Dense and Sparse Reconstruction," 2013 IEEE International Conference on Computer Vision, Sydney, NSW, 2013, pp. 2976-2983, doi: 10.1109/ICCV.2013.370.
% parameters
numBin = 60;
smoothFactor = 3;

% Obtain Foreground and Background
BW = imbinarize(prior, mean(prior(:)));
PixelFgInd = find(BW == 1);
PixelBgInd = find(BW == 0);

%% calculate the likelihoods of Bayesian inference by error map 
BayesPosterior(:,:,1)=Bayes(prior, observer, PixelFgInd, PixelBgInd, numBin, smoothFactor, r, c);
end