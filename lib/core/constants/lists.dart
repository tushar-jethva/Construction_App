import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/utilities/extension/transaction_extension.dart';

List<ProjectModel> projects = [];

List<BuildingModel> buildings = [];

List<PerBuildingAgencyModel> agencies = [];

List<String> workType = ["--Select Work--"];

List<String> nameOfAgency = ["--Select Agency--"];

List<String> selectBuilding = ["--Select Building--"];
List<String> selectProject = ["--Select Project--"];
List<String> selectParties = ["--Select Party--"];

List<Map<String,dynamic>> otherExpenses = [
  {
    "name":"GST",
    "value":Transaction.payGST
  },
  {
    "name":"TDS",
    "value":Transaction.payTDS,
  },
  {
    "name":"OTHER",
    "value":Transaction.otherExpense
  }

];
