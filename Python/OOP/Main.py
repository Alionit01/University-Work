class Animal:
    def __init__(self,name: str,age: int) -> None:
        self.name = name
        self.age = age
    def speak(self):
        print("bhao bhao")

animal: Animal = Animal('Ayoush',2)
print(animal.name)
print(animal.age)
animal.speak()

