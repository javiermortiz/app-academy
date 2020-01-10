class DOMNodeCollection {
    constructor(htmlArray){
        this.htmlArray = htmlArray;
        this.html()
    }

    html(string){
        if(!string){
            return this.htmlArray[0].innerHTML;
        }else{
            this.htmlArray.forEach(el => {
                el.innerHTML = string;  
            })
            return this.html();
        }

    }

    empty () {
        this.htmlArray.forEach(el => {
            el.innerHTML = "";
        })
    }
    
    append (arg) { 
        if (typeof arg === "string") {
            this.htmlArray.forEach(htmlEl => {
                htmlEl.innerHTML += arg;
            })
        } else {
        arg.forEach(el => {
           this.htmlArray.forEach(htmlEl => {
                htmlEl.innerHTML += el.outerHTML;
           })
        })
        }
    }

    attr(key, val){
        this.htmlArray.forEach(el =>{
            el.setAttribute(key, val);
        })
    }

    addClass (className) {
        this.htmlArray.forEach(el => {
            el.setAttribute("class",className)
        })
    }
    removeClass(arg) {
        this.htmlArray.forEach(el =>{
            el.removeAttribute("class")
        });
    }

    children(){
        const array = [];
        this.htmlArray.forEach(el=>{
            array.push(el.children);
        })
        return new DOMNodeCollection(array);
    }

    parent () {
        const array = [];
        this.htmlArray.forEach(el => {
            array.push(el.parentNode);
        })
        return new DOMNodeCollection(array);
    }

    find (arg) {
        const array = [];
        this.htmlArray.forEach(el => {
            array.push(el.querySelectorAll(arg))
        })
        return new DOMNodeCollection(array);
    }

    remove () {
        this.htmlArray.forEach(el => {
            el.parentNode.removeChild(el);
        })
    }

    on(event, callback){
        this.htmlArray.forEach(el =>{
            el.addEventListener(event, callback);
            el.fnc = callback;
        })
    }

    off(event) {
        this.htmlArray.forEach(el=> {
            el.removeEventListener(event, el.fnc);
        })
    }
}

DOMNodeCollection.myMethod = function () {
    console.log("Class Method!")
}
module.exports = DOMNodeCollection;