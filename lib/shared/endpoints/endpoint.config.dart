import 'package:ventura_hr/shared/endpoints/controllers/admin.controller.dart';
import 'package:ventura_hr/shared/endpoints/controllers/candidacy.controller.dart';
import 'package:ventura_hr/shared/endpoints/controllers/candidate.controller.dart';
import 'package:ventura_hr/shared/endpoints/controllers/criterion.controller.dart';
import 'package:ventura_hr/shared/endpoints/controllers/enterprise.controller.dart';
import 'package:ventura_hr/shared/endpoints/controllers/skill.controller.dart';
import 'package:ventura_hr/shared/endpoints/controllers/user.controller.dart';
import 'package:ventura_hr/shared/endpoints/controllers/vacancy.controller.dart';
import 'package:ventura_hr/shared/endpoints/endpoint.dart';

class Endpoints {
  static String get urlServer => 'http://192.168.1.72:8080';

  static UserController user = UserController(
    create: Endpoint(baseUrl: urlServer, path: '/user/createUser'),
    getById: Endpoint(baseUrl: urlServer, path: '/userDetails'),
    edit: Endpoint(baseUrl: urlServer, path: '/editUser'),
    delete: Endpoint(baseUrl: urlServer, path: '/deleteUser'),
    getAll: Endpoint(baseUrl: urlServer, path: '/getAllUsers'),
    findByEmail: Endpoint(baseUrl: urlServer, path: '/user/findByEmail'),
  );

  static AdminController admin = AdminController(
    create: Endpoint(baseUrl: urlServer, path: '/createAdmin'),
    getById: Endpoint(baseUrl: urlServer, path: '/adminDetails'),
    edit: Endpoint(baseUrl: urlServer, path: '/editAdmin'),
    delete: Endpoint(baseUrl: urlServer, path: '/deleteAdmin'),
    getAll: Endpoint(baseUrl: urlServer, path: '/getAllAdmins'),
  );

  static CandidateController candidate = CandidateController(
    create: Endpoint(baseUrl: urlServer, path: '/createCandidate'),
    getById: Endpoint(baseUrl: urlServer, path: '/candidateDetails'),
    edit: Endpoint(baseUrl: urlServer, path: '/editCandidate'),
    delete: Endpoint(baseUrl: urlServer, path: '/deleteCandidate'),
    getAll: Endpoint(baseUrl: urlServer, path: '/getAllCandidates'),
  );

  static EnterpriseController enterprise = EnterpriseController(
    create: Endpoint(baseUrl: urlServer, path: '/createEnterprise'),
    getById: Endpoint(baseUrl: urlServer, path: '/enterpriseDetails'),
    edit: Endpoint(baseUrl: urlServer, path: '/editEnterprise'),
    delete: Endpoint(baseUrl: urlServer, path: '/deleteEnterprise'),
    getAll: Endpoint(baseUrl: urlServer, path: '/getAllEnterprises'),
  );

  static CandidacyController candidacy = CandidacyController(
    create: Endpoint(baseUrl: urlServer, path: '/createCandidacy'),
    getById: Endpoint(baseUrl: urlServer, path: '/candidacyDetails'),
    edit: Endpoint(baseUrl: urlServer, path: '/editCandidacy'),
    delete: Endpoint(baseUrl: urlServer, path: '/deleteCandidacy'),
    getAll: Endpoint(baseUrl: urlServer, path: '/getAllCandidacies'),
  );

  static CriterionController criterion = CriterionController(
    create: Endpoint(baseUrl: urlServer, path: '/createCriterion'),
    getById: Endpoint(baseUrl: urlServer, path: '/criterionDetails'),
    edit: Endpoint(baseUrl: urlServer, path: '/editCriterion'),
    delete: Endpoint(baseUrl: urlServer, path: '/deleteCriterion'),
    getAll: Endpoint(baseUrl: urlServer, path: '/getAllCriterions'),
  );

  static SkillController skill = SkillController(
    create: Endpoint(baseUrl: urlServer, path: '/createSkill'),
    getById: Endpoint(baseUrl: urlServer, path: '/skillDetails'),
    edit: Endpoint(baseUrl: urlServer, path: '/editSkill'),
    delete: Endpoint(baseUrl: urlServer, path: '/deleteSkill'),
    getAll: Endpoint(baseUrl: urlServer, path: '/getAllSkills'),
  );

  static VacancyController vacancy = VacancyController(
    create: Endpoint(baseUrl: urlServer, path: '/createVacancy'),
    getById: Endpoint(baseUrl: urlServer, path: '/vacancyDetails'),
    edit: Endpoint(baseUrl: urlServer, path: '/editVacancy'),
    delete: Endpoint(baseUrl: urlServer, path: '/deleteVacancy'),
    getAll: Endpoint(baseUrl: urlServer, path: '/getAllVacancies'),
  );
}
