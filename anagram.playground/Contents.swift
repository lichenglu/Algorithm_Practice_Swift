//: Playground - noun: a place where people can play

import UIKit

// Solution 1: with the help of native helper function -- sort
func anagramWithSort(s1: String, s2: String) -> Bool{
	
	// Since white spaces and capitilization are not taken into account in this
	// case. We first of all, need to trim the string to get rid of spaces and 
	// capitilization. Then we make the strings into two arrays
	let trimmedS1 = Array(s1.stringByReplacingOccurrencesOfString(" ", withString: "").lowercaseString.characters)
	let trimmedS2 = Array(s2.stringByReplacingOccurrencesOfString(" ", withString: "").lowercaseString.characters)
	
	// After we sort the arrays. If they are anagram, then they should be the same
	// If not, then they are not anagram
	return trimmedS1.sort() == trimmedS2.sort()
}

anagramWithSort("god", s2: "dog")

// Solution 2: With the use of hash table
func anagramWithDict(s1: String, s2: String) -> Bool{
	
	let trimmedS1 = Array(s1.stringByReplacingOccurrencesOfString(" ", withString: "").lowercaseString.characters)
	let trimmedS2 = Array(s2.stringByReplacingOccurrencesOfString(" ", withString: "").lowercaseString.characters)
	
	if(trimmedS1.count != trimmedS2.count){
		return false
	}
	
	var counter = [Character: Int]()
	
	// Add up the counter
	for letter in trimmedS1{
		counter[letter] = counter[letter] == nil ? 1 : counter[letter]! + 1
	}
	
	// Subtract the counter
	for letter in trimmedS2{
		counter[letter] = counter[letter] == nil ? 1 : counter[letter]! - 1
	}
	
	// If we have an anagram case, then every value in the counter should be 0.
	for (_, value) in counter{
		if value != 0 {
			return false
		}
	}
	
	return true
}

anagramWithDict("qwertyuiop", s2: "poiuywterq")
