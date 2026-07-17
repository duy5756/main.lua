local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local REJOIN_TIME = 1600 -- 1 tiếng
local player = Players.LocalPlayer

-- Xóa UI cũ một cách an toàn nếu có
local pg = player:FindFirstChildOfClass("PlayerGui")
if pg then
	local old = pg:FindFirstChild("RejoinTimer")
	if old then old:Destroy() end
end

-- Hàm teleport an toàn
local function safeTeleport()
	for i = 1, 3 do
		local ok = pcall(function()
			TeleportService:Teleport(game.PlaceId) 
		end)

		if ok then return true end
		task.wait(3)
	end
	return false
end

-- Vòng lặp chính siêu tối ưu và không thể bị kẹt
while true do
	-- Script ngủ thẳng 1 tiếng
	task.wait(REJOIN_TIME)
	
	-- Hết giờ, tiến hành gọi lệnh dịch chuyển
	local success = safeTeleport()
	
	if success then
		-- Đợi 60 giây để Roblox xử lý việc chuyển server. 
		-- Nếu sau 60 giây vẫn bị kẹt lại server cũ (do lỗi kết nối), 
		-- vòng lặp sẽ tự động chạy tiếp một chu kỳ 1 tiếng mới chứ không bị đóng băng!
		task.wait(60) 
	else
		-- Nếu cả 3 lần thử đều lỗi, đợi 10 giây rồi thử lại ngay lập tức thay vì đợi thêm 1 tiếng
		task.wait(10)
	end
end
