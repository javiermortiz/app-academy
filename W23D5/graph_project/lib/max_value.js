function maxValue(node, visited=new Set()) {
    let maxValue = node.val;
    let queue = [ node ];

    while (queue.length) {
        let node = queue.shift();
        visited.add(node);
        if (node.val > maxValue) maxValue = node.val;
        node.neighbors.forEach(neighbor => {
            if (!visited.has(neighbor)) queue.push(neighbor);
        });
    }

    return maxValue;
}

module.exports = {
    maxValue
};