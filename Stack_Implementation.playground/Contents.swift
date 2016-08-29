//: Playground - noun: a place where people can play

import UIKit

// Stack should be last in first out, which means the last item pushed to the stack 
// should be the first item processed
class Stack {
	
	var items:[AnyObject]
	
	init(){
		self.items = []
	}
	
	func isEmpty() -> Bool{
		return self.items.count == 0
	}
	
	func push(item: AnyObject){
		self.items.append(item)
	}
	
	func pop() -> AnyObject {
		return self.items.removeLast()
	}
	
	func peek() -> AnyObject? {
		
		guard let lastObject = self.items.last else { return nil }
		return lastObject
	}
	
	func size() -> Int {
		return self.items.count
	}
}

let stack = Stack()

stack.push("I am item 1")
stack.push("I am item 2")
stack.push("I am item 3")


stack.pop()
stack.peek()
stack.isEmpty()
stack.size()


