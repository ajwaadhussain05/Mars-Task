#morse code dictionary
MORSE_CODE_DICT = {
    '.-': 'A', '-...': 'B', '-.-.': 'C', '-..': 'D', 
    '.': 'E', '..-.': 'F', '--.': 'G', '....': 'H', 
    '..': 'I', '.---': 'J', '-.-': 'K', '.-..': 'L', 
    '--': 'M', '-.': 'N', '---': 'O', '.--.': 'P', 
    '--.-': 'Q', '.-.': 'R', '...': 'S', '-': 'T', 
    '..-': 'U', '...-': 'V', '.--': 'W', '-..-': 'X', 
    '-.--': 'Y', '--..': 'Z', '-----': '0', '.----': '1', 
    '..---': '2', '...--': '3', '....-': '4', '.....': '5', 
    '-....': '6', '--...': '7', '---..': '8', '----.': '9', 
    '/': ' ' 
}

def decode_morse(morse_code):
    #split the Morse code by spaces to get individual letters/words
    morse_words = morse_code.split(' / ')  #split words by ' / '
    decoded_message = []

    for morse_word in morse_words:
        morse_letters = morse_word.split()  #split letters by space
        decoded_word = ''
        for letter in morse_letters:
            decoded_letter = MORSE_CODE_DICT.get(letter, '?')  
            decoded_word += decoded_letter  #combine each decoded letter to a word
        decoded_message.append(decoded_word)  

    return ' '.join(decoded_message)  #join all words into a single string

#user input for morse code
morse_message = input("Enter Morse code (use spaces between letters and ' / ' between words): ")
decoded_message = decode_morse(morse_message)
print("Decoded message:", decoded_message)
