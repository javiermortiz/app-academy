const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function askIfGreaterThan (el1, el2, callback) {
    reader.question(`is ${el1} > ${el2}?`, function(answer){
        if (answer === "yes") {
            callback(true)
        } else {
            callback(false)
        }
    })
}

// askIfGreaterThan(2, 1, function (boolean) {
//     if (boolean) {
//         console.log("True")
//     } else {
//         console.log("False")
//     }
// })

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if (i < arr.length - 1) {
        askIfGreaterThan(arr[i], arr[i+1], function (isGreaterThan){
            if (isGreaterThan) {
                [arr[i], arr[i+1]] = [arr[i+1], arr[i]]
                // console.log(arr)
                madeAnySwaps = true;
            }
            innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop)
        })
    } else if (i === (arr.length - 1)) {
        console.log(arr);
        outerBubbleSortLoop(madeAnySwaps);
    }
}

// function outerBubbleSortLoop(madeAnySwaps){
//     console.log("in outer bubble sort");
// }

// innerBubbleSortLoop([3,2,1], 0, false, outerBubbleSortLoop);

function absurdBubbleSort (arr, sortCompletionCallback) {
    function outerBubbleSortLoop (madeAnySwaps) {
        if (madeAnySwaps === true) {
            innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop)
        } else {
            sortCompletionCallback(arr)
        }
    }
    outerBubbleSortLoop(true)
}


absurdBubbleSort([3, 2, 1], function (arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
});