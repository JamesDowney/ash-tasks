// This just logs the task number and task name at the start of a task
void task_attempt(int task_number, string task_name) {
    print("Attempting Task " + task_number + " - " + task_name, "blue");
}

// This will log how long the task took, how many adventures the task took, and if it was successful
boolean task_finish(int task_number, string task_name, int start_time, int start_adventures, boolean success) {
    float time_diff = ((now_to_int() - start_time) / 1000);
    int adventure_diff = start_adventures -  my_adventures();

    if (success) {
        print("Task completed: " + task_number + " - " + task_name + "(" + time_diff + " seconds, " + adventure_diff + " adventures)", "blue");
        return true;
    } else {
        print("Task failed: " + task_number + " - " + task_name + "(" + time_diff + " seconds, " + adventure_diff + " adventures)", "red");
        return false;
    }
}

// You can name tasks whatever you want, the actual position in your task list is going to be determined by task_list.ash
boolean task_1 () {
    // Task logging data
    int start_time = now_to_int();
    int start_adventures = my_adventures();

    // Task data
    int task_number = 1; // For your own sanity, try to keep the task_number the same as it appears in task_list.ash
    string task_name = "Visit Toot Oriole";


    // Task conditional
    boolean complete() {return get_property("questM05Toot") == "finished";}

    // Log start of task
    task_attempt(task_number, task_name);

    // Check task conditional
    if (!complete()) {
        // Execute task steps if false
        visit_url("tutorial.php?action=toot");
    }

    // Log task success or failure and return boolean
    return task_finish(task_number, task_name, start_time, start_adventures, complete());
}

//Here's another example
boolean task_2 () {
    // Task logging data
    int start_time = now_to_int();
    int start_adventures = my_adventures();

    // Task data
    int task_number = 2;
    string task_name = "Use Letter from Ralph";


    // Task conditional
    boolean complete() {return available_amount($item[Letter From King Ralph XI]) == 0;}

    // Log start of task
    task_attempt(task_number, task_name);

    // Check task conditional
    if (!complete()) {
        // Execute task steps if false
        use($item[Letter From King Ralph XI]);
    }

    // Log task success or failure and return boolean
    return task_finish(task_number, task_name, start_time, start_adventures, complete());
}