import {RECEIVE_TODOS, RECEIVE_TODO} from '../actions/todo_actions'
import todo_actions from '../actions/todo_actions'
// import selectors from './selectors'
// reducers/todos_reducer.js
// const initialState = {
//     1: {
//       id: 1,
//       title: "wash car",
//       body: "with soap",
//       done: false
//     },
//     2: {
//       id: 2,
//       title: "wash dog",
//       body: "with shampoo",
//       done: true
//     }
//   };

const todosReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_TODOS:  // {2: {id: 2, title: "wash dog",body: "with shampoo", done: true}, {id: 2, title: "wash dog",body: "with shampoo", done: true}]
            const newTodos = {}
            action.todos.forEach(todo => {
                newTodos[todo.id] = todo;
            });
            return newTodos;
        case RECEIVE_TODO:
            return Object.assign({}, state, {[action.todo.id]: action.todo})
        default:
            return state;
    }
};

export default todosReducer;