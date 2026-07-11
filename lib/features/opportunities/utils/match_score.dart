int? calculateMatchScore(List<String> requiredSkills, List<String> studentSkills) {
  if (requiredSkills.isEmpty || studentSkills.isEmpty) return null;

  final studentSkillSet = studentSkills.toSet();
  final overlap = requiredSkills.where(studentSkillSet.contains).length;

  return ((overlap / requiredSkills.length) * 100).round();
}
