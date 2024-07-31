class API {
  static const BASE_URL = "https://constructionmate-backend.onrender.com";
  static const ADD_PROJECT_URL = "$BASE_URL/Project/AddProject";
  static const GET_PROJECT_URL = "$BASE_URL/Project/GetProject";
  static const ADD_BUILDING_URL = "$BASE_URL/Building/AddBuilding";
  static const GET_BUILDING_BY_ID_URL = "$BASE_URL/Project/GetProjectBuildings";
  static const GET_ALL_WORK_TYPES = "$BASE_URL/WorkType/GetWorkType";
  static const GET_AGENCY_BY_WORK_TYPE = "$BASE_URL/Agency/GetAgency";
  static const GET_FLOORS_BY_WORK_TYPE =
      "$BASE_URL/Floor/GetSelectedStatusOfFloors";
  static const ADD_TASK_URL = "$BASE_URL/Floor/AddTask";
  static const GET_AGENCY_BY_BUILDING_ID = "$BASE_URL/Task/GetTask";
  static const ADD_PAYMENT_OUT = "$BASE_URL/Transaction/AddTransaction";
  static const GET_ALL_TRANSACTION_BY_PROJECT_ID =
      "$BASE_URL/Transaction/GetTransactionByProject";
  static const GET_AGENCY_WORKING_IN_BUILDING_ID =
      "$BASE_URL/Building/GetBuildingTask";
  static const GET_FLOORS = "$BASE_URL/Floor/GetFloor";
  static const SITE_PROGRESS_UPDATE_AGENCY =
      "$BASE_URL/Floor/UpdateSiteProgress";
  static const GET_FLOOR_BY_FLOOR_INDEX =
      "$BASE_URL/Floor/GetFloorByFloorIndex";
  static const GET_AGENCY_FOR_DROPDOWN = "$BASE_URL/Agency/GetAgencyByBuilding";
  static const GET_TOTAL_AGENCIES = "$BASE_URL/Agency/GetAgency";
  static const GET_TRANSACTOIN_BY_AGENCY_ID = "$BASE_URL/Transaction/GetTransactionByAgency";
  static const GET_AGENCY_BY_PROJECT = "$BASE_URL/Agency/GetAgencyByProject";
  static const ADD_WORK_TYPE = "$BASE_URL/Worktype/AddWorktype";
  static const ADD_AGENCY = "$BASE_URL/Agency/AddAgency";
  static const GET_TOTAL_PAYMENT_OUT = "$BASE_URL/Project/GetPayOut";
  static const GET_TOTAL_PAYMENT_OUT_PROJECT = "$BASE_URL/Project/GetPayOut";
}
