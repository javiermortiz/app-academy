// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// TODO: Implement a Linked List Node class here
class Node {
    constructor(val) {
        this.value = val;
        this.next = null;
    }

}

// TODO: Implement a Singly Linked List class here
class LinkedList {
    constructor() {
        this.head = null;
        this.tail = null;
        this.length = 0;
    }

    // TODO: Implement the addToTail method here
    addToTail(val) {
        const nextNode = new Node(val);
        if (!this.head) {
            this.head = nextNode;
        } else {
            this.tail.next = nextNode;
        }
        
        this.tail = nextNode;
        this.length++;
        return this;
    }

    // TODO: Implement the removeTail method here
    removeTail() {
        if (!this.head) return undefined;
        let current = this.head;
        let tail = current;
        while(current.next) {
            tail = current;
            current = current.next;
        }
        this.tail = tail;
        this.tail.next = null;
        this.length--;
        if (this.length === 0) {
            this.head = null;
            this.tail = null;
        }
        return current;

    }

    // TODO: Implement the addToHead method here
    addToHead(val) {
        let newHead = new Node(val);
        if (!this.head) {
            this.head = newHead;
            this.tail = newHead;
        } else {
            newHead.next = this.head;
            this.head = newHead;
        }
        this.length++;
        return this;
    }

    // TODO: Implement the removeHead method here
    removeHead() {
        if (this.length === 0) return undefined;
        let newHead = this.head.next;
        let removedHead = this.head;
        this.head = newHead;
        this.length--;
        if(this.length === 0) {
            this.head = null;
            this.tail = null;
        }
        return removedHead;
    }

    // TODO: Implement the contains method here
    contains(target) {
        let node = this.head;
        while(node) {
            if(node.value === target) return true;
            node = node.next;
        }
        return false;
    }

    // TODO: Implement the get method here
    get(index) {
        if (index > this.length) return null;
        let target = this.head;
        for(let i = 0; i < index; i++) {
            target = target.next;
        }
        return target;
    }

    // TODO: Implement the set method here
    set(index, val) {
        let target = this.get(index);
        if (!target) return false;
        target.value = val;
        return true;
    }

    // TODO: Implement the insert method here
    insert(index, val) {
        if (index >= this.length) return false;
        let target = this.get(index - 1);
        let current = new Node(val);
        current.next = target.next;
        target.next = current;
        this.length++;
        return true;
    }

    // TODO: Implement the remove method here
    remove(index) {
        if (index < 0 || index >= this.length) return undefined;
        let beforeTarget = this.get(index - 1);
        let target = this.get(index);
        beforeTarget.next = target.next;
        this.length--;
        return target;
    }

    // TODO: Implement the size method here
    size() {
        return this.length;
    }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
