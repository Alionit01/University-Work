#   List  = [] ordered and changeable. Duplicates OK
#   Set   = {} unordered and immutable, but Add/Remove OK. NO duplicates
#   Tuple = () ordered and unchangeable. Duplicates OK. FASTER

# Task 1:

# fruits = ("apple", "banana", "cherry", "orange", "banana")
# print("Is at index", fruits.index("banana"))
# print("Number of time present",fruits.count("banana"))

# Task 2:

# grades = [85,90,78,93,88,76,95,89]
# grades.append(80)
# grades.sort()
# print(grades)
# print("Highest", max(grades))
# grades.remove(76)
# print(grades)
# ab = 0
# for grade in grades:
#     if grade > 85:
#         ab += 1
# print("Number of grades greater than 85:", ab)

# Task 3:

grocery = ()
f1 = input("Enter first fruit: ")
f2 = input("Enter second fruit: ")
f3 = input("Enter third fruit: ")
f4 = input("Enter fourth fruit: ")
f5 = input("Enter fifth fruit: ")

grocery = grocery + (f1,) + (f2,) + (f3,) + (f4,) + (f5,)
print("Initial tuple:", grocery)
remove_fruit = input("Enter the fruit to remove: ")

grocery_list = list(grocery)  # Convert tuple to list
if remove_fruit in grocery_list:
    grocery_list.remove(remove_fruit) 
grocery = tuple(grocery_list)  # Convert back to tuple

new_fruit = input("Enter a new fruit to add: ")
grocery = grocery + (new_fruit,)

print("Final tuple:", grocery)
