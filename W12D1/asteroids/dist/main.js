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

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\")\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\n\nconst defaults = {\n    COLOR: \"blue\",\n    RADIUS: 20,\n    POS: [30, 30],\n    SPEED: 1\n}\n\nfunction Asteroid(options) {   //{ pos: [30, 30] } \n    if (!options) {\n    options = {}; \n    }\n    options[\"game\"] = options[\"game\"];\n    options[\"pos\"] = options[\"pos\"] || defaults.POS; // { pos: [30, 30], radius: something }   [[30,30], something]\n    options[\"vel\"] = options[\"vel\"] || Util.randomVec(defaults.SPEED);\n    options[\"radius\"] = options[\"radius\"] || defaults.RADIUS;\n    options[\"color\"] = options[\"color\"] || defaults.COLOR;\n    MovingObject.call(this, options);\n};\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\n\n\nconst gameDefault = {\n    DIM_X: 500,\n    DIM_Y: 500,\n    NUM_ASTEROIDS: 4\n}\n\nfunction Game () {\n    this.addAsteroids();\n};\n\nGame.prototype.randomPosition = function () {    // Math.floor((Math.random() * 100) + 1);\n    let x = Math.floor((Math.random() * gameDefault.DIM_X) + 1);\n    let y = Math.floor((Math.random() * gameDefault.DIM_Y) + 1);\n    return [x, y];\n};\n\nGame.prototype.addAsteroids = function () {\n    this.asteroids = [];\n    for (let i = 0; i < gameDefault.NUM_ASTEROIDS; i++){\n        this.asteroids.push(new Asteroid({\"pos\": this.randomPosition(), \"game\": this}))\n    }\n};\n\nGame.prototype.draw = function(ctx){\n    ctx.clearRect(0, 0, gameDefault.DIM_X, gameDefault.DIM_Y);\n    this.asteroids.forEach(function (asteroid) {\n        asteroid.draw(ctx);\n    })\n};\n\nGame.prototype.moveObjects = function(){\n    this.asteroids.forEach(function (asteroid) {\n        asteroid.move();\n    })\n}\n\nGame.prototype.wrap = function (pos){\n    if (pos[0] > gameDefault.DIM_X){\n        pos[0] = pos[0] % gameDefault.DIM_X;\n    }else if (pos[0] < 0){\n        pos[0] += gameDefault.DIM_X;\n    }\n\n    if (pos[1] > gameDefault.DIM_Y) {\n        pos[1] = pos[1] % gameDefault.DIM_Y;\n    } else if (pos[1] < 0) {\n        pos[1] += gameDefault.DIM_Y;\n    }\n    return pos;\n};\n\nGame.prototype.checkCollisions = function () {\n    for (let i = 0; i < this.asteroids.length-1; i++){  // [1, 2, 3]\n        for (let j = i+1; j < this.asteroids.length; j++){\n            if (this.asteroids[i].isCollideWith(this.asteroids[j])){\n                alert(\"COLLISION! BOOM!\");\n            }\n        }\n    }\n};\n\nGame.prototype.step = function(){\n    this.moveObjects();\n    this.checkCollisions();\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView (ctx) {\n    this.game = new Game();\n    this.ctx = ctx;\n};\n\nGameView.prototype.start = function () {\n    let that = this;\n    setInterval(function(){\n        that.game.step();\n        that.game.draw(this.ctx);\n    }, 20)\n};\n\nmodule.exports = GameView;\n\n\n\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("console.log(\"Webpack is working!\");\n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nwindow.MovingObject = MovingObject;\n\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nwindow.Asteroid = Asteroid;\n\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nwindow.Game = Game;\n\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\nwindow.GameView = GameView;\n\ndocument.addEventListener(\"DOMContentLoaded\", function() {\n    const canvas = document.getElementById(\"game-canvas\");\n    const ctx = canvas.getContext(\"2d\");\n    window.ctx = ctx;\n    const gameView = new GameView(ctx);\n    gameView.start();\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options){\n    this.pos = options[\"pos\"]; // this.pos = [x, y]\n    this.vel = options[\"vel\"];\n    this.radius = options[\"radius\"];\n    this.color = options[\"color\"];\n    this.game = options[\"game\"];\n}\n\nMovingObject.prototype.draw = function(ctx){\n    ctx.beginPath();\n    ctx.arc(this.pos[0],this.pos[1],this.radius,0,2*Math.PI,true);\n    ctx.strokeStyle = this.color;\n    ctx.stroke();\n};\n\nMovingObject.prototype.move = function(){\n    this.pos[0] += this.vel[0]; // [x, y]\n    this.pos[1] += this.vel[1];\n    [this.pos[0], this.pos[1]] = this.game.wrap(this.pos);\n\n}\n\nMovingObject.prototype.isCollideWith = function (otherObject) {\n    //if the distance between their center points is less than the sum of their radii.\n    //Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)\n    let distance = Math.sqrt((this.pos[0] - otherObject.pos[0])**2 + (this.pos[1] - otherObject.pos[1])**2);\n    if (distance < (this.radius + otherObject.radius)) {\n        return true; \n    } else {\n        return false;\n    }\n};\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        function Surrogate () {};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n    \n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n   \n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });