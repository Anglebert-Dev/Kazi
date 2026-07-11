enum CategoryType {
  industry,
  startupStage,
  skill,
  interest,
  opportunityCategory,
  verificationDocument,
}

extension CategoryTypeLabel on CategoryType {
  String get label => switch (this) {
    CategoryType.industry => 'Industries',
    CategoryType.startupStage => 'Startup Stages',
    CategoryType.skill => 'Skills',
    CategoryType.interest => 'Interests',
    CategoryType.opportunityCategory => 'Opportunity Categories',
    CategoryType.verificationDocument => 'Verification Documents',
  };
}
