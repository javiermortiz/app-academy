/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n    constructor(htmlArray){\n        this.htmlArray = htmlArray;\n        this.html()\n    }\n\n    html(string){\n        if(!string){\n            return this.htmlArray[0].innerHTML;\n        }else{\n            this.htmlArray.forEach(el => {\n                el.innerHTML = string;  \n            })\n            return this.html();\n        }\n\n    }\n\n    empty () {\n        this.htmlArray.forEach(el => {\n            el.innerHTML = \"\";\n        })\n    }\n\n    append (arg) { \n        if (typeof arg === \"string\") {\n            this.htmlArray.forEach(htmlEl => {\n                htmlEl.innerHTML += arg;\n            })\n        } else {\n        arg.forEach(el => {\n           this.htmlArray.forEach(htmlEl => {\n                htmlEl.innerHTML += el.outerHTML;\n           })\n        })\n        }\n    }\n\n    attr(key, val){\n        this.htmlArray.forEach(el =>{\n            el.setAttribute(key, val);\n        })\n    }\n\n    addClass (className) {\n        this.htmlArray.forEach(el => {\n            el.setAttribute(\"class\",className)\n        })\n    }\n    removeClass(arg) {\n        this.htmlArray.forEach(el =>{\n            el.removeAttribute(\"class\")\n        });\n    }\n\n    children(){\n        const array = [];\n        this.htmlArray.forEach(el=>{\n            array.push(el.children);\n        })\n        return new DOMNodeCollection(array);\n    }\n\n    parent () {\n        const array = [];\n        this.htmlArray.forEach(el => {\n            array.push(el.parentNode);\n        })\n        return new DOMNodeCollection(array);\n    }\n\n    find (arg) {\n        const array = [];\n        this.htmlArray.forEach(el => {\n            array.push(el.querySelectorAll(arg))\n        })\n        return new DOMNodeCollection(array);\n    }\n\n    remove () {\n        this.htmlArray.forEach(el => {\n            el.parentNode.removeChild(el);\n        })\n    }\n\n    on(event, callback){\n        this.htmlArray.forEach(el =>{\n            el.addEventListener(event, callback);\n            el.fnc = callback;\n        })\n    }\n\n    off(event) {\n        this.htmlArray.forEach(el=> {\n            el.removeEventListener(event, el.fnc);\n        })\n    }\n}\n\nDOMNodeCollection.myMethod = function () {\n    console.log(\"Class Method!\")\n}\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\nconst queue = [];\nlet documentReady = false;\n\ndocument.addEventListener(\"DOMContentLoaded\", () => {\n    documentReady = true;\n    for (let i = 0; i < queue.length; i++){\n        queue[i]();\n    }\n})\n\nfunction $l(oneArg){\n\n    if (oneArg instanceof HTMLElement) { \n        return new DOMNodeCollection([oneArg]);\n    } else if (typeof(oneArg) === \"function\"){\n        documentReady ? oneArg() : queue.push(oneArg);\n    } else {\n           let args = document.querySelectorAll(oneArg);\n           return new DOMNodeCollection(Array.from(args));\n    }\n}\n\n$l.extend = function (obj1) {\n    for (let i = 0; i < arguments.length; i ++) {\n        Object.assign(obj1, arguments[i])\n    }\n    return obj1;\n};\n\n$l.ajax = function(options){\n   \n}\n\nwindow.$l = $l;\n\nconst x = function (){ console.log(\"Success!\")};\nwindow.x = x;\n\n$l(x);\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });