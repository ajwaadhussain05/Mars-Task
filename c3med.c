#include <stdio.h>
#include <string.h>  
#include <ctype.h>  

// Function to decode an encoded message
void decode(char *input) {
    int length = strlen(input);  //get the length of the input string
    char decoded[length + 1];    //create an array to get no. of decoded characters

    // Loop through each character in the input string
    for (int i = 0; i < length; i++) {
        char currentChar = toupper(input[i]);  //convert the current character to uppercase
        char originalChar = currentChar - (i + 1);  
        // If the decoded character is less than 'A' then we should wrap around to the end of the alphabet
        if (originalChar < 'A') {
            originalChar += 26;  
        }

        decoded[i] = originalChar;  //storing the decoded character in the decoded array
    }
    decoded[length] = '\0';  
    printf("Decoded message: %s\n", decoded);  // Print the decoded message
}

int main() {
    char input[100];  
    printf("Enter the encoded message: ");  
    scanf("%s", input);  //to get input string from the user
    decode(input);  //call the decode fxn to decode the input message
    return 0; 
}
