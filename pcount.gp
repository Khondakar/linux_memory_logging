samples(x) = $0 > 4 ? 5 : ($0+1)
avg5(x) = (shift5(x), (back1+back2+back3+back4+back5)/samples($0))
shift5(x) = (back5 = back4, back4 = back3, back3 = back2, back2 = back1, back1 = x)
init(x) = (back1 = back2 = back3 = back4 = back5 = sum = 0)
sum = init(0)



set terminal wxt size 1920,1080
set key outside;
set key right center;
set key width 1;
set key samplen 2 font ",8";
list = system('ls $filepath/*.log')
plot [file in list] file
