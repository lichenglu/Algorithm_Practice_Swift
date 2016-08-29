//: Playground - noun: a place where people can play

import UIKit

// Solution 1: O(N logN), inspired by udemy course
func findMissingItem(arr1: [Int], arr2: [Int]) -> Int? {
	
	let sortedArr1 = arr1.sort()
	let sortedArr2 = arr2.sort()
	
	// The trick here is to use zip() to merge two arrays into an array of
	// tuples. Then we could iterate through the two arrays with one for loop.
	// When num1 is not equal to num2, this means we have found the missing item, which should be num1 of the original array
	for (num1, num2) in zip(sortedArr1, sortedArr2){
		if num1 != num2{
			return num1
		}
	}
	
	return nil
}


let arr1 = [1,2,3,4,5,6,7]
let arr2 = [3,7,2,1,4,6]

//findMissingItem(arr1, arr2: arr2)

// Solution 2: O(N), with the help of hash table
func findMissingItem2(arr1: [Int], arr2: [Int]) -> Int? {
	
	var seen = [Int: Int]()
	
	for number in arr1 {
		seen[number] = (seen[number] == nil) ? 1 : seen[number]! + 1
	}
	
	for number in arr2 {
		seen[number] = seen[number]! - 1
	}
	
	for (key, value) in seen{
		if value != 0 {
			return key
		}
	}
	
	return nil
}

findMissingItem2(arr1, arr2: arr2)

