class API {
  static const BASE_URL = "https://constructionmate-backend.onrender.com";
  static const ADD_PROJECT_URL = "$BASE_URL/Project/AddProject";
  static const GET_PROJECT_URL = "$BASE_URL/Project/GetProject";
  static const ADD_BUILDING_URL = "$BASE_URL/Building/AddBuilding";
  static const GET_BUILDING_BY_ID_URL = "$BASE_URL/Project/GetProjectBuildings";
  static const GET_ALL_WORK_TYPES = "$BASE_URL/WorkType/GetWorkType";
  static const GET_AGENCY_BY_WORK_TYPE = "$BASE_URL/Agency/GetAgency";
  static const GET_FLOORS_BY_WORK_TYPE = "$BASE_URL/Task/GetSelectedFloors";
  static const ADD_TASK_URL = "$BASE_URL/Task/AddTask";
  static const GET_AGENCY_BY_BUILDING_ID = "$BASE_URL/Task/GetTask";
}
