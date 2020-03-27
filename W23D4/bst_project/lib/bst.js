class TreeNode {
    constructor(val) {
        this.val = val;
        this.left = null;
        this.right = null;
    }
}


class BST {
   constructor() {
       this.root = null;
   }

   insert(val, root=this.root) {
       if (!this.root) {
           this.root = new TreeNode(val);
           return;
       }
       
       if (val < root.val) {
           if (!root.left) {
               root.left = new TreeNode(val);
           } else {
               this.insert(val, root.left);
           }
       } else {
           if (!root.right) {
               root.right = new TreeNode(val);
           } else {
               this.insert(val, root.right);
           }
       }
   }

   searchRecur(val, root=this.root) {
       if (!this.root) {
           return false;
       }
       if (!root) {
           return false;
       } else if (val < root.val) {
           return this.searchRecur(val, root.left);
       } else if (val > root.val) {
           return this.searchRecur(val, root.right);
       } else {
           return true;
       }
   }

   searchIter(val) {
       if (!this.root) {
           return false;
       }

       let queue = [ this.root ];
       while(queue.length) {
           let node = queue.shift();
           if (node.val === val) return true;
           if (node.left && val < node.val) queue.push(node.left);
           if (node.right && val > node.val) queue.push(node.right);
       }
       
       return false;
   }
}

module.exports = {
    TreeNode,
    BST
};