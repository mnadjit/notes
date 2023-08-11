#!/usr/bin/python3

rot13trans = str.maketrans('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', 'NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm')

# Function to translate plain text
def rot13(text):
    return text.translate(rot13trans)

def main():
    txt = input('Enter text to transform: ')
    print(rot13(txt))

if __name__ == "__main__":
    main()
