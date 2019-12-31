Array.prototype.uniq = function() {
    let unique = [];
    for (let i = 0; i < this.length; i++) {
        if (!unique.includes(this[i])) {
            unique.push(this[i])
        }
    }
    return unique;
}

Array.prototype.twoSum = function () {
  let result = [];
  for (let i = 0; i < this.length-1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i, j]);
      }
    }
  }
  return result;
}

Array.prototype.transpose = function () {
    let transArr = [];
    for (let i = 0; i < this[0].length; i++) { 
        let sub = [];
        for (let j = 0; j < this.length; j++) {
            sub.push(this[j][i]);
        }
        transArr.push(sub);
    }
    return transArr;
}

// let arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
// console.log([[1, 2, 3], [4, 5, 6], [7, 8, 9]].transpose());
//  => [[1,4], [2,5], [3,6]]

