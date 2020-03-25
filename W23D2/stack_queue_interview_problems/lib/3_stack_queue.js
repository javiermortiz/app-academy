// ============================================================================
// Interview Problem: StackQueue
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement your preferred Stack implementation, including the methods:
//
//   - Push 
//   - Pop 
//   - Size
//
// Then, implement a Queue by instantiating two Stack instances for storage.
//
// The StackQueue implementation should include the following methods:
//
//   - Enqueue
//   - Dequeue
//   - Size
//
// -----------
// Let's code!
// -----------

class Node {
    // TODO: Implement the Node class!
    constructor(val) {
        this.value = val;
        this.next = null;
    }
}

class Stack {
    // TODO: Implement the Stack class!
    constructor() {
        this.top = null;
        this.bottom = null;
        this.length = 0;
    }

    push(node) {
        if (this.length === 0) {
            this.top = node;
            this.bottom = node;
        } else {
            node.next = this.top;
            this.top = node;
        }

        this.length++;
        return this.length;
    }

    pop() {
        let node;
        if (this.length === 0) {
            return null;
        } else if(this.length === 1) {
            node = this.top;
            this.top = null;
            this.bottom = null;
        } else if(this.length === 2){
            node = this.top;
            this.top = this.top.next;
            this.bottom = this.top;
        } else {
            node = this.top;
            this.top = node.next;
        }

        this.length--;
        return node;
    }

    size() {
        return this.length;
    }
}

class StackQueue {
    // TODO: Implement the StackQueue class!
    constructor() {
        this.inStack = new Stack();
        this.outStack = new Stack();
        this.front = null;
        this.back = null;
    }

    enqueue(val) {
        const newQueueNode = new Node(val);
        if (!this.front) {
            this.front = newQueueNode;
            this.back = newQueueNode;
        } else {
            this.back.next = newQueueNode;
            this.back = newQueueNode;
        }

        this.inStack.push(new Node(newQueueNode.value));
        return this.size();
    }

    dequeue() {
        if (!this.front) {
            return null;
        } else if (this.size() === 1) {
            this.front = null;
            this.back = null;
        } else {
            this.front = this.front.next;
        }

        if (this.outStack.size() === 0) {
            while (this.inStack.size() > 0) {
                this.outStack.push(this.inStack.pop());
            }
        }
        let x = this.outStack.pop();
        return x;
    }

    size() {
        return this.inStack.size() + this.outStack.size();
    }
};

exports.Node = Node;
exports.Stack = Stack;
exports.StackQueue = StackQueue;
