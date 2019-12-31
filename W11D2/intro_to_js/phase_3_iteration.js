Array.prototype.bubbleSort = function() {
    let sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 0; i < this.length - 1; i++) {
            if (this[i] > this[i+1]) {
                [this[i], this[i+1]] = [this[i+1], this[i]];
                sorted = false;
            }
        }
    }
    return this;
}

// const arr = [10,7,1,5,9];
// console.log(arr.bubbleSort());

String.prototype.substrings = function() {
    const subs = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j < this.length + 1; j++) {
        console.log(i, j)
        subs.push(this.slice(i,j))
        }
    }
    return subs;
};

const string = "cat";
console.log(string.substrings());