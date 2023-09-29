-- shared_popoboost
local item_list = nil
local maxProgress = 3;
function popoboost_table()
    if item_list == nil then
        item_list = {}
    end

    local IsPAPAYA = false;

    if IsServerSection() == 1 then
        if GetServiceNation() == "PAPAYA" then
            IsPAPAYA = true;
        end
    else
        if config.GetServiceNation() =="PAPAYA" then
            IsPAPAYA = true;
        end
    end

    item_list["Normal0"] = {}
    item_list["Normal0"]['Ability_Point_Stone_100000'] = 20
    item_list["Normal0"]['HiddenAbility_MasterPiece_Fragment_Event'] = 120
    if IsPAPAYA == true then
        item_list["Normal0"]['Ability_Point_Stone_100000'] = 1
        item_list["Normal0"]['HiddenAbility_MasterPiece_Fragment_Event'] = 20
        item_list["Normal0"]['open_ticket_cabinet_vibora_lv1'] = 1
        item_list["Normal0"]['open_ticket_cabinet_goddess_lv1'] = 1
    else
        item_list["Normal0"]['Event_JobexpCard_BOX'] = 1
        item_list["Normal0"]['open_ticket_cabinet_vibora_lv4'] = 1
        item_list["Normal0"]['open_ticket_cabinet_goddess_lv3'] = 4
        item_list["Normal0"]['relicgem_lvup_scroll_lv7'] = 2
        item_list["Normal0"]['Relic_exp_token_refine_event'] = 4930
    end

    item_list["Normal1"] = {}
    item_list["Normal1"]['Event_Roulette_Coin_PoPo'] = 1
    item_list["Normal1"]['misc_RevivalPaulius_NoTrade'] = 150
    item_list["Normal1"]['Ticket_RevivalPaulius_Auto_Enter_NoTrade'] = 2
    item_list["Normal1"]['Event_ChallengeModeReset_6'] = 10
    item_list["Normal1"]['SEASONLETICIA_GabijaCertificateCoin_50000p'] = 1
    if IsPAPAYA == true then
        item_list["Normal1"]['misc_RevivalPaulius_NoTrade'] = 100
        item_list["Normal1"]['Event_ChallengeModeReset_6'] = 3
    end
    
    
    item_list["Normal2"] = {}
    item_list["Normal2"]['Event_Roulette_Coin_PoPo'] = 1
    item_list["Normal2"]['misc_RevivalPaulius_NoTrade'] = 200
    item_list["Normal2"]['Ticket_RevivalPaulius_Auto_Enter_NoTrade'] = 5
    item_list["Normal2"]['Event_ChallengeModeReset_6'] = 10
    item_list["Normal2"]['SEASONLETICIA_GabijaCertificateCoin_50000p'] = 2

    if IsPAPAYA == true then
        item_list["Normal2"]['misc_RevivalPaulius_NoTrade'] = 100
        item_list["Normal2"]['Ticket_RevivalPaulius_Auto_Enter_NoTrade'] = 3
        item_list["Normal2"]['Event_ChallengeModeReset_6'] = 3
        item_list["Normal2"]['SEASONLETICIA_GabijaCertificateCoin_50000p'] = 1        
    end

    item_list["Normal3"] = {}
    item_list["Normal3"]['Event_Roulette_Coin_PoPo'] = 1
    item_list["Normal3"]['misc_RevivalPaulius_NoTrade'] = 200
    item_list["Normal3"]['Ticket_TurbulentCore_Auto_Enter_NoTrade'] = 5
    item_list["Normal3"]['VakarineCertificateCoin_50000p'] = 1

    if IsPAPAYA == true then
        item_list["Normal3"]['misc_RevivalPaulius_NoTrade'] = 100
    else
        item_list["Normal3"]['misc_transmutationSpreader_NoTrade'] = 300
    end

    item_list["Normal4"] = {}
    item_list["Normal4"]['Event_Roulette_Coin_PoPo'] = 1
    item_list["Normal4"]['Ticket_TurbulentCore_Auto_Enter_NoTrade'] = 5
    item_list["Normal4"]['Event_ChallengeModeReset_6'] = 10
    item_list["Normal4"]['VakarineCertificateCoin_50000p'] = 2
    if IsPAPAYA == true then
        item_list["Normal4"]['Ticket_TurbulentCore_Auto_Enter_NoTrade'] = 3
        item_list["Normal4"]['Event_ChallengeModeReset_6'] = 3
        item_list["Normal4"]['VakarineCertificateCoin_50000p'] = 1;
    else
        item_list["Normal4"]['misc_leatherFalouros_NoTrade'] = 300
    end

    item_list["Normal5"] = {}
    item_list["Normal5"]['Event_Roulette_Coin_PoPo'] = 1
    item_list["Normal5"]['misc_ribbonRoze_NoTrade'] = 100
    item_list["Normal5"]['Ticket_Rozethemisterable_Auto_Enter_NoTrade'] = 5
    item_list["Normal5"]['Ticket_TurbulentCore_Auto_Enter_NoTrade'] = 5
    item_list["Normal5"]['VakarineCertificateCoin_50000p'] = 2

    if IsPAPAYA == true then
        item_list["Normal5"]['Ticket_Rozethemisterable_Auto_Enter_NoTrade'] = 3
        item_list["Normal5"]['Ticket_TurbulentCore_Auto_Enter_NoTrade'] = 3
        item_list["Normal5"]['VakarineCertificateCoin_50000p'] = 1
    else
        item_list["Normal5"]['misc_transmutationSpreader_NoTrade'] = 300
    end
    item_list["Normal6"] = {}
    item_list["Normal6"]['EVENT_2308_POPO_FESTA'] = 1
    item_list["Normal6"]['Event_Roulette_Coin_PoPo'] = 2
    item_list["Normal6"]['RadaCertificateCoin_50000p'] = 4
    item_list["Normal6"]['Ticket_TurbulentCore_Party_Enter_NoTrade'] = 4
    item_list["Normal6"]['Ticket_Rozethemisterable_Party_Enter_NoTrade'] = 2
    item_list["Normal6"]['ChallengeExpertModeCountUp_Ev_1'] = 10
    if IsPAPAYA == true then
        item_list["Normal6"]['RadaCertificateCoin_50000p'] = 2
        item_list["Normal6"]['Ticket_TurbulentCore_Party_Enter_NoTrade'] = 3
        item_list["Normal6"]['ChallengeExpertModeCountUp_Ev_1'] = 5
    end
    
    -- 프리미엄 보상

    item_list["Premium0"] = {}
    item_list["Premium0"]['misc_Ether_Gem_Socket_480_NoTrade'] = 2
    item_list["Premium0"]['selectbox_Gem_High_480'] = 2
    item_list["Premium0"]['lv480_aether_lvup_scroll_lv100'] = 2
    item_list["Premium0"]['emoticonItem_summer_popo_1'] = 1
    if IsPAPAYA == true then
        item_list["Normal0"]['open_ticket_cabinet_vibora_lv1'] = 1
        item_list["Premium0"]['lv480_aether_lvup_scroll_lv100'] = 1
    else
        item_list["Premium0"]['class_unlock_achievement_select'] = 1
        item_list["Premium0"]['open_ticket_cabinet_vibora_lv4'] = 2
    end

    item_list["Premium1"] = {}
    item_list["Premium1"]['Event_Roulette_Coin_PoPo'] = 2
    item_list["Premium1"]['misc_RevivalPaulius_NoTrade'] = 150
    item_list["Premium1"]['Ticket_RevivalPaulius_Auto_Enter_NoTrade'] = 2
    item_list["Premium1"]['Event_ChallengeModeReset_6'] = 10
    item_list["Premium1"]['RadaCertificateCoin_50000p'] = 1
    if IsPAPAYA == true then

    else
        item_list["Premium1"]['misc_reinforce_percentUp_490_NoTrade'] = 100
    end
    item_list["Premium2"] = {}
    item_list["Premium2"]['Event_Roulette_Coin_PoPo'] = 2
    item_list["Premium2"]['misc_RevivalPaulius_NoTrade'] = 200
    item_list["Premium2"]['Ticket_RevivalPaulius_Auto_Enter_NoTrade'] = 5
    item_list["Premium2"]['Event_ChallengeModeReset_6'] = 10
    item_list["Premium2"]['RadaCertificateCoin_50000p'] = 2
    if IsPAPAYA == true then
        item_list["Premium2"]['RadaCertificateCoin_50000p'] = 1
    end
    item_list["Premium3"] = {}
    item_list["Premium3"]['Event_Roulette_Coin_PoPo'] = 2
    item_list["Premium3"]['misc_RevivalPaulius_NoTrade'] = 200
    item_list["Premium3"]['RadaCertificateCoin_50000p'] = 1
    if IsPAPAYA == true then
    else
        item_list["Premium3"]['misc_reinforce_percentUp_490_NoTrade'] = 100
        item_list["Premium3"]['misc_transmutationSpreader_NoTrade'] = 300
    end
    item_list["Premium4"] = {}
    item_list["Premium4"]['Event_Roulette_Coin_PoPo'] = 2
    item_list["Premium4"]['Event_ChallengeModeReset_6'] = 10
    item_list["Premium4"]['RadaCertificateCoin_50000p'] = 2
    
    if IsPAPAYA == true then
        item_list["Premium4"]['RadaCertificateCoin_50000p'] = 1
    else
        item_list["Premium4"]['misc_leatherFalouros_NoTrade'] = 300
        item_list["Premium4"]['misc_Premium_reinforce_percentUp_460'] = 20
    end
    item_list["Premium5"] = {}
    item_list["Premium5"]['Event_Roulette_Coin_PoPo'] = 2
    item_list["Premium5"]['misc_ribbonRoze_NoTrade'] = 100
    item_list["Premium5"]['Ticket_Rozethemisterable_Auto_Enter_NoTrade'] = 5
    item_list["Premium5"]['RadaCertificateCoin_50000p'] = 2
    if IsPAPAYA == true then
        item_list["Premium5"]['RadaCertificateCoin_50000p'] = 1        
    else
        item_list["Premium5"]['misc_transmutationSpreader_NoTrade'] = 300
        item_list["Premium5"]['misc_reinforce_percentUp_490_NoTrade'] = 100
    end

    item_list["Premium6"] = {}
    item_list["Premium6"]['EVENT_2308_POPO_FESTA_IMAGE_2'] = 1
    item_list["Premium6"]['Event_Roulette_Coin_PoPo'] = 3
    item_list["Premium6"]['RadaCertificateCoin_50000p'] = 4
    item_list["Premium6"]['Ticket_TurbulentCore_Party_Enter_NoTrade'] = 4
    item_list["Premium6"]['Ticket_Rozethemisterable_Party_Enter_NoTrade'] = 2
    item_list["Premium6"]['ChallengeExpertModeCountUp_Ev_1'] = 10
    if IsPAPAYA == true then
        item_list["Premium6"]['RadaCertificateCoin_50000p'] = 2
        item_list["Premium6"]['Ticket_TurbulentCore_Party_Enter_NoTrade'] = 3        
    else
        item_list["Premium6"]['misc_Premium_reinforce_percentUp_460'] = 20
    end
    
    return item_list
