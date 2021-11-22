Config = {
	DiscordToken = "",
	GuildId = "",

	-- Format: ["Role Nickname"] = "Role ID" You can get role id by doing \@RoleName
	Roles = {
		["Whitelist"] = "894038994575327272", -- This would be checked by doing exports.discord_perms:IsRolePresent(user, "TestRole")
		["Beta"] = "894039051072593940", -- This would be checked by doing exports.discord_perms:IsRolePresent(user, "TestRole")
		["Prémium"] = "900724636298383390", -- This would be checked by doing exports.discord_perms:IsRolePresent(user, "TestRole")
	}
}
