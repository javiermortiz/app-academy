const DOMNodeCollection = require("./dom_node_collection");
const queue = [];
let documentReady = false;

document.addEventListener("DOMContentLoaded", () => {
    documentReady = true;
    for (let i = 0; i < queue.length; i++){
        queue[i]();
    }
})

function $l(oneArg){

    if (oneArg instanceof HTMLElement) { 
        return new DOMNodeCollection([oneArg]);
    } else if (typeof(oneArg) === "function"){
        documentReady ? oneArg() : queue.push(oneArg);
    } else {
           let args = document.querySelectorAll(oneArg);
           return new DOMNodeCollection(Array.from(args));
    }
}

$l.extend = function (obj1) {
    for (let i = 0; i < arguments.length; i ++) {
        Object.assign(obj1, arguments[i])
    }
    return obj1;
};

$l.ajax = function(options){
   
}

window.$l = $l;

const x = function (){ console.log("Success!")};
window.x = x;

$l(x);
