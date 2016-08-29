//: Playground - noun: a place where people can play

import UIKit

// Solution: This is common question for testing knowledge on using stacks
// Why? Because for parenthese, if we have a close parenthese, when we want to
// find its counterpart, it is fast to look at the last item in an open-paren stack
// too see if they are a match. If not, then we do not have a balanced parenthese

func balancedParenCheck(targetString: String) -> Bool{
	
	// 1. convert the string into an array
	let stringInArr = Array(targetString.characters)
	
	// Check if the number of letters in the string is odd or even.
	// If it is odd, then it means we do not have a balanced parenthese directly
	// But this only applies to cases where no other letters may be contained 
	// in the array
	if(stringInArr.count % 2 != 0){
		return false
	}
	
	// Acceptable opening parenthese
	let openings = ["(", "{", "["]
	
	// Acceptable parenthese pairs
	let balancedPair = [("(", ")"), ("{", "}"), ("[", "]")]
	
	// Stack for checking
	var openParenStack = [String]()
	
	// Iterate through the string
	for paren in stringInArr {
		
		let parenInString = String(paren)
		
		// If it is an open parenthese, then we need to push this paren into
		// our stack
		if openings.contains(parenInString){
			openParenStack.append(parenInString)
		
		// Else, it means that this is a potential close parenthese
		}else{
			
			// For a potential close parenthese, if there is no counterpart of it,
			// then we can jump to the conclusion that it is imbalanced. This means,
			// the openParenStack cannot be empty
			if(openParenStack.count == 0){
				return false
			}
			
			// We pop the stack and get the last open paren
			let lastOpenParen = openParenStack.removeLast()
			
			// And check if this open paren and the close paren could be a valid
			// pair for balancedPair
			if(!balancedPair.contains({ (pair) -> Bool in
				return pair == (lastOpenParen, parenInString)
			})){
				return false
			}
		}
	}
	
	// In the end, if we have a balanced parenthese, then the stack should be 0,
	// because we are poping it along the iteration, else, it is imbalanced
	return openParenStack.count == 0
}

