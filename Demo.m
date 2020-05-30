% -------------------------------------------------------------------------
% demo
% Public Version
% Code By Nengyuan Liu, nengyuanliu@outlook.com
% Update:2020.05.30
% Citation:
    % @article{liu2019multi,
    %   title={Multi-Layer Abstraction Saliency for Airport Detection in SAR Images},
    %   author={Liu, Nengyuan and Cao, Zongjie and Cui, Zongyong and Pi, Yiming and Dang, Sihang},
    %   journal={IEEE Transactions on Geoscience and Remote Sensing},
    %   volume={57},
    %   number={12},
    %   pages={9820--9831},
    %   year={2019},
    %   publisher={IEEE}
    % }

    % @article{liu2018airport,
    %   title={Airport detection in large-scale SAR images via line segment grouping and saliency analysis},
    %   author={Liu, Nengyuan and Cui, Zongyong and Cao, Zongjie and Pi, Yiming and Dang, Sihang},
    %   journal={IEEE Geoscience and Remote Sensing Letters},
    %   volume={15},
    %   number={3},
    %   pages={434--438},
    %   year={2018},
    %   publisher={IEEE}
    % }
% -------------------------------------------------------------------------
clear; close all; clc;
addpath(genpath('./utils/'))

% load data
path = './data/1.png';
params = makeAiportDetectionParams();

% get map
tStart = tic;
Map = getSaliencyMap(path, params);
tElapsed = toc(tStart);

% Plot
figure; imshow(Map, []); hold on; title('Final Map');





