import <example_task_script/task_list.ash>;

string task_property_name = "task_property"; // Use something script-specific, not task_property_name = "task_property"

// Gets the task property and returns it as an int - sets it to 1 if it doesn't exist yet
int parse_task () {
    string task = get_property(task_property_name);
    if (task == "") {
        set_property(task_property_name, "1");
    }
    return task.to_int();
}

// This checks the switch statement in task_list.ash for the task that matches your task property's value
// The switch statement will execute the task that matches that value and return true if successful or false if unsuccessful
// If it returns false, this will prevent the next task from executing
boolean run_next_task () {
    return (task_list(parse_task()));
}

// After a task runs successfully, increment the task property
void increment_task() {
    set_property(task_property_name, (parse_task() + 1).to_string());
}

void main () {
    int goal = 3; // Set this to one higher than the value of your final task. When reached, the while loop will end

    // While the task property is less than the goal, we'll attempt to complete the next task
    // If we successfully complete the next task then we'll increment the task property and go again
    while (parse_task() < goal && run_next_task()) { // Maybe add some checks like (my_adventures() > 0 && my_inebriety() < inebriety_limit())
        increment_task();
    }
}