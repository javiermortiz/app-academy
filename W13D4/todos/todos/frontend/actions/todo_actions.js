import * as APIUtil from '../util/todo_api_util';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodos = (todos) => ({
    type: RECEIVE_TODOS,
    todos: todos
})

export const receiveTodo = (todo) => ({
    type: RECEIVE_TODO,
    todo: todo
});

export const fetchTodos = (dispatch, state) => {
    return (dispatch) => {
        APIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
    }
;}

export const createTodo = (todo) => {
    return (dispatch) => {
        return APIUtil.createTodo(todo).then(todo => dispatch(receiveTodo(todo)))
    }
}

window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.fetchTodos = fetchTodos;
// export default todoActions

