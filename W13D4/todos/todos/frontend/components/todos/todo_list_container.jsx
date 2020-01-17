import { connect } from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import React from 'react';
import { fetchTodos, createTodo } from '../../actions/todo_actions';

function mapStateToProps (state) {
    return {
        todos: allTodos(state)
    }
}

function mapDispatchToProps (dispatch) {
    return {
        dispatchFetchTodos: () => dispatch(fetchTodos()),
        dispatchCreateTodo: (todo) => dispatch(createTodo(todo)),
        dispatchReceiveTodo: (todo) => dispatch(receiveTodo(todo))
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);