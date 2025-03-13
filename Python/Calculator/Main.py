operation = input("Enter what you wanna do # +,-,*,/ # ")
num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))

if operation == "+":
    result = num1 + num2
    print(result)
elif operation == "-":
    result = num1 - num2
    print(result)
elif operation == "*":
    result = num1 * num2
    print(result)
elif operation == "/":
    if num2 != 0:  # To avoid division by zero
        result = num1 / num2
        print(result)
    else:
        print("Error: Cannot divide by zero.")
else:
    print("Invalid operation entered.")