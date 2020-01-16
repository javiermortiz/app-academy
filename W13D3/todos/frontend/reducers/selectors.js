
function allTodos(state) {
    return Object.keys(state.todos).map((key) => {
        return state.todos[key]
    })
}

// window.allTodos = allTodos

export default allTodos; 