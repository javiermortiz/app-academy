Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
};

function callback(el) {
    console.log(el * 2);
}

const arr = [1, 2, 3];

// console.log(arr.myEach(callback));

Array.prototype.myMap = function(callback) {
  const newArr = [];

  this.myEach(function(el) { 
      newArr.push(callback(el))
  });
  return newArr;
};

// console.log(arr.myMap(callback)); 

Array.prototype.myReduce = function(callback, initialVal) {
    let arr = this
    if (initialVal === undefined) {
        initialVal = arr[0];
        arr = arr.slice(1);
    } 
    arr.myEach(function (el) {
        initialVal = callback(initialVal, el);
    });
    return initialVal;
};


console.log([1, 2, 3].myReduce(function (acc, el) {
  return acc + el;
}, 25))

console.log([1, 2, 3].myReduce(function (acc, el) {
  return acc + el;
}));
