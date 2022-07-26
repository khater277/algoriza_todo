abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppErrorState extends AppStates {}

class AppOpenDBLoadingState extends AppStates {}

class AppOpenDBState extends AppStates {}

class AppAddTaskLoadingState extends AppStates {}

class AppGetTasksState extends AppStates {}

class AppAddTaskToCompleteState extends AppStates {}

class AppUpdateTaskState extends AppStates {}

class AppChangeSelectedDayIndexState extends AppStates {}

class AppChangeReminderDurationState extends AppStates {}
