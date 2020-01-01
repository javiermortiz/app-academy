function range (start, end) {  // arr = [1]  arr = [2]  arr = []
  const arr = [];
  if (start === end) {
    return arr;
  } else {
    arr.push(start)
    return arr.concat(range(start + 1, end));
  }
}

// console.log(range(1,5));

function sumRec (numsArr) {
    if (numsArr.length === 0) {
        return 0;
    }
    return sumRec(numsArr.slice(1,numsArr.length)) + numsArr[0];
};

// const arr = [1,2,3,4,5];
// console.log(sumRec(arr));

function exponent (base, exp) {
    if (exp === 0) {
        return 1;
    }
    return base * exponent(base, exp - 1);
};

// console.log(exponent(2, 4));

function exponent2 (base, exp) {
    if (exp === 0) {
        return 1;
    }
    if (exp % 2 === 0) {
        return exponent2(base, exp / 2) ** 2;
    } else {
        return base * exponent2(base, (exp - 1) / 2) ** 2;
    }
};

// console.log(exponent2(2, 5));

function fibonacci(n) {
  if (n === 1) {
    return [1];
  } else if (n === 2) {
    return [1, 1];
  } 
  previousFibo = fibonacci(n - 1)
  return previousFibo.concat(previousFibo[previousFibo.length - 1] + previousFibo[previousFibo.length - 2])

}
console.log(fibonacci(5));