//: Playground - noun: a place where people can play

import UIKit

func largest_continuous_sum(arr: [Int]) -> Int {
	
	if arr.count == 0 {
		return 0
	}
	
	var currentSum = arr.first
	var maxSum = arr.first
	
	for num in arr[1..<arr.count]{
		currentSum = max(currentSum! + num, num)
		maxSum = max(maxSum!, currentSum!)
	}
	
	return maxSum!
}

largest_continuous_sum([1,2,-1,3,4,10,10,-10,-1])