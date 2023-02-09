import <tasks.ash>;

boolean task_list (int task_number) {
    boolean retval = false;

    // To add more tasks, just mimic case 1
    // Create a boolean task function in tasks.ash
    // Then add another case here where the retval is the task you want to execute
    switch (task_number) {
        case 1: 
            retval = task_1();
            break;
        case 2:
            retval = task_2();
            break;
        default:
            print("We tried to run a task that didn't exist!", "red");
            retval = false;
            break;
    }
    return retval;
}