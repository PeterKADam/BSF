reinitialize
bg_color white
cd 

fetch  2rl8 , async=0
create 2rl8A , /2rl8//A

fetch  2rlb , async=0
create 2rlbA , /2rlb//A

fetch  2rl9 , async=0
create 2rl9A , /2rl9//A+C

fetch  2rl7 , async=0
create 2rl7A , /2rl7//A

fetch 1syo , async=0
create 1syoA, /1syo//A

delete 2rl8
delete 2rlb
delete 2rl9
delete 2rl7
delete 1syo

cd C:\Users\45289\Documents\GitHub\BSF\Uge45\
run superList.txt
superList

hide nonbonded
center name MN