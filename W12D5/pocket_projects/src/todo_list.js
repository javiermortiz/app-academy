const todos = JSON.parse(localStorage.getItem("todos")) || [];
const todoUl = document.querySelectorAll(".todos")[0];
const todoForm = document.querySelectorAll(".add-todo-form")[0];

function addTodo (e) {
    e.preventDefault();
    const input = document.getElementsByName("add-todo")[0];
    const inputVal = input.value;
    const newTodo = {
        inputVal,
        done: false
    }
    todos.push(newTodo);
    localStorage.setItem("todos", JSON.stringify(todos));
    input.value = "";
    populateList(todos);
};

function populateList (todos) {
    const todoList = todos.map((item, i) => {
        return `
            <li>
                <label for="my-box">${item.inputVal}</label>
                 <input id="my-box" type="checkbox" ${item.done ? "checked" : ""} data-index=${i}>
            </li>
        `
    })
    // todoList.forEach(el => todoUl.innerHTML = el);
    todoUl.innerHTML = todoList.join("");
};

function done (e) {
    const li = e.target;
    const i = li.dataset.index
    todos[i].done = !todos[i].done; 
    localStorage.setItem("todos", JSON.stringify(todos));
    populateList(todos)
};

todoForm.addEventListener("submit", addTodo);
todoUl.addEventListener("click", done);
populateList(todos);
