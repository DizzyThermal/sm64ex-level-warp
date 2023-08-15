-- name: Level Warp
-- description: Chat command to warp to levels and warp nodes.\n\nExamples:\n /w bob (BoB)\n /w bob 1 2 (Area 1, Act 2)\n\n /w castle 2 (Upstairs)\n /w castle 3 (Basement)\n /w castle 1 1 10 (Castle, PSS Warp)\n\n /w thi (Huge)\n /w thi 2 (Tiny)\n /w thi 3 (Wiggler's Room)

function LevelWarp(msg)
    msg_parts = {}
    for substring in msg:gmatch("%w+") do table.insert(msg_parts, substring) end

    level = msg_parts[1]
    area = 1
    act = 1
    warpId = 10

    use_level = true
    if #(msg_parts) > 1 then
      area = tonumber(msg_parts[2])
    end
    if #(msg_parts) > 2 then
      act = tonumber(msg_parts[3])
    end
    if #(msg_parts) > 3 then
      use_level = false
      warpId = tonumber(msg_parts[4])
    end

    if level:match("%a") then
        if level:upper():find("BBH") then
            level = LEVEL_BBH
        elseif level:upper():find("CCM") then
            level = LEVEL_CCM
        elseif level:upper():find("HMC") then
            level = LEVEL_HMC
        elseif level:upper():find("SSL") then
            level = LEVEL_SSL
        elseif level:upper():find("BOB") then
            level = LEVEL_BOB
        elseif level:upper():find("SL") then
            level = LEVEL_SL
        elseif level:upper():find("WDW") then
            level = LEVEL_WDW
        elseif level:upper():find("JRB") then
            level = LEVEL_JRB
        elseif level:upper():find("THI") then
            level = LEVEL_THI
        elseif level:upper():find("TTC") then
            level = LEVEL_TTC
        elseif level:upper():find("RR") then
            level = LEVEL_RR
        elseif level:upper():find("GROUNDS") then
            level = LEVEL_CASTLE_GROUNDS
        elseif level:upper():find("BITDW") then
            level = LEVEL_BITDW
        elseif level:upper():find("VCUTM") or level:upper():find("VANISH") then
            level = LEVEL_VCUTM
        elseif level:upper():find("BITFS") then
            level = LEVEL_BITFS
        elseif level:upper():find("SA") then
            level = LEVEL_SA
        elseif level:upper():find("BITS") then
            level = LEVEL_BITS
        elseif level:upper():find("LLL") then
            level = LEVEL_LLL
        elseif level:upper():find("DDD") then
            level = LEVEL_DDD
        elseif level:upper():find("WF") then
            level = LEVEL_WF
        elseif level:upper():find("ENDING") then
            level = LEVEL_ENDING
        elseif level:upper():find("COURTYARD") then
            level = LEVEL_CASTLE_COURTYARD
        elseif level:upper():find("PSS") then
            level = LEVEL_PSS
        elseif level:upper():find("COTMC") or level:upper():find("METAL") then
            level = LEVEL_COTMC
        elseif level:upper():find("TOTWC") or level:upper():find("WING") then
            level = LEVEL_TOTWC
        elseif level:upper():find("B1") or level:upper():find("BOWSER_1") then
            level = 30
        elseif level:upper():find("OTR") then
            level = LEVEL_WMOTR
        elseif level:upper():find("B2") or level:upper():find("BOWSER_2") then
            level = 33
        elseif level:upper():find("B3") or level:upper():find("BOWSER_3") then
            level = 34
        elseif level:upper():find("TTM") then
            level = LEVEL_TTM
        elseif level:upper():find("CASTLE") then
            level = LEVEL_CASTLE
        else
            level = LEVEL_CASTLE_GROUNDS
        end
    else
        level = tonumber(level)
    end

    -- If warpId is unspecified, use warp_to_level, else use warp_to_warpnode
    if use_level then
        warp_to_level(level, area, act)
    else
        warp_to_warpnode(level, area, act, warpId)
    end
end

hook_chat_command("w", "warp(level, area=1, act=1, warpId=10)", LevelWarp)
