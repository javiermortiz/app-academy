import React from 'react'

class TodoListItem extends React.Component {
    constructor(props) {
        super(props);

        this.render= this.render.bind(this);
    }

    render() {
        return (
            <li>
                {this.props.todo.title}
            </li>
        )
    }
}

export default TodoListItem;