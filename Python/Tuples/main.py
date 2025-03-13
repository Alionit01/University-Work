# Tuple are immutable
# They are faster then list because since we cant change tuple so it take only one block of storage
# unlike list which take two blocks since it has to change
# 1st way of printing tuple
bag = ("car", "bike", 23, "pen")
print(bag)
# 2nd
for items in bag:
    print(items)
# 3rd
for i in range(len(bag)):
    print(bag[i])