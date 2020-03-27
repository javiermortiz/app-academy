// View the full problem and run the test cases at:
//  https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/


var sortedArrayToBST = function (nums) {
    if (!nums.length) return null;

    let middleIdx = Math.floor(nums.length / 2);
    let node = new TreeNode(nums[middleIdx]);
    node.left = sortedArrayToBST(nums.slice(0, middleIdx));
    node.right = sortedArrayToBST(nums.slice(middleIdx + 1));

    return node;
};