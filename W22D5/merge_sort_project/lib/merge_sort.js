function merge(array1, array2) {
    let merged = [];

    while(array1.length || array2.length) {
        let array1El = array1.length ? array1[0] : Infinity;
        let array2El = array2.length ? array2[0] : Infinity;

        let next;
        if (array1El < array2El) {
            next = array1.shift();
        } else {
            next = array2.shift();
        }

        merged.push(next);
    }

    return merged;
}

function mergeSort(array) {
    if(array.length <= 1) return array;

    let middleIdx = Math.floor(array.length / 2);
    let leftArr = array.slice(0, middleIdx);
    let rightArr = array.slice(middleIdx);

    let sortedLeft = mergeSort(leftArr);
    let sortedRight = mergeSort(rightArr);

    return merge(sortedLeft, sortedRight);
}

module.exports = {
    merge,
    mergeSort
};