//: Playground - noun: a place where people can play

import UIKit

// Solution:

func sentenceReversal(s: String) -> String{
	
	// Convert String into an Array
	let stringInArr = Array(s.characters)
	
	// Get the length of the stringArr
	let length = stringInArr.count
	
	// Then we could know the last index of this array should be length - 1
	// Why we need the last index? Because we are reversing the string
	var i = length - 1
	
	// placeholder array to be returned
	var reversedWords = [String]()
	
	// Use while loop to make sure we iterate through the array exhaustively
	while i >= 0 {
		
		// If it is not a white space, then it means find an end of a word
		if stringInArr[i] != " "{
			
			// Keep record of the end
			let word_end = i
			
			// Use while loop to find the begginning of the word
			while i >= 0 && stringInArr[i] != " "{
				i -= 1
			}
			
			// Append the word
			reversedWords.append(String(stringInArr[(i+1)...word_end]))
		}
		
		// We need to minus 1 here, because before here, s[i] is a white space
		// We need a way to iterate until s[i] is a letter
		i -= 1
	}
	
	// With the help of join, we could easily returned a reversed string from an
	// array
	return reversedWords.joinWithSeparator(" ")
}

sentenceReversal("   I Love   You  ")
