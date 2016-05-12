set key outside;
set key right;
list = system('ls $filepath/*.log')
plot for [file in list] file title system('basename '.file)
