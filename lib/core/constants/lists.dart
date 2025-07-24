import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/utilities/extension/transaction_extension.dart';

List<ProjectModel> projects = [];
List<BuildingModel> buildings = [];
List<PerBuildingAgencyModel> agencies = [];

List<String> workType = ["Select Work"];
List<String> nameOfAgency = ["Select Agency"];
List<String> selectBuilding = ["Select Building"];
List<String> selectProject = ["Select Project"];
List<String> selectParties = ["Select Party"];

List<Map<String, dynamic>> otherExpenses = [
  {"name": "GST", "value": Transaction.payGST},
  {
    "name": "TDS",
    "value": Transaction.payTDS,
  },
  {"name": "OTHER", "value": Transaction.otherExpense}
];

List<String> units = [
  "Select Unit",
  "kg",
  "litre",
  "bags",
  "nos",
  "numbers",
  "cft",
  "tonne",
  "brass",
  "sqft",
  "meter",
  "km",
  "box",
  "ft",
  "cum",
  "quintal",
  "mm",
  "sqm",
  "kilolitre",
  "in",
  "gram",
  "cm",
  "lb",
  "unit",
  "barrel",
  "kw",
  "dozen",
  "length",
  "sheet",
  "set",
  "roll",
  "loads",
  "pcs",
  "pair",
  "pac",
  "pkt",
  "RMT",
  "watt",
  "ml",
  "yard",
  "bundle",
  "drum",
  "gallons",
];
