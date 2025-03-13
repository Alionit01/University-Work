# s = "hello python"
# print(s[::-1])

# Task 1:

# List of book codes
# book_codes = ["FIC10521HAR", "BIO20753OXF", "SCI30584PEN"]
#
# # Loop through each book code and extract details
# for code in book_codes:
#     # Extract information using string slicing
#     category = code[:3]         # First 3 characters: Book Category
#     shelf_number = code[3:5]    # Next 2 characters: Shelf Number
#     book_number = code[5:8]     # Next 3 characters: Book Number
#     publisher_code = code[8:]
#
#     print(f"Book Code: {code}")
#     print(f"  Category: {category}")
#     print(f"  Shelf Number: {shelf_number}")
#     print(f"  Book Number: {book_number}")
#     print(f"  Publisher Code: {publisher_code}")
#     print()  # Blank line for better readability

# Task 2:

ticket_ids = ["AVT1215M", "TLR0818E", "HPT1012A"]

for code in ticket_ids:
    movieCode = code[:3]
    seatNumber = code[3:5]
    ticketPrice = int(code[5:7])
    showTime = code[7:8]

    print("Movie code:",movieCode)
    print("Seat Number:",seatNumber)
    print("Ticket Price:",ticketPrice)
    print("Show time",showTime)
    print()
