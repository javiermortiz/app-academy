function quickSort(array) {
    if(array.length <= 1) return array;

    let pivot = array.shift();
    let leftArr = array.filter(el => el < pivot);
    let rightArr = array.filter(el => el >= pivot);

    let sortedLeft = quickSort(leftArr);
    let sortedRight = quickSort(rightArr);

    return [...sortedLeft, pivot, ...sortedRight];
}


module.exports = {
    quickSort
};