end

function GET_POPOBOOST_PARTICIPATE_MAX_PROGRESS()
    return maxProgress;
end


function POPOBOOST_CHECK_ELIGIBILITY(lv, gearscore)
    if IsServerSection() == 1 then        
        if GetServiceNation() == "PAPAYA" then
            return true;
        end
    else
        if config.GetServiceNation() == "PAPAYA" then
            return true;
        end
    end
    
    if lv >= 460 or gearscore > 8000 then
        return false;
    end

    return true;
end


function POPOBOOST_SET_MAX_GEARSCORE(pc)
    --server only
    if pc == nil then
        return ;
    end
    local etc = GetETCObject(pc);
    if etc == nil then
        return;
    end
	local maxGearScore = TryGetProp(etc,"EVENT_2023_POPOBOOST_MAX_GEARSCORE",0);
    local currentGearScore = POPOBOOST_GET_GEARSCORE(pc);

    if IsServerSection(pc) ~= 1 then
        return;
    end
    if currentGearScore > maxGearScore then
        local etc = GetETCObject(pc);
        if etc == nil then
            return ;
        end
    
        local tx = TxBegin(pc);
        if tx == nil then
            return;
        end
	    TxSetIESProp(tx, etc, "EVENT_2023_POPOBOOST_MAX_GEARSCORE", currentGearScore);

        local ret = TxCommit(tx)

    end
