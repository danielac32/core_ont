
enum MenuOption {
  createUser,
  users,
  page1,
  page2,
  page3,
  cmsSettings;

  String get label {
    switch (this) {
      case MenuOption.createUser:
        return 'Crear Usuario';
      case MenuOption.users:
        return 'Usuarios';
      case MenuOption.page1:
        return 'Página 1';
      case MenuOption.page2:
        return 'Página 2';
      case MenuOption.page3:
        return 'Página 3';
      case MenuOption.cmsSettings:
        return 'Configuración CMS';
    }
  }
}

enum Directorate {
  generalAdministrationAndServices,
  generalExpenditure,
  generalUniqueAccount,
  generalInformationTechnology,
  generalFinancialPlanningAndAnalysis,
  generalRevenueCollection,
  generalHumanResources,
  generalInvestmentsAndSecurities,
  generalLegalConsultancy;

  String get label {
    switch (this) {
      case Directorate.generalAdministrationAndServices:
        return 'Dirección General de Administración y Servicios';
      case Directorate.generalExpenditure:
        return 'Dirección General de Egreso';
      case Directorate.generalUniqueAccount:
        return 'Dirección General de Cuenta Única';
      case Directorate.generalInformationTechnology:
        return 'Dirección General de Tecnología de Información';
      case Directorate.generalFinancialPlanningAndAnalysis:
        return 'Dirección General de Planificación y Análisis Financiero';
      case Directorate.generalRevenueCollection:
        return 'Dirección General de Recaudación de Ingreso';
      case Directorate.generalHumanResources:
        return 'Dirección General de Recursos Humanos';
      case Directorate.generalInvestmentsAndSecurities:
        return 'Dirección General de Inversiones y Valores';
      case Directorate.generalLegalConsultancy:
        return 'Dirección General de Consultoría Jurídica';
    }
  }
}


enum Position {
  COORDINADOR,
  DIRECTOR_GENERAL,
  DIRECTOR_LINEA,
  ASISTENTE,
  ANALISTA,
  ASESOR,
  CONSULTOR,
  HP,
  OTRO;

  String get label {
    switch (this) {
      case Position.COORDINADOR:
        return "Coordinador";
      case Position.DIRECTOR_GENERAL:
        return "Director General";
      case Position.DIRECTOR_LINEA:
        return "Director de Línea";
      case Position.ASISTENTE:
        return "Asistente";
      case Position.ANALISTA:
        return "Analista";
      case Position.ASESOR:
        return "Asesor";
      case Position.CONSULTOR:
        return "Consultor";
      case Position.HP:
        return "HP"; // Si HP es un acrónimo, puedes dejarlo igual o expandirlo según el contexto.
      case Position.OTRO:
        return "Otro";
    }
  }
}

enum Role {
  USER,
  ADMIN;
  String get label {
    switch (this) {
      case Role.USER:
        return "USER";
      case Role.ADMIN:
        return "ADMIN";
    }
  }
}