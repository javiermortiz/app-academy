function binarySearch(array, target) {
    if (array.length === 0) return false;
    let middleIdx = Math.floor(array.length / 2);
    if (target < array[middleIdx]) {
        return binarySearch(array.slice(0, middleIdx), target);
    } else if (target > array[middleIdx]) {
        return binarySearch(array.slice(middleIdx + 1), target);
    } else {
        return true;
    }
}

function binarySearchIndex(array, target) {
    if (array.length === 0) return -1;
    let middleIdx = Math.floor(array.length / 2);
    if (target < array[middleIdx]) {
        return binarySearchIndex(array.slice(0, middleIdx), target);
    } else if (target > array[middleIdx]) {
        let result = binarySearchIndex(array.slice(middleIdx + 1), target);
        if (result !== -1) {
            return middleIdx + result + 1;
        } else {
            return result;
        }
    } else {
        return middleIdx;
    }
}


module.exports = {
    binarySearch,
    binarySearchIndex
};