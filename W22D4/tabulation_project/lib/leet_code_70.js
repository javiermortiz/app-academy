// Work through this problem on https://leetcode.com/problems/climbing-stairs/ and use the specs given there.
// Feel free to use this file for scratch work.

var climbStairs = function (n) {
    let table = new Array(n + 1);
    table[0] = 1;
    table[1] = 1;
    table[2] = 2;

    for (let i = 3; i < table.length; i++) {
        table[i] = table[i - 1] + table[i - 2];
    }

    return table[table.length - 1];
};