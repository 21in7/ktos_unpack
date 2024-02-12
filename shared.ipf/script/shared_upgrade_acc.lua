-- shared_upgrade_acc.lua

-- 방어력, 치저, 블록, 치유력, 공격력, 치발감소, 추가 대미지
function GET_EP16_NECK_02_POINT(item)
    local min, max = GET_ITEM_ATK(item)
    local avg = (min + max) * 0.5
    
    local def = math.floor(avg * 10)
    local crtdr = math.floor(avg * 0.25) -- 치저
    local blk = math.floor(avg * 0.25)

    local heal = math.floor(avg * 0.7)
    local atk = math.floor(avg * 1.6)
    local crthr = math.floor(avg * 0.28) -- 치발감소
    local add_dmg = math.floor(avg * 0.65)
    local mspd = math.floor(avg * 0.0008)
    if mspd < 1 then
        mspd = 1 
    end

    return def, crtdr, blk, heal, atk, crthr, add_dmg, mspd
end

function GET_EP16_BRC_02_POINT(item)
    local min, max = GET_ITEM_ATK(item)
    local avg = (min + max) * 0.5
    
    local def = math.floor(avg * 5)
    local crtdr = math.floor(avg * 0.125) -- 치저
    local blk = math.floor(avg * 0.125)
    
    local heal = math.floor(avg * 0.35)
    local atk = math.floor(avg * 0.8)
    local crthr = math.floor(avg * 0.14) -- 치발감소
    local add_dmg = math.floor(avg * 0.325)
    local mspd = math.floor(avg * 0.0004)
    if mspd < 1 then
        mspd = 1 
    end

    return def, crtdr, blk, heal, atk, crthr, add_dmg, mspd
end

-- ClassType {Neck, Ring}
shared_upgrade_acc = {}
local material_table = nil
local value_grade_table = nil

local function make_shared_upgrade_acc_table()
    if material_table ~= nil then
        return
    end

    material_table = {}
    value_grade_table = {}

    material_table[510] = {}
    material_table[510]['Neck'] = {}
    material_table[510]['Neck']['RadaCertificate'] = 7000
    material_table[510]['Neck']['misc_BlessedStone_1'] = 2
    material_table[510]['Neck']['misc_merregina_blackpearl_NoTrade'] = 20
    
    material_table[510]['Ring'] = {}
    material_table[510]['Ring']['RadaCertificate'] = 3500
    material_table[510]['Ring']['misc_BlessedStone_1'] = 1
    material_table[510]['Ring']['misc_merregina_blackpearl_NoTrade'] = 10

    -- 값 세팅
    value_grade_table['EP16_NECK_03'] = {} -- 주오다 네클리스
    value_grade_table['EP16_BRC_03'] = {} -- 주오다 네클리스

    value_grade_table['EP16_NECK_02'] = {} -- 칸트리베 네클리스
    value_grade_table['EP16_BRC_02'] = {} -- 칸트리베 네클리스

    value_grade_table['EP16_NECK_04'] = {} -- 트리우카스 네클리스
    value_grade_table['EP16_BRC_04'] = {} -- 트리우카스 네클리스

    value_grade_table['EP16_NECK_01'] = {} -- 피크티스 네클리스
    value_grade_table['EP16_BRC_01'] = {} -- 피크티스 네클리스

    for i = 1, 20 do
        value_grade_table['EP16_NECK_03'][i] = {210 * i, 63 * i}
        value_grade_table['EP16_BRC_03'][i] = {105 * i, 31 * i}
        
        value_grade_table['EP16_NECK_02'][i] = {500 * i, 0}
        value_grade_table['EP16_BRC_02'][i] = {250 * i, 0}

        value_grade_table['EP16_NECK_04'][i] = {131 * i, 39 * i}
        value_grade_table['EP16_BRC_04'][i] = {65 * i, 19 * i}

        value_grade_table['EP16_NECK_01'][i] = {112 * i, 33 * i}
        value_grade_table['EP16_BRC_01'][i] = {56 * i, 16 * i}
    end

    value_grade_table['EP16_NECK_03'][20] = {4200, 1260}
    value_grade_table['EP16_BRC_03'][20] = {2100, 630}

    value_grade_table['EP16_NECK_02'][20] = {10000, 0}
    value_grade_table['EP16_BRC_02'][20] = {5000, 0}

    value_grade_table['EP16_NECK_04'][20] = {2626, 788}
    value_grade_table['EP16_BRC_04'][20] = {1313, 394}

    value_grade_table['EP16_NECK_01'][20] = {2250, 675}
    value_grade_table['EP16_BRC_01'][20] = {1125, 337}   
end

make_shared_upgrade_acc_table()

shared_upgrade_acc.is_valid_item = function(item)
    if TryGetProp(item, 'StringArg', 'None') ~= 'EP16_acc' then
        return false, 'NotValidItem'
    end
    
    if TryGetProp(item, 'Reinforce_2', 0) < 25 then
        return false, 'Need25Reinforcement'
    end
    
    if TryGetProp(item, 'UpgradeRank', 0) >= 20 then
        return false, 'AlreadyMaxGrade'
    end

    return true
end

shared_upgrade_acc.get_value = function(item, rank)
    if rank == nil then
        rank = TryGetProp(item, 'UpgradeRank', 0)
    end

    local name = TryGetProp(item, 'ClassName', 'None')

    if value_grade_table[name] == nil then
        return 0, 0
    end

    if value_grade_table[name][rank] == nil then
        return 0, 0
    end

    return value_grade_table[name][rank][1], value_grade_table[name][rank][2] 
end

shared_upgrade_acc.get_cost = function(item)
    local lv = TryGetProp(item, 'UseLv', 0)
    local spot = TryGetProp(item, 'ClassType', 'None')

    if material_table[lv] == nil then
        return nil
    end

    if material_table[lv][spot] == nil then
        return nil
    end

    return material_table[lv][spot]
end