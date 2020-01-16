import React from 'react';
import TodoListItem from './todo_list_item'
import TodoForm from './todo_form';

class TodoList extends React.Component{
    constructor(props) {
        super(props)
        this.renderTodoItem = this.renderTodoItem.bind(this);
        this.render = this.render.bind(this);
    }

    renderTodoItem () {
        return this.props.todos.map((todo, idx) => {
            return (
                <TodoListItem key={ idx } todo={todo} />
            )
        })
    }

    render() {
        return (
            <div>
                <ul>{ this.renderTodoItem() }</ul>
                <TodoForm dispatchReceiveTodo={this.props.dispatchReceiveTodo}/>
            </div>
        )
    }
}

export default TodoList;