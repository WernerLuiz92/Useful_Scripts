import re
import pyperclip

# Sua regex
regex = r'(.*?[^\d]+)(\d+)(.*?[^\d]+)'

# Get the value from the clipboard
originalString = pyperclip.paste()

# Encontre correspondências na string
match = re.search(regex, originalString)

if match:
    # Obtenha o valor correspondente ao grupo 2 e some 1
    group2 = int(match.group(2)) + 1

    # Reconstrua a string com o novo valor
    newString = f'{match.group(1)}{group2}{match.group(3)}'

    # Print the new string
    print(newString)
else:
    # Print the original string
    print(originalString)
