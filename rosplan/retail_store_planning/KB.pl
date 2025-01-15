:- discontiguous final_location/2.
:- discontiguous sortlist/1.
%Facts
drink('AH_thee_mango_tag_11_00030'). %Tea is a drink
drink('AH_thee_bosvruchten_tag36_11_00049'). 
snack('AH_hagelslag_melk_tag36_11_00000'). %Hagelslag is a snack
snack('AH_hagelslag_melk_tag36_11_00001').
snack('AH_hagelslag_melk_tag36_11_00002').
snack('AH_hagelslag_melk_tag36_11_00003').
drinktable(wp_table_1).  %drink-table
snacktable(wp_table_2).  %snack-table
bin(basket). %bin

at_location('AH_thee_mango_tag_11_00030', cab_2_shelves).
at_location('AH_thee_bosvruchten_tag36_11_00049', cab_2_shelves).
at_location('AH_hagelslag_melk_tag36_11_00000', cab_2_shelves).
at_location('AH_hagelslag_melk_tag36_11_00001', cab_2_shelves_0).
at_location('AH_hagelslag_melk_tag36_11_00002', cab_2_shelves_0).
at_location('AH_hagelslag_melk_tag36_11_00003', cab_2_shelves_0).

expired('AH_hagelslag_melk_tag36_11_00000'). %This Hagelslag is expired
empty('Random_hagelslag').
has_room(wp_table_1,3).
has_room(wp_table_2,3).
has_room(basket,3).

%1 is highest priority, 5 is least
priority_expiry('AH_hagelslag_melk_tag36_11_00001', 1).
priority_expiry('AH_hagelslag_melk_tag36_11_00002', 5).
priority_expiry('AH_hagelslag_melk_tag36_11_00003', 2).

sortlist([1, 5, 2]).
sorted(L):- sortlist(A), sort(A, L).
head(X):- sorted(L), L = [X | T], length(L, Len), Len>0.
priority(Y):-head(Y).
sortlist(T):- sorted(L), L = [X | T], length(L, Len), Len>1.

%Rules
%drinks and snacks are items
item(X):-drink(X);snack(X). 

%If an item is expired or an item is empty, then it is bad.
bad(X) :- item(X), (expired(X);empty(X)).

good(X) :- item(X), \+(expired(X);empty(X)).

%If item is bad and there is room in a bin, then the item goes in the bin.
%bin_loc(X) :- bad(X).
final_location(X,Y):- bad(X), bin(Y), stockable(Y).

%If location X has room greater than 0, than it is stockable
stockable(X):-has_room(X, Y), Y>0.

%If a drink is not bad and there is a drinktable that is stockable, then the item goes on the drinktable.
%drink_loc(X):- good(X), drink(X), stockable(wp_table_1).  
final_location(X,Y):- good(X), drink(X), drinktable(Y), stockable(Y).  

%If a snack is not bad and there is a snacktable that is stockable, then the item goes on the snacktable.
%snack_loc(X):- good(X), snack(X), stockable(wp_table_2).
final_location(X,Y):- good(X), snack(X), snacktable(Y), stockable(Y). 

