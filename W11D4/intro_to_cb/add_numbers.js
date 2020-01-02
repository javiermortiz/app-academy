const readline = require('readline');

const reader = readline.createInterface ({
    input: process.stdin,
    output: process.stdout
});

function addNumbers (sum, numsLeft, completionCB) {
    if (numsLeft > 0) {
        reader.question("Add a number ", function (answer) {
            sum += parseInt(answer)
            console.log(`current total: ${sum}`)
            addNumbers(sum, numsLeft - 1, completionCB)
        });
    } else if (numsLeft === 0){
        completionCB(sum);
        reader.close();
    }
};

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));