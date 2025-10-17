SSDB = {}
SSDB.filterMode = 2;

SlashCmdList["SSFLTR"] = function(_msg)
	if (_msg) then
		local _, _, cmd, arg1 = string.find(string.upper(_msg), "([%w]+)%s*(.*)$");
		if ("NOFILTER" == cmd) then
			SSDB.filterMode = 0;
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSystemSpam: |cFF00BEFFFilter Disabled|cFFFFFFFF.");
		elseif ("COLOR" == cmd) then
			SSDB.filterMode = 1;
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSystemSpam: |cFF00BEFFColor|cFFFFFFFF Mode Enabled.");
		elseif ("HIDE" == cmd) then
			SSDB.filterMode = 2;
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFFFFSystemSpam: |cFF00BEFFHide|cFFFFFFFF Mode Enabled.");
		else
			local badCmd = ''; if (_msg ~= "") then badCmd = ' Unknown command "' .. _msg .. '".'; end;
			local option1, option2, option3 = "", "", ""; if (SSDB.filterMode == 0) then option1 = "(Active) "; elseif (SSDB.filterMode == 1) then option2 = "(Active) "; elseif (SSDB.filterMode == 2) then option3 = "(Active) "; end;
			local helpMsg = '|cFFFFFFFF/SystemSpam:' .. badCmd .. "\n" ..
				"[ Valid Commands: ]\n" ..
				"nofilter: " .. option1 .. "|cFF00BEFFDisables the spam text filtering.|cFFFFFFFF\n" ..
				"color: " .. option2 .. "|cFF00BEFFColors the spam text dark gray.|cFFFFFFFF\n" ..
				"hide: " .. option3 .. "|cFF00BEFFHides all spam text messages.";
			DEFAULT_CHAT_FRAME:AddMessage(helpMsg);
		end
	end
end

SLASH_SSFLTR1 = "/systemspam";

function SSFilter_ChannelMsgFilter(self, event, ...)
	
	local msg = arg1
	local author = arg2
	
	if (SSDB.filterMode ~= 0 and arg2 ~= UnitName("player")) then
		local lcmsg = string.lower(msg);
		if
		strfind(lcmsg, "%f[%w].lla%W]") or
		strfind(lcmsg, "%f[%w]sign up%W]") or
		strfind(lcmsg, ".fun") or
		strfind(lcmsg, "engb") or
		strfind(lcmsg, "enus") or
		strfind(lcmsg, "announcer") or
		strfind(lcmsg, "arena") or
		strfind(lcmsg, "discount") or
		strfind(lcmsg, "donation") or
		strfind(lcmsg, "emulator") or
		strfind(lcmsg, "vote") or
		strfind(lcmsg, "asking") or
		strfind(lcmsg, "social") or
		strfind(lcmsg, "recruitment") or
		strfind(lcmsg, "contribut") or
		strfind(lcmsg, "store") or
		strfind(lcmsg, "prizes") or
		strfind(lcmsg, "discord") or
		strfind(lcmsg, "whitemaine") or
		strfind(lcmsg, "warmane") or
		strfind(lcmsg, "arsenal") or
		strfind(lcmsg, "playerid") or
		strfind(lcmsg, "has been slain") or
		strfind(lcmsg, "pvpstats") or
		strfind(lcmsg, "of the month") or
		strfind(lcmsg, "has earned") or
		strfind(lcmsg, "you are not in a guild")
		then
			if (SSDB.filterMode == 1) then
				local cleantext = msg:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", "")
				return false, ("|cFF5C5C5C" .. cleantext .. "|r"), arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12; -- mode 1; color the message gray
			else
				return true;
			end
		end
	end
	
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", SSFilter_ChannelMsgFilter);