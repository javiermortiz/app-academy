import { connect } from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import React from 'react';

function mapStateToProps (state) {
    return {
        todos: allTodos(state)
    }
}

function mapDispatchToProps (dispatch) {
    return {
        dispatchReceiveTodo: (todo) => dispatch(receiveTodo(todo))
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);