end

function POPOBOOST_GET_MAX_GEARSCORE(pc)
    if pc == nil then
        return 0;
    end
    local etcObj
    if IsServerSection(pc) == 1 then
        etcObj = GetETCObject(pc);
    else
        etcObj = GetMyEtcObject();
    end

    if pc == nil then
        return 0;
    end    
    if etcObj == nil then
        return 0;
    end
	local maxGearScore = TryGetProp(etcObj,"EVENT_2023_POPOBOOST_MAX_GEARSCORE",0);
    local currentGearScore = POPOBOOST_GET_GEARSCORE(pc);

    if maxGearScore > currentGearScore then
        return maxGearScore;
    end
    return currentGearScore;
end

function POPOBOOST_GET_GEARSCORE(pc)
    local IsPAPAYA = false;
    if IsServerSection() == 1 then        
        if GetServiceNation() == "PAPAYA" then
            IsPAPAYA = true;
        end
    else
        if config.GetServiceNation() == "PAPAYA" then
            IsPAPAYA = true;
        end
    end
    if IsPAPAYA == false then
        local score = GET_PLAYER_POPOBOOST_GEAR_SCORE(pc);
        return score;
    else
        local score = GET_PLAYER_GEAR_SCORE(pc);
        return score;
    end
    return 0;
