function sum() {
  let result = 0;
  const args = Array.from(arguments);
  args.forEach(ele => {
    result += ele
  });
  return result;
}

function sum2(...args) {
  let result = 0;
  args.forEach(ele => {
      result += ele
  });
  return result;
}

Function.prototype.myBind = function(context) {
  const bindArgs = Array.from(arguments).slice(1);
  const that = this;
  return function () {
    // console.log(`${JSON.stringify(Array.from(arguments))}`);
    that.apply(context, bindArgs.concat(Array.from(arguments)));
  }
}

Function.prototype.myBind2 = function (context, ...bindArgs) {
   return (...callArgs) => { this.apply(context, bindArgs.concat(callArgs))}
}

Function.prototype.curry = function(numArgs) {
  const args = [];
  const that = this;
  function _curriedSum(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return that(...args);
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

function curriedSum (numArgs) {
    const args = [];
    let total = 0;
    function _curriedSum(arg) {
        args.push(arg);
        if (args.length === numArgs) {
            args.forEach(num => { total += num });
            return total;
        } else {
            return _curriedSum;
        }
    }
    return _curriedSum;
}

// console.log(`${curriedSum(3)(4)(20)(6)}`);

Function.prototype.curry2 = function (numArgs) {
    const args = [];
    const that = this;
    function _curriedSum(arg) {
        args.push(arg);
        if (args.length === numArgs) {
            return that.apply(null, args);
        } else {
            return _curriedSum;
        }
    }
    return _curriedSum;
}

Function.prototype.curry3 = function (numArgs) {
    const args = [];
    const that = this;
    function _curriedSum(arg) {
        args.push(arg);
        if (args.length === numArgs) {
            return that(...args);
        } else {
            return _curriedSum;
        }
    }
    return _curriedSum;
}

// function sumThree(num1, num2, num3) {
//     return num1 + num2 + num3;
// }

// console.log(`${sumThree.curry3(3)(4)(20)(6)}`);