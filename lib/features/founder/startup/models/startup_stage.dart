enum StartupStage { idea, mvp, earlyTraction, growth, scaling }

extension StartupStageLabel on StartupStage {
  String get label => switch (this) {
    StartupStage.idea => 'Idea',
    StartupStage.mvp => 'MVP',
    StartupStage.earlyTraction => 'Early Traction',
    StartupStage.growth => 'Growth',
    StartupStage.scaling => 'Scaling',
  };
}
