// View the full problem and run the test cases at:
//  https://leetcode.com/problems/balanced-binary-tree/


function getHeight(root) {
    if (!root) return -1;
    return 1 + Math.max(getHeight(root.left), getHeight(root.right));
}

var isBalanced = function (root) {
    if (!root) return true;
    let leftHeight = getHeight(root.left);
    let rightHeight = getHeight(root.right);

    let diff = Math.abs(leftHeight - rightHeight) <= 1;
    return diff && isBalanced(root.left) && isBalanced(root.right);
};