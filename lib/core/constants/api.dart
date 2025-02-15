// ignore_for_file: constant_identifier_names

class API {
  static const BASE_URL = "https://constructionmate-backend-one.onrender.com";

  //--------------------------- Project ------------------------------------------------------------------------------------
  static const ADD_PROJECT_URL = "$BASE_URL/Project/AddProject";
  static const GET_PROJECT_URL = "$BASE_URL/Project/GetProject";
  static const UPDATE_PROJECT_URL = "$BASE_URL/Project/UpdateProject";

  //--------------------------- Building ------------------------------------------------------------------------------------
  static const ADD_BUILDING_URL = "$BASE_URL/Building/AddBuilding";
  static const GET_BUILDING_BY_ID_URL = "$BASE_URL/Project/GetProjectBuildings";

  //--------------------------- WorkType ------------------------------------------------------------------------------------
  static const GET_ALL_WORK_TYPES = "$BASE_URL/WorkType/GetWorkType";
  static const GET_AGENCY_BY_WORK_TYPE = "$BASE_URL/Agency/GetAgency";
  static const GET_FLOORS_BY_WORK_TYPE =
      "$BASE_URL/Floor/GetSelectedStatusOfFloors";

  //--------------------------- Tasks ------------------------------------------------------------------------------------
  static const ADD_TASK_URL = "$BASE_URL/Floor/AddTask";
  static const GET_AGENCY_BY_BUILDING_ID = "$BASE_URL/Task/GetTask";

  //--------------------------- Transactions ------------------------------------------------------------------------------------
  static const ADD_PAYMENT_OUT = "$BASE_URL/Transaction/AddTransaction";
  static const GET_ALL_TRANSACTION_BY_PROJECT_ID =
      "$BASE_URL/Transaction/GetTransactionByProject";

  //--------------------------- Progress ------------------------------------------------------------------------------------
  static const GET_AGENCY_WORKING_IN_BUILDING_ID =
      "$BASE_URL/Building/GetBuildingTask";
  static const GET_FLOORS = "$BASE_URL/Floor/GetFloor";
  static const SITE_PROGRESS_UPDATE_AGENCY =
      "$BASE_URL/Floor/UpdateSiteProgress";
  static const GET_FLOOR_BY_FLOOR_INDEX =
      "$BASE_URL/Floor/GetFloorByFloorIndex";

  static const GET_AGENCY_FOR_DROPDOWN = "$BASE_URL/Agency/GetAgencyByBuilding";
  static const GET_TOTAL_AGENCIES = "$BASE_URL/Agency/GetAgency";
  static const GET_TRANSACTOIN_BY_AGENCY_ID =
      "$BASE_URL/Transaction/GetTransactionByAgency";
  static const GET_AGENCY_BY_PROJECT = "$BASE_URL/Agency/GetAgencyByProject";
  static const ADD_WORK_TYPE = "$BASE_URL/Worktype/AddWorktype";
  static const ADD_AGENCY = "$BASE_URL/Agency/AddAgency";
  static const GET_TOTAL_PAYMENT_OUT = "$BASE_URL/Project/GetPayOut";
  static const GET_TOTAL_PAYMENT_OUT_PROJECT = "$BASE_URL/Project/GetPayOut";
  static const GET_TOTAL_PAYMENT_IN = "$BASE_URL/Project/GetPayIn";
  static const GET_PAYMENT_IN_AGENCY = "$BASE_URL/Agency/GetPayInAgency";
  static const ADD_PAYMENT_IN = "$BASE_URL/Partie/PayIn";
  static const GET_TRANSACTION_BY_INDIVIDUAL_AGENCIES =
      "$BASE_URL/Transaction/GetTransactionByIndividualAgencyInProject";
  static const ADD_BILLING_PARTY = "$BASE_URL/Partie/AddParties";
  static const ADD_BILL = "$BASE_URL/Bill/AddBill";
  static const GET_ALL_PARTIES = "$BASE_URL/Partie/GetParties";
  static const GET_ALL_BILLS_BY_PARTY_ID = "$BASE_URL/Bill/GetBill";

  //--------------------------- Financials ------------------------------------------------------------------------------------
  static const GET_FINACIALS = "$BASE_URL/Bill/GetFinancials";

  //------------- Authentication--------------
  static const REQUEST_OTP = "$BASE_URL/Company/RequestOtp";
  static const VERIFY_OTP = "$BASE_URL/Company/EmailVarificationOtp";
  static const SIGN_UP_API = "$BASE_URL/Company/SetCredentials";
  static const LOGIN_API = "$BASE_URL/Company/Login";

  //---------------------------- Material ------------------------------------------------------
  static const ADD_MATERIAL = "$BASE_URL/Material/AddMaterial";
  static const GET_MATERIAL = "$BASE_URL/Material/GetMaterial";
  static const UPDATE_MATERIAL = "$BASE_URL/Material/UpdateMaterial";

  //-------------------- Transaction --------------
  static const ADD_OTHER_TRANSACTIONS =
      "$BASE_URL/Transaction/AddOtherTransaction";

  static const GET_TDS_TRANSACTIONS = "$BASE_URL/Company/TotalTds";

  static const GET_GST_TRANSACTIONS = "$BASE_URL/Company/TotalGst";

  static const GET_OTHER_EXPENSE_TRANSACTIONS =
      "$BASE_URL/Company/TotalOtherExpense";

  //------------- Profile -----------
  static const COMPLETE_PROFILE = "$BASE_URL/Company/CompleteProfile";
  static const GET_PROFILE = "$BASE_URL/Company/GetCompany";
}
