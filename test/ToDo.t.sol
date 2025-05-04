// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ToDo.sol";

contract ToDoTest is Test {
    ToDo public todo;

    function setUp() public {
        todo = new ToDo();
    }

    function testAddTodo() public {
        todo.addTodo("Learn Solidity");

        (uint id, string memory content, ToDo.Status status) = todo.getTodo(1);

        assertEq(id, 1);
        assertEq(content, "Learn Solidity");
        assertEq(uint(status), uint(ToDo.Status.Pending));
    }

    function testUpdateStatus() public {
        todo.addTodo("Test the update");

        todo.updateStatus(1, ToDo.Status.Completed);

        (, , ToDo.Status status) = todo.getTodo(1);
        assertEq(uint(status), uint(ToDo.Status.Completed));
    }
}
