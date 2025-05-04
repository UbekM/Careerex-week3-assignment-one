// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ToDo {
    enum Status { Pending, InProgress, Completed }

    struct Todo {
        uint id;
        string content;
        Status status;
    }

    mapping(uint => Todo) public todos;
    uint[] public todoIds;
    uint private nextId = 1;

    event TodoAdded(uint id, string content);

    function addTodo(string memory _content) public {
        todos[nextId] = Todo(nextId, _content, Status.Pending);
        todoIds.push(nextId);
        emit TodoAdded(nextId, _content);
        nextId++;
    }

    function updateStatus(uint _id, Status _status) public {
        require(_id > 0 && _id < nextId, "Invalid ID");
        todos[_id].status = _status;
    }

    function getTodo(uint _id) public view returns (uint, string memory, Status) {
        require(_id > 0 && _id < nextId, "Invalid ID");
        Todo memory todo = todos[_id];
        return (todo.id, todo.content, todo.status);
    }
}
