import random

check = input("What to roll the dice y or n").lower()
while True:
    if check == 'y':
        num = random.randint(0,6)
        print(num)
        check = input("What to roll the dice again y or n").lower()
    elif check == 'n':
        print("Thankyou")
        break;
    else:
        print("Invalid choice")