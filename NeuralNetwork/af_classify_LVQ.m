%% 使用神经网络模型(向量量子化方法LVQ)解决蝗虫分类问题
clc, clear

% 第一类蝗虫的触角和翅膀
p1 = [1.24, 1.27; 1.36, 1.74; 1.38, 1.64;
 1.38, 1.82; 1.38, 1.90; 1.40, 1.70;
 1.48, 1.82; 1.54, 1.82; 1.56, 2.08];
% 第二类蝗虫的触角和翅膀
p2 = [1.14, 1.82; 1.18, 1.96; 1.20, 1.86;
  1.26, 2.00; 1.28, 2.00; 1.30, 1.96];

p = [p1; p2]';
% 分别获取触角和翅膀的最小值与最大值
pr = minmax(p);

goal = [ones(1, 9), zeros(1, 6); zeros(1, 9), ones(1, 6)];
plot(p1(:, 1), p1(:, 2), 'h', p2(:, 1), p2(:, 2), 'o');

net = newlvq(pr, 4, [0.6, 0.4]);
net = train(net, p, goal);

Y = sim(net, p);
% 待分类数据
x = [1.24, 1.80; 1.28, 1.84; 1.40, 2.04]';
sim(net, x)