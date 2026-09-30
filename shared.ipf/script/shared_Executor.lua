-- shared_Executor.lua
-- done, 해당 함수 내용은 cpp로 이전되었습니다. 변경 사항이 있다면 반드시 프로그램팀에 알려주시기 바랍니다.
function SCR_GET_Executor_RuinCleave_Ratio(skill)
    local pc = GetSkillOwner(skill)
    local count = 5
    return GET_PVP_TARGET_COUNT(pc, count)
end

-- done, 해당 함수 내용은 cpp로 이전되었습니다. 변경 사항이 있다면 반드시 프로그램팀에 알려주시기 바랍니다.
function SCR_GET_Executor_PhantomCharge_Ratio(skill)
    local pc = GetSkillOwner(skill)
    local count = 5
    return GET_PVP_TARGET_COUNT(pc, count)
end

-- done, 해당 함수 내용은 cpp로 이전되었습니다. 변경 사항이 있다면 반드시 프로그램팀에 알려주시기 바랍니다.
function SCR_GET_Executor_GrimShackle_Ratio(skill)
    local pc = GetSkillOwner(skill)
    local count = 5
    return GET_PVP_TARGET_COUNT(pc, count)
end

-- done, 해당 함수 내용은 cpp로 이전되었습니다. 변경 사항이 있다면 반드시 프로그램팀에 알려주시기 바랍니다.
function SCR_GET_Executor_DeathSentence_Ratio(skill)
    local pc = GetSkillOwner(skill)
    local count = 10
    return GET_PVP_TARGET_COUNT(pc, count)
end

-- done, 해당 함수 내용은 cpp로 이전되었습니다. 변경 사항이 있다면 반드시 프로그램팀에 알려주시기 바랍니다.
function SCR_GET_Executor_AbyssalFlurry_Ratio(skill)
    local pc = GetSkillOwner(skill)
    local count = 10
    return GET_PVP_TARGET_COUNT(pc, count)
end

-- done, 해당 함수 내용은 cpp로 이전되었습니다. 변경 사항이 있다면 반드시 프로그램팀에 알려주시기 바랍니다.
function SCR_GET_Executor_AbyssalOculus_Ratio(skill)
    local pc = GetSkillOwner(skill)
    local count = 15
    return GET_PVP_TARGET_COUNT(pc, count)
end

function SCR_EXECUTOR_CHECK_USE_ABYSSALOCULUS_C(actor, skl, buffName)
    local buff = actor:GetBuff():GetBuff("Executor_Abyssal_Buff")
    if buff ~= nil then
        return 1
    end
    return 0
end