end

function POPOBOOST_POPOBUFF_REMINE_TIME(pc)
    if IS_SEASON_SERVER(pc) == 'YES' then
        return false
    end
    local IsPAPAYA = false;
    if IsServerSection() == 1 then        
        if GetServiceNation() == "PAPAYA" then
            IsPAPAYA = true;
        end
    else
        if config.GetServiceNation() == "PAPAYA" then
            IsPAPAYA = true;
        end
    end

    local end_time = GET_POPOBOOST_END_TIME();
    local gearscore = POPOBOOST_GET_MAX_GEARSCORE(pc);
    if gearscore >= 19000 then
        return true;
    end
    if IsServerSection() == 1 then        
        local now = date_time.get_lua_now_datetime_str()
        local ret = date_time.is_later_than(now, end_time)	
        return ret
    else        
        local serverTime = geTime.GetServerSystemTime()
        local now = string.format("%04d-%02d-%02d %02d:%02d:%02d", serverTime.wYear, serverTime.wMonth, serverTime.wDay, serverTime.wHour, serverTime.wMinute, serverTime.wSecond)
        local ret = date_time.is_later_than(now, end_time)	        
        return ret
    end
end

function GET_POPOBOOST_END_TIME()
    
    local end_time ="0000-00-00 00:00:00";

    local popobannerlist , cnt = GetClassList("popoboost_banner");
    if popobannerlist == nil then
        return end_time;
    end

    if IsServerSection() == 1 then        
        for i = 0 , cnt - 1 do
            local popobannercls = GetClassByIndexFromList(popobannerlist, i);
            if GetServiceNation() == TryGetProp(popobannercls,"Nation","None") then
                end_time = TryGetProp(popobannercls,"EndDateTime","0000-00-00 00:00:00");
            end
        end

    else
        for i = 0 , cnt - 1 do
            local popobannercls = GetClassByIndexFromList(popobannerlist, i);
            if config.GetServiceNation() == TryGetProp(popobannercls,"Nation","None") then
                end_time = TryGetProp(popobannercls,"EndDateTime","0000-00-00 00:00:00");
            end
        end
    end
    return end_time;
end

-- true == end /// false == not end
function IS_POPOBOOST_END()
    local end_time = GET_POPOBOOST_END_TIME();
    if IsServerSection() == 1 then        
        local now = date_time.get_lua_now_datetime_str()
        local ret = date_time.is_later_than(now, end_time)	
        return ret
    else        
        local serverTime = geTime.GetServerSystemTime()
        local now = string.format("%04d-%02d-%02d %02d:%02d:%02d", serverTime.wYear, serverTime.wMonth, serverTime.wDay, serverTime.wHour, serverTime.wMinute, serverTime.wSecond)
        local ret = date_time.is_later_than(now, end_time)	        
        return ret
    end
end