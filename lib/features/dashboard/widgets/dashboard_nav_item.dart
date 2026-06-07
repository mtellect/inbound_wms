import 'package:flutter/material.dart';

class DashboardNavItem extends StatefulWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final bool isExpanded;
  final bool isDestructive;
  final VoidCallback onTap;

  const DashboardNavItem({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.isExpanded,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  State<DashboardNavItem> createState() => _DashboardNavItemState();
}

class _DashboardNavItemState extends State<DashboardNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.isDestructive ? Colors.red : Theme.of(context).primaryColor;
    final color = widget.isActive ? primaryColor : (_isHovered ? primaryColor : Colors.grey[600]!);
    final bgColor = widget.isActive
        ? primaryColor.withValues(alpha: 0.1)
        : (_isHovered ? Colors.grey[100] : Colors.transparent);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: widget.onTap,
        onHover: (val) => setState(() => _isHovered = val),
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: widget.isExpanded ? 16 : 0,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: widget.isExpanded
              ? Row(
                  children: [
                    Icon(widget.isActive ? widget.activeIcon : widget.icon, color: color, size: 22),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        widget.label,
                        style: TextStyle(
                          color: color,
                          fontWeight: widget.isActive ? FontWeight.bold : FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Tooltip(
                    message: widget.label,
                    preferBelow: false,
                    child: Icon(widget.isActive ? widget.activeIcon : widget.icon, color: color, size: 24),
                  ),
                ),
        ),
      ),
    );
  }
}
