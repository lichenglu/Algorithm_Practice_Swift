//: Playground - noun: a place where people can play

import UIKit

// Solution 1: My initial solution
func pairSum1(arr: [Int], sumNum: Int) -> Int{
	var resultArr = [(Int,Int)]()
	for (index, number) in arr.enumerate(){
		let partner = sumNum - number
		let pair = (number, partner)
		let reversedPair = (partner, number)
		
		var hasAlreadyConatined = false
		var containedReversedPair = false
		
		hasAlreadyConatined = resultArr.contains({ (numPair) -> Bool in
			return numPair == pair
		})
		
		containedReversedPair = resultArr.contains({ (numPair) -> Bool in
			return numPair == reversedPair
		})
		
		if(arr.contains(partner) && !hasAlreadyConatined && !containedReversedPair){
			let partnerIdx = arr.indexOf(partner)
			if(partnerIdx == index){
				continue
			}
			resultArr.append(pair)
		}else{
			continue
		}
	}
	
	print(resultArr)
	return resultArr.count
}

let testArr = [1,9,2,8,3,7,4,6,5,5,13,14,11,13,-1,131,2,54,1,7,124,7,134,8,759,89,2]

pairSum1(testArr, sumNum: 10)

// Solution 2: Inspired by udemy course
func pairSum2(arr: [Int], sumNum: Int) -> Int{
	
	var seen = Set<Int>()
	let outPut = NSMutableSet()
	
	for number in arr {
		
		let partner = sumNum - number
		let pair = [min(number, partner), max(number, partner)]
		
		seen.insert(number)
		
		if(seen.contains(partner)){
			outPut.addObject(pair)
		}
	}

	return outPut.count
}

pairSum2(testArr, sumNum: 10)





