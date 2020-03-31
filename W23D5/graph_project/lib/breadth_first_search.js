function breadthFirstSearch(startingNode, targetVal) {
    let queue = [ startingNode ];
    let visited = [];

    while (queue.length) {
        let node = queue.shift();
        visited.push(node);
        if (node.val === targetVal) return node;
        node.neighbors.forEach(neighbor => {
            if (!visited.includes(neighbor)) queue.push(neighbor);
        })
    }

    return null;
}

module.exports = {
    breadthFirstSearch
};