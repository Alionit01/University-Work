#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_WRONG_GUESSES 6
#define WORDS_COUNT 10
#define MAX_WORD_LENGTH 20

char* words[WORDS_COUNT] = {"apple", "banana", "orange", "grape", "pineapple", "strawberry", "watermelon", "kiwi", "peach", "blueberry"};

int main() {
    char word[MAX_WORD_LENGTH];
    char guessed[MAX_WORD_LENGTH];
    int wrongGuesses = 0;
    int i, wordLength, allGuessed = 0;

    srand(time(NULL));
    strcpy(word, words[rand() % WORDS_COUNT]);
    wordLength = strlen(word);

    // Initialize guessed array
    for (i = 0; i < wordLength; i++) {
        guessed[i] = '_';
    }
    guessed[i] = '\0';

    printf("Welcome to Hangman!\n");
    printf("Try to guess the word.\n");

    while (wrongGuesses < MAX_WRONG_GUESSES && !allGuessed) {
        printf("Word: %s\n", guessed);
        printf("Enter a letter: ");
        char guess;
        scanf(" %c", &guess);

        int correct = 0;
        for (i = 0; i < wordLength; i++) {
            if (word[i] == guess) {
                guessed[i] = guess;
                correct = 1;
            }
        }

        if (!correct) {
            printf("Wrong guess!\n");
            wrongGuesses++;
        }

        allGuessed = 1;
        for (i = 0; i < wordLength; i++) {
            if (guessed[i] == '_') {
                allGuessed = 0;
                break;
            }
        }
    }

    if (allGuessed) {
        printf("Congratulations! You guessed the word: %s\n", word);
    } else {
        printf("Sorry, you ran out of guesses. The word was: %s\n", word);
    }

    return 0;
}


