import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../../../authentication/models/user_model.dart';
import '../../../authentication/models/user_role.dart';
import '../../../authentication/models/user_status.dart';
import 'role_chip.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.user,
    required this.isSelf,
    required this.onChangeRole,
    required this.onChangeStatus,
  });

  final UserModel user;
  final bool isSelf;
  final ValueChanged<UserRole> onChangeRole;
  final ValueChanged<UserStatus> onChangeStatus;

  String get _name => (user.displayName ?? '').isNotEmpty ? user.displayName! : user.email;

  Future<void> _handleRoleSelected(BuildContext context, UserRole role) async {
    if (role == user.role) return;

    final involvesAdmin = role == UserRole.admin || user.role == UserRole.admin;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(involvesAdmin ? 'Change admin access?' : 'Change role?'),
        content: Text(
          "This changes $_name's role from ${user.role?.label ?? 'None'} to "
          "${role.label}. They'll immediately lose access to ${user.role?.label ?? 'their current'} "
          "screens and data, and gain access to ${role.label} ones instead.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );

    if (confirmed == true) onChangeRole(role);
  }

  Future<void> _handleStatusToggle(BuildContext context) async {
    final nextStatus = user.status == UserStatus.active
        ? UserStatus.suspended
        : UserStatus.active;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(nextStatus == UserStatus.suspended ? 'Suspend user?' : 'Reactivate user?'),
        content: Text(
          nextStatus == UserStatus.suspended
              ? '$_name will be signed out and blocked from using the app.'
              : '$_name will be able to use the app again.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(nextStatus == UserStatus.suspended ? 'Suspend' : 'Reactivate'),
          ),
        ],
      ),
    );

    if (confirmed == true) onChangeStatus(nextStatus);
  }

  @override
  Widget build(BuildContext context) {
    final isSuspended = user.status == UserStatus.suspended;

    return ListTile(
      leading: Avatar(name: _name, size: AvatarSize.small),
      title: Text(_name),
      subtitle: Text(user.email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: isSuspended ? 'Reactivate' : 'Suspend',
            icon: Icon(
              isSuspended ? Icons.lock_outline : Icons.lock_open_outlined,
              color: isSuspended ? AppColors.error : AppColors.textSecondary,
            ),
            onPressed: () => _handleStatusToggle(context),
          ),
          if (isSelf)
            Tooltip(
              message: "You can't change your own role",
              child: RoleChip(label: user.role?.label ?? 'None', enabled: false),
            )
          else
            PopupMenuButton<UserRole>(
              onSelected: (role) => _handleRoleSelected(context, role),
              itemBuilder: (context) => [
                for (final role in UserRole.values)
                  PopupMenuItem(value: role, child: Text(role.label)),
              ],
              child: RoleChip(label: user.role?.label ?? 'None', enabled: true),
            ),
        ],
      ),
    );
  }
}
