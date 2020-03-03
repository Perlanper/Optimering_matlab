s = [1 1 1 2 2 3 4 4 5 6 6 7 7 8 8 9 10 10 11 11 12 13 13 14 15 15 15 16 17 17 17 18 18 19 19 20 20 21 21 22 22 22 23 24 24 25 26 26 27 27 28 29 29 30 30 31 31 32 32 33 33 33 34 35 35 36 36 37 37 38 39 40 40 40 41 42 42 43 44 45 46 46 48];
t = [2 7 13 3 4 5 5 8 6 9 10 8 13 9 14 15 11 16 12 17 18 14 19 19 14 16 21 22 16 22 24 17 24 21 25 26 27 20 27 21 23 28 28 23 29 26 30 35 28 31 32 28 34 36 41 30 32 33 37 38 39 43 33 36 44 40 44 41 42 37 43 41 45 46 45 43 45 48 46 48 45 47 47];
length(s)
length(t)
for i=1:length(s)
    fprintf("%d, %d\n", s(i), t(i));
end 
w = [440 280 480 250 220 250 210 170 260 300 200 260 240 210 350 410 210 170 340 150 280 260 340 180 210 250 290 250 280 120 150 410 260 260 240 310 250 360 350 250 280 130 190 240 240 280 295 240 210 280 240 240 280 160 290 250 310 295 240 200 195 260 150 365 210 310 270 260 140 190 205 410 340 385 250 300 270 180 325 395 270 625 570];
length(w)
g = graph(s,t,w);

plot(g,'EdgeLabel',g.Edges.Weight);
