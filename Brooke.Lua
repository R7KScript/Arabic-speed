--[[ 2025/3/15 
⠀⠀⠀⠀⠀⠀
░██████╗░█████╗░███╗░░██╗
██╔════╝██╔══██╗████╗░██║
╚█████╗░██║░░╚═╝██╔██╗██║
░╚═══██╗██║░░██╗██║╚████║
██████╔╝╚█████╔╝██║░╚███║
╚═════╝░░╚════╝░╚═╝░░╚══╝
]]

loadstring(game:HttpGet(("https://raw.githubusercontent.com/R7KScript/usernaxo/refs/heads/main/GUI3")))()
MakeWindow({
  Hub = {
    Title = "Brooke Haven | تخريب",
    Animation = "جار التحميل... "
  },
  Key = {
    KeySystem = false,
    Title = "Key System",
    Description = "",
    KeyLink = "",
    Keys = {"1234"},
    Notifi = {
      Notifications = true,
      CorrectKey = "Running the Script...",
      Incorrectkey = "The key is incorrect",
      CopyKeyLink = "Copied to Clipboard"
    }
  }
})

MinimizeButton({
  Image = "rbxassetid://120440277302800",
  Size = {40, 40},
  Color = Color3.fromRGB(15, 15, 15),
  Corner = true,
  Stroke = true,
  StrokeColor = Color3.fromRGB(255, 125, 0)
})
local Main = MakeTab({Name = "المطور"})
AddDiscord(Main, {
    DiscordLink = "https://t.me/SCN_key",
    DiscordIcon = "rbxassetid://120440277302800",
    DiscordTitle = "أنضم الى قناة السكربت",
    })

AddButton(Main, {
  Name = "نسخ حساب المطور تيك",
  Callback = function()
    setclipboard('uvon')
  end
})
AddButton(Main, {
  Name = "نسخ حساب المطور تلي",
  Callback = function()
    setclipboard('@KK_Xl')
  end
})
local Main = MakeTab({Name = "القتل او التخريب"})
local section = AddSection(Main, {"اذا جنت مفعل حمايه | القتل ماراح يشتغل وياك"})

local section = AddSection(Main, {"=========="})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local playerNames = {}
for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        table.insert(playerNames, plr.Name)
    end
end

local selectedPlayerName = nil

local Dropdown = AddDropdown(Main, {
    Name = "اختر لاعب",
    Options = playerNames,
    Default = playerNames[1],
    Callback = function(Value)
        selectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "قتل بالسفينه",
    Callback = function()
        if not selectedPlayerName then
            warn("لم يتم اختيار لاعب")
            return
        end

        MakeNotifi({
            Title = "تم التشغيل",
            Text = "لا تفعل الامر اكثر من مرا",
            Time = 5
        })

        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local originalPosition = humanoidRootPart.Position
            local originalAnchoredState = humanoidRootPart.Anchored

            humanoidRootPart.CFrame = CFrame.new(634.18, -4.00, 1839.65)
            wait(0.5)

            local args = {
                "PickingBoat",
                "MilitaryBoatFree"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            wait(1.5)

            local function sitInBoat()
                local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
                if not vehicle then return end

                local vehicleSeat = vehicle.Body:FindFirstChild("VehicleSeat")
                if not vehicleSeat then return end

                humanoidRootPart.Anchored = false
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                wait(0.2)

                humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.5, 0)
                wait(0.2)

                humanoid.Sit = true
                firetouchinterest(humanoidRootPart, vehicleSeat, 0)
                firetouchinterest(humanoidRootPart, vehicleSeat, 1)
                wait(0.5)

                if humanoid.SeatPart ~= vehicleSeat then
                    humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.5, 0)
                    humanoid.Sit = true
                    wait(0.5)
                end
            end

            sitInBoat()
            wait(0.5)

            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
            local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name .. "Car")

            if vehicle then
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0)))
                humanoidRootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 5, 0))

                local crazyStart = tick()
                while tick() - crazyStart < 2 do
                    local offset = Vector3.new(
                        math.random(-25, 12),
                        math.random(-13, 10),
                        math.random(-10, 18)
                    )
                    vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0) + offset))
                    wait(0.05)
                end
            end

            local targetDestination = Vector3.new(-86.00, -224.27, 34.57)
            if vehicle then
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetDestination))
                humanoidRootPart.CFrame = CFrame.new(targetDestination + Vector3.new(0, 5, 0))
            end

            wait(1)
            humanoidRootPart.Anchored = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

            if vehicle then
                vehicle:Destroy()
            end

            wait(0.5)
            humanoidRootPart.CFrame = CFrame.new(originalPosition)
            humanoidRootPart.Anchored = originalAnchoredState
            humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)

            local finalArgs = {
                [1] = "PickingBoat",
                [2] = "MilitaryBoatFree"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(finalArgs))

            wait(0.5)
            local deleteArgs = {
                [1] = "DeleteAllVehicles"
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(deleteArgs))
        else
            warn("اللاعب غير موجود أو لا يملك الشخصية")
        end
    end
})
local section = AddSection(Main, {"=========="})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local SelectedPlayerName = nil

local playerNames = {}
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        table.insert(playerNames, player.Name)
    end
end

local Dropdown = AddDropdown(Main, {
    Name = "اختر لاعب",
    Options = playerNames,
    Default = playerNames[1] or "",
    Callback = function(Value)
        SelectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "قتل بالباص",
    Callback = function()
        if not SelectedPlayerName then
            warn("اختر لاعبًا أولًا")
            return
        end

        local player = LocalPlayer
        local targetPlayer = Players:FindFirstChild(SelectedPlayerName)
        if not (targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then
            warn("اللاعب غير موجود أو لم يُحمّل")
            return
        end

        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        local originalPosition = humanoidRootPart.Position
        local originalAnchoredState = humanoidRootPart.Anchored

        humanoidRootPart.CFrame = CFrame.new(1082.86, 76.00, -1125.20)
        wait(0.3)

        local spawnArgs = {
            [1] = "PickingCar",
            [2] = "SchoolBus"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(spawnArgs))
        wait(3.5)

        local function sitInBus()
            local vehicleName = player.Name .. "Car"
            local vehicle = workspace.Vehicles:FindFirstChild(vehicleName)
            if not vehicle then return false end

            local vehicleSeat = vehicle.Body:FindFirstChild("VehicleSeat")
            if not vehicleSeat then return false end

            humanoidRootPart.Anchored = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

            humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.3, 0)
            wait(0.15)

            humanoid.Sit = true
            firetouchinterest(humanoidRootPart, vehicleSeat, 0)
            firetouchinterest(humanoidRootPart, vehicleSeat, 1)
            wait(0.3)

            if humanoid.SeatPart ~= vehicleSeat then
                humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.3, 0)
                humanoid.Sit = true
                wait(0.3)
            end

            return humanoid.SeatPart == vehicleSeat
        end

        if not sitInBus() then return end

        local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
        local vehicleName = player.Name .. "Car"
        local vehicle = workspace.Vehicles:FindFirstChild(vehicleName)

        if vehicle then
            local crazyStart = tick()
            while tick() - crazyStart < 2.5 do
                local offset = Vector3.new(
                    math.random(-25, 12),
                        math.random(-13, 10),
                        math.random(-10, 18)
                )
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0) + offset))
                wait(0.04)
            end
        end

        local targetDestination = Vector3.new(-86.00, -224.27, 34.57)
        if vehicle then
            vehicle:SetPrimaryPartCFrame(CFrame.new(targetDestination))
            humanoidRootPart.CFrame = CFrame.new(targetDestination + Vector3.new(0, 3, 0))
        end

        wait(0.3)
        humanoidRootPart.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

        local deleteArgs = {
            [1] = "DeleteAllVehicles"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(deleteArgs))

        wait(0.2)
        humanoidRootPart.CFrame = CFrame.new(originalPosition)
        humanoidRootPart.Anchored = originalAnchoredState
        humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    end
})
local section = AddSection(Main, {"=========="})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local SelectedPlayerName = nil

local playerNames = {}
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        table.insert(playerNames, player.Name)
    end
end

local Dropdown = AddDropdown(Main, {
    Name = "اختر لاعب",
    Options = playerNames,
    Default = playerNames[1] or "",
    Callback = function(Value)
        SelectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "سحب بالباص",
    Callback = function()
        if not SelectedPlayerName then
            warn("اختر لاعبًا أولًا")
            return
        end

        local player = LocalPlayer
        local targetPlayer = Players:FindFirstChild(SelectedPlayerName)
        if not (targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then
            warn("اللاعب غير موجود أو لم يُحمّل")
            return
        end

        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        local originalPosition = humanoidRootPart.Position
        local originalAnchoredState = humanoidRootPart.Anchored

        humanoidRootPart.CFrame = CFrame.new(1082.86, 76.00, -1125.20)
        wait(0.3)

        local spawnArgs = {
            [1] = "PickingCar",
            [2] = "SchoolBus"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(spawnArgs))
        wait(3.5)

        local function sitInBus()
            local vehicleName = player.Name .. "Car"
            local vehicle = workspace.Vehicles:FindFirstChild(vehicleName)
            if not vehicle then return false end

            local vehicleSeat = vehicle.Body:FindFirstChild("VehicleSeat")
            if not vehicleSeat then return false end

            humanoidRootPart.Anchored = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

            humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.3, 0)
            wait(0.15)

            humanoid.Sit = true
            firetouchinterest(humanoidRootPart, vehicleSeat, 0)
            firetouchinterest(humanoidRootPart, vehicleSeat, 1)
            wait(0.3)

            if humanoid.SeatPart ~= vehicleSeat then
                humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.3, 0)
                humanoid.Sit = true
                wait(0.3)
            end

            return humanoid.SeatPart == vehicleSeat
        end

        if not sitInBus() then return end

        local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
        local vehicleName = player.Name .. "Car"
        local vehicle = workspace.Vehicles:FindFirstChild(vehicleName)

        if vehicle then
            local crazyStart = tick()
            while tick() - crazyStart < 2.5 do
                local offset = Vector3.new(
                    math.random(-25, 12),
                        math.random(-13, 10),
                        math.random(-10, 18)
                )
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0) + offset))
                wait(0.04)
            end
        end

        if vehicle then
            vehicle:SetPrimaryPartCFrame(CFrame.new(originalPosition))
            humanoidRootPart.CFrame = CFrame.new(originalPosition + Vector3.new(0, 3, 0))
        end

        wait(0.3)
        humanoidRootPart.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

        local deleteArgs = {
            [1] = "DeleteAllVehicles"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(deleteArgs))

        wait(0.2)
        humanoidRootPart.CFrame = CFrame.new(originalPosition)
        humanoidRootPart.Anchored = originalAnchoredState
        humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    end
})
local section = AddSection(Main, {"=========="})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local playerNames = {}
for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        table.insert(playerNames, plr.Name)
    end
end

local selectedPlayerName = nil

local Dropdown = AddDropdown(Main, {
    Name = "اختر لاعب",
    Options = playerNames,
    Default = playerNames[1],
    Callback = function(Value)
        selectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "قتل بالسفينه الكبيره",
    Callback = function()
        if not selectedPlayerName then
            warn("لم يتم اختيار لاعب")
            return
        end

        MakeNotifi({
            Title = "تم التشغيل",
            Text = "لا تفعله اكثر من مرا",
            Time = 5
        })

        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local originalPosition = humanoidRootPart.Position
            local originalAnchoredState = humanoidRootPart.Anchored

            humanoidRootPart.CFrame = CFrame.new(634.18, -4.00, 1839.65)
            wait(0.5)

            local args = {
                "PickingBoat",
                "PirateFree"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            wait(1.5)

            local function sitInBoat()
                local vehicleSeat = workspace.Vehicles:FindFirstChild("doctonbcCar")
                if not vehicleSeat then return end

                vehicleSeat = vehicleSeat.Body:FindFirstChild("VehicleSeat")
                if not vehicleSeat then return end

                humanoidRootPart.Anchored = false
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                wait(0.2)

                humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.5, 0)
                wait(0.2)

                humanoid.Sit = true
                firetouchinterest(humanoidRootPart, vehicleSeat, 0)
                firetouchinterest(humanoidRootPart, vehicleSeat, 1)
                wait(0.5)

                if humanoid.SeatPart ~= vehicleSeat then
                    humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.5, 0)
                    humanoid.Sit = true
                    wait(0.5)
                end
            end

            sitInBoat()
            wait(0.5)

            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
            local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name .. "Car")

            if vehicle then
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0)))
                humanoidRootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 5, 0))

                local crazyStart = tick()
                while tick() - crazyStart < 2 do
                    local offset = Vector3.new(
                        math.random(-25, 12),
                        math.random(-13, 10),
                        math.random(-10, 18)
                    )
                    vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0) + offset))
                    wait(0.05)
                end
            end

            local targetDestination = Vector3.new(-86.00, -224.27, 34.57)
            if vehicle then
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetDestination))
                humanoidRootPart.CFrame = CFrame.new(targetDestination + Vector3.new(0, 5, 0))
            end

            wait(0.5)
            humanoidRootPart.Anchored = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

            if vehicle then
                vehicle:Destroy()
            end

            wait(0.5)
            humanoidRootPart.CFrame = CFrame.new(originalPosition)
            humanoidRootPart.Anchored = originalAnchoredState
            humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)

            local finalArgs = {
                [1] = "PickingBoat",
                [2] = "PirateFree"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(finalArgs))

            wait(0.5)
            local deleteArgs = {
                [1] = "DeleteAllVehicles"
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(deleteArgs))
        else
            warn("اللاعب غير موجود أو لا يملك الشخصية")
        end
    end
})
local section = AddSection(Main, {"=========="})
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local backpack = player:WaitForChild("Backpack")

local selectedPlayerName = nil

local function getPlayersNames()
    local names = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            table.insert(names, p.Name)
        end
    end
    return names
end

local Dropdown = AddDropdown(Main, {
    Name = "اختار الاعب",
    Options = getPlayersNames(),
    Default = "",
    Callback = function(Value)
        selectedPlayerName = Value
    end
})

local StartButton = AddButton(Main, {
    Name = "قتل الاعب بالكنب",
    Callback = function()
        if not selectedPlayerName then
            warn("لم يتم اختيار لاعب!")
            return
        end
        
        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            warn("اللاعب غير موجود أو شخصيته غير جاهزة")
            return
        end

        local args = {
            [1] = "PickingTools",
            [2] = "Couch"
        }
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
        task.wait(0.5)

        local tool = backpack:FindFirstChildOfClass("Tool")
        if tool then
            tool.Parent = character
        end

        local originalCFrame = humanoidRootPart.CFrame

        humanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(2, 0, 2)

        task.wait(0.2)

        local connection
        connection = RunService.Heartbeat:Connect(function()
            if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPos = targetPlayer.Character.HumanoidRootPart.Position
                local offset = Vector3.new(
                    math.random(-5,5),
                    math.random(-2,2),
                    math.random(-5,5)
                )
                humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position, targetPos + offset)
                humanoidRootPart.Velocity = (targetPos - humanoidRootPart.Position).Unit * 100
            end
        end)

        task.delay(2, function()
            connection:Disconnect()

            humanoidRootPart.CFrame = CFrame.new(Vector3.new(-86, -224.27, 34.57))

            task.wait(1)

            humanoidRootPart.CFrame = originalCFrame

            task.wait(0.1)

            local deleteArgs = {
                [1] = "PlayerWantsToDeleteTool",
                [2] = "Couch"
            }
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(deleteArgs))
        end)
    end
})
local section = AddSection(Main, {"=========="})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local backpack = localPlayer:WaitForChild("Backpack")

local fixedPosition = Vector3.new(-86.00, -224.27, 34.57)
local returnPosition = humanoidRootPart.Position

local selectedPlayerName

local function removeTool()
    for _, item in pairs(character:GetChildren()) do
        if item:IsA("Tool") then
            item.Parent = backpack
        end
    end
end

local function teleportTo(position)
    humanoidRootPart.CFrame = CFrame.new(position)
end

local function resetScript()
    character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    backpack = localPlayer:WaitForChild("Backpack")
    returnPosition = humanoidRootPart.Position
end

local function deleteToolAfterServer()
    local tool = character:FindFirstChild("Stretcher")
    if tool then
        local args = {
            [1] = "PlayerWantsToDeleteTool",
            [2] = "Stretcher"
        }
        ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))

        repeat
            task.wait(0.1)
        until not character:FindFirstChild("Stretcher")

        print("تم حذف الأداة تلقائيًا")
    end
end

local function followPlayer(targetPlayer)
    local targetChar = targetPlayer.Character
    if not targetChar then return end

    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHRP then return end

    local connection
    connection = RunService.Heartbeat:Connect(function()
        if not targetChar or not targetChar.Parent or not targetHRP then
            connection:Disconnect()
            teleportTo(fixedPosition)
            task.wait(0.5)
            deleteToolAfterServer()
            teleportTo(returnPosition)
            return
        end

        local targetHumanoid = targetChar:FindFirstChild("Humanoid")
        if targetHumanoid and targetHumanoid.Sit then
            connection:Disconnect()
            teleportTo(fixedPosition)
            task.wait(0.5)
            deleteToolAfterServer()
            teleportTo(returnPosition)
            return
        end

        humanoidRootPart.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)
    end)
end

local function pickToolAndFollow(targetPlayer)
    local args = {
        [1] = "PickingTools",
        [2] = "Stretcher"
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))

    local tool
    repeat
        task.wait(0.1)
        tool = backpack:FindFirstChild("Stretcher")
    until tool

    tool.Parent = character

    followPlayer(targetPlayer)
end

local function getPlayerNames()
    local playerNames = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local Dropdown = AddDropdown(Main, {
    Name = "اختر اللاعب",
    Options = getPlayerNames(),
    Default = "",
    Callback = function(Value)
        selectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "قتل بالكرسي",
    Callback = function()
        if selectedPlayerName then
            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
            if targetPlayer then
                resetScript()
                pickToolAndFollow(targetPlayer)
            else
                warn("اللاعب مو موجود!")
            end
        else
            warn("اختار لاعب اول!")
        end
    end
})

localPlayer.CharacterAdded:Connect(resetScript)
local section = AddSection(Main, {"=========="})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local backpack = localPlayer:WaitForChild("Backpack")

local function deleteToolAfterServer()
    local tool = character:FindFirstChild("Stretcher")
    if tool then
        local args = {
            [1] = "PlayerWantsToDeleteTool",
            [2] = "Stretcher"
        }
        ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))

        repeat
            task.wait(0.1)
        until not character:FindFirstChild("Stretcher")
    end
end

local function pickTool()
    local args = {
        [1] = "PickingTools",
        [2] = "Stretcher"
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))

    local tool
    repeat
        task.wait(0.1)
        tool = backpack:FindFirstChild("Stretcher")
    until tool

    tool.Parent = character
end

local function followPlayer(targetPlayer)
    local targetChar = targetPlayer.Character
    if not targetChar then return end

    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHRP then return end

    local originalPosition = humanoidRootPart.Position
    local connection

    connection = RunService.Heartbeat:Connect(function()
        if not targetChar or not targetChar.Parent or not targetHRP then
            connection:Disconnect()
            humanoidRootPart.CFrame = CFrame.new(originalPosition)
            deleteToolAfterServer()
            return
        end

        local targetHumanoid = targetChar:FindFirstChild("Humanoid")
        if targetHumanoid and targetHumanoid.Sit then
            connection:Disconnect()
            humanoidRootPart.CFrame = CFrame.new(originalPosition)
            deleteToolAfterServer()
            return
        end

        humanoidRootPart.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)
    end)
end

local function getPlayerNames()
    local playerNames = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local selectedPlayerName
local Dropdown = AddDropdown(Main, {
    Name = "اختر اللاعب",
    Options = getPlayerNames(),
    Default = "",
    Callback = function(Value)
        selectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "سحب بالكرسي",
    Callback = function()
        if selectedPlayerName then
            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
            if targetPlayer then
                pickTool()
                followPlayer(targetPlayer)
            else
                warn("اللاعب مو موجود!")
            end
        else
            warn("اختار لاعب اول!")
        end
    end
})
local section = AddSection(Main, {"=========="})
local Main = MakeTab({Name = "اغاني سب وازعاج"})
local SoundId = ""

AddTextBox(Main, {
    Name = "اكتب كود الأغنية",
    Default = "",
    PlaceholderText = "ضع الكود هنا",
    ClearText = true,
    Callback = function(Value)
        SoundId = Value
    end
})

AddButton(Main, {
    Name = "تشغيل",
    Callback = function()
        local args1 = {
            [1] = "SkateBoard"
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args1))

        local args2 = {
            [1] = "PickingScooterMusicText",
            [2] = SoundId
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args2))
    end
})

AddSection(Main, {"اغاني السب والازعاج"})
AddButton(Main, {
  Name = "السب رقم 1",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "6713993281"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "السب رقم 2",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7183326833"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "السب رقم 3",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "6536444735"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "السب رقم 4",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7942547789"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddSection(Main, {"الازعاج"})
AddButton(Main, {
  Name = "ازعاج 1",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "9108676586"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "ازعاج 2",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "4776398821"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "ازعاج 3",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "16190784875"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "صليل الصوارم",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "135009652401688"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "الله اكبر (تفجير) ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "112885470931928"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه ايرانيه (حربكه) ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "73352238398867"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه هنديه",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "1843530001"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه باك رومز",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "120817494107898"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه عربيه ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "113546449124802"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "دبجه",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "90807238125839"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "اه يا حلو",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "93620598835551"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "امبيه",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7657178494"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه عراقيه كرنج",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "111256095783364"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "هم عراقيه وهم كرنج",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "73632319736202"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "هم اغنيه عراقيه كرنجج ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "72918998227337"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "شلغه وراح تعرف اكرنج لو لا",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "93387586724251"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه مصريه",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "126863477912372"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه مصريه 2",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "106169760792625"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "يا بكاية ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "98640789490482"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "محمد عبد",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "131507511127909"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddSection(Main, {"شكرا للاخ @u7ui8i"})
local sounds = {
    ["فورتنيات الببجي"] = "8671258578",
    ["برازيلي"] = "104541292443133",
    ["هنديه"] = "98757377820359",
    ["شعر شيعي"] = "98224127892587",
    ["قران 9"] = "86911769585232",
    ["في عالم"] = "125151253990122",
    ["قران 6"] = "133272041755020",
    ["قران 5"] = "88269497623993",
    ["حزين 2"] = "135308045",
    ["قرأن ٤"] = "90593176828958",
    ["الحمدلله"] = "7609175072",
    ["اذان"] = "1836685881",
    ["قرأن2"] = "1836685929",
    ["قرأن"] = "4711690175",
    ["جاء الليل"] = "132182002773837",
    ["صلو علنبي"] = "9108676586",
    ["السلام عليكم"] = "7038667176",
    ["كريسماس"] = "1841342574",
    ["صدام"] = "8273849195",
    ["ويه ويه"] = "1164198099",
    ["حبيبي شنو في"] = "7657178494",
    ["اغنيه مصريه حب"] = "93620598835551",
    ["عراقي حزين"] = "80039364766636",
    ["موسيقى حماس"] = "128018172854846",
    ["دبجه"] = "76698985299412",
    ["ازعاج"] = "4776398821",
    ["ضراط"] = "4809574295",
    ["عود قوي"] = "114157294180725",
    ["عود حزين"] = "104085669063530",
    ["يمني وين الوفاء"] = "116150415085902",
    ["اغنيه حزينه"] = "132378395114388",
    ["سب4"] = "8701632845",
    ["سب3"] = "6713993281",
    ["سعودي حزين"] = "99123490695024",
    ["اغنيه سوريه"] = "98640789490482",
    ["اهات 😂"] = "8107899910",
    ["اغنيه خليجيه"] = "127593500790634",
    ["سب2"] = "6536444735",
    ["رعب"] = "1848748988",
    ["سبونج بوب"] = "2396797933",
    ["اغنيه عرببه"] = "1836685799",
    ["اوووو"] = "93123670572331",
    ["ناني"] = "8842446965",
    ["صوت مطي"] = "6900670817",
    ["حقود"] = "4533138868",
    ["مايكل جاكسن"] = "7061299253",
    ["هديها شوي"] = "7644757406",
    ["ريمكس"] = "16190783774",
    ["سب5"] = "5849978429",
    ["رمي"] = "2838571776",
    ["سب"] = "7942547789",
    ["تفحيط 2"] = "7173073353",
    ["حزين"] = "1845920238"
}

for name, code in pairs(sounds) do
    AddButton(Main, {
        Name = name,
        Callback = function()
            local args1 = { [1] = "SkateBoard" }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args1))

            local args2 = {
                [1] = "PickingScooterMusicText",
                [2] = code
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args2))
        end
    })
end
local Main = MakeTab({Name = "سكنات"})
AddSection(Main, {"نسخ سكنات"})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local RemoteWear = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear")
local RemoteBody = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody")

local function Notify(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 3
    })
end

local function Wear(id)
    if id and id ~= 0 then
        RemoteWear:InvokeServer(id)
    end
end

local function ApplySkinTone(player)
    local char = player.Character or player.CharacterAdded:Wait()
    local bodyColors = char:FindFirstChildOfClass("BodyColors")
    if bodyColors then
        Wear(bodyColors.HeadColor.Name)
    end
end

local function CopyClothing(player)
    local h = (player.Character or player.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid")
    if h then
        local d = h:GetAppliedDescription()
        for _, id in ipairs({d.Shirt, d.Pants, d.GraphicTShirt}) do
            Wear(id)
            task.wait(0.2)
        end
    end
end

local function CopyAccessories(player)
    local h = (player.Character or player.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid")
    if h then
        local d = h:GetAppliedDescription()
        local all = {
            d.HatAccessory, d.HairAccessory, d.FaceAccessory,
            d.NeckAccessory, d.ShouldersAccessory, d.FrontAccessory,
            d.BackAccessory, d.WaistAccessory
        }
        for _, accList in ipairs(all) do
            for id in string.gmatch(accList, "%d+") do
                Wear(tonumber(id))
                task.wait(0.2)
            end
        end
    end
end

local function CopyBodyParts(player)
    local h = (player.Character or player.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid")
    if h then
        local d = h:GetAppliedDescription()
        local bodyIds = {
            d.Torso, d.RightArm, d.LeftArm,
            d.RightLeg, d.LeftLeg, d.Head
        }
        RemoteBody:InvokeServer(bodyIds)
    end
end


local selectedPlayer = nil

local function GetPlayerList()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= Players.LocalPlayer then
            table.insert(list, p.Name)
        end
    end
    return list
end

AddDropdown(Main, {
    Name = "اختار اللاعب",
    Default = "",
    Options = GetPlayerList(),
    Callback = function(value)
        selectedPlayer = value
    end
})

AddButton(Main, {
    Name = "نسخ السكن",
    Callback = function()
        if not selectedPlayer then
            Notify("خطأ", "يجب اختيار لاعب أولاً")
            return
        end

        local player = Players:FindFirstChild(selectedPlayer)
        if not player then return end

        Notify("جاري النسخ", "جاري نسخ سكن " .. player.Name)

        task.spawn(function()
            CopyBodyParts(player)
            task.wait(0.3)
            ApplySkinTone(player)
            task.wait(0.3)
            CopyClothing(player)
            task.wait(0.3)
            CopyAccessories(player)
            Notify("تم النسخ", "تم نسخ سكن " .. player.Name .. " بنجاح!")
        end)
    end
})
AddSection(Main, {"سكنات عشوائيه"})
AddButton(Main, {
  Name = "سكن هاك",
  Callback = function()
    local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 0
    },
    [3] = "GAZE"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
local args = {
    [1] = "Really black"
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 6429144833
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 11753123667
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 311450131
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 132809431
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 305888394
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 13911241594
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 4786872560
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 33070696
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 226189871
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 150381051
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 14290954023
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 14763453479
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سكن بزونه كيوت",
  Callback = function()
    local args = {16300856317}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن عصفور",
  Callback = function()
    local args = {125340284280306}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن توم",
  Callback = function()
    local args = {7815700752273}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن بطريق كيوت",
  Callback = function()
    local args = {127922357595147}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "سكن دجاجه",
  Callback = function()
    local args = {91756266312256}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن بينجوينو",
  Callback = function()
    local args = {94944293759578}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن تونج تونج ساهور",
  Callback = function()
    local args = {117098257036480}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن بومبارديلو تمساح",
  Callback = function()
    local args = {101715679276356}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن جاتو ميمي لوراندو",
  Callback = function()
    local args = {118086993144717}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

local Main = MakeTab({Name = "اكسسوارات "})
local section = AddSection(Main, {"الرؤوس"})
AddButton(Main, {
  Name = "راس روبوت",
  Callback = function()
    local args = {
    [1] = 14960720067
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "راس مخفي",
  Callback = function()
    local args = {
    [1] = 134082579
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "راس روكر",
  Callback = function()
    local args = {
    [1] = 16580493236
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "راس كيوت",
  Callback = function()
    local args = {
    [1] = 746767604
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
local section = AddSection(Main, {"الرجل"})
AddButton(Main, {
  Name = "تنحط بل رجل حمراء",
  Callback = function()
    local args = {
        [1] = 14388001192
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "تنحط بل رجل بيضاء",
  Callback = function()
    local args = {
        [1] = 14388009243
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "بزازت مال رجلين",
  Callback = function()
    local args = {
        [1] = 13463290106
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "مخده سوده تنحط بل رجلين",
  Callback = function()
    local args = {
        [1] = 101836206044298
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "بيضه تحط بل رجلين",
  Callback = function()
    local args = {
        [1] = 11111279400
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "مخده تنحط بل رجل بيضه و سوده",
  Callback = function()
    local args = {
        [1] = 14387999337
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "مخده بيضه تنحط بل رجلين",
  Callback = function()
    local args = {
        [1] = 90926188446523
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "تنحط بل رجل مخده تشك شگ",
  Callback = function()
    local args = {
        [1] = 14388006902
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "مخده سوده تنحط بل رجل",
  Callback = function()
    local args = {
        [1] = 14388004031
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
local section = AddSection(Main, {"اليد"})
AddButton(Main, {
  Name = "بزازت مال ادين",
  Callback = function()
    local args = {
        [1] = 13463292395
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "جفوف صغار",
  Callback = function()
    local args = {
        [1] = 14134136352
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "جفوف كبار ما ادين",
  Callback = function()
    local args = {
        [1] = 115529577360949
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "جفوف كبار بلون الابيض",
  Callback = function()
    local args = {
        [1] = 128527713198404
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "جفوف مشككات مال ادين",
  Callback = function()
    local args = {
        [1] = 9239689111
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "بيضه تنحط بل ادين",
  Callback = function()
    local args = {
        [1] = 11111279400
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
local section = AddSection(Main, {"قريبا اشياء اكثر"})
local Main = MakeTab({Name = "البيت"})
local selectedHouse = 1 -- رقم افتراضي

-- قائمة اختيار رقم البيت
local Dropdown = AddDropdown(Main, {
  Name = "اختر رقم البيت",
  Options = {"1","2","3","4","5","6","7","11","12","13","14","15","16","17","18","19","20","21","22","23","24"},
  Default = "1",
  Callback = function(Value)
    selectedHouse = tonumber(Value)
  end
})

-- زر لأخذ التحكم
AddButton(Main, {
  Name = "خذ تحكم البيت",
  Callback = function()
    local args = {
      [1] = "GivePermissionLoopToServer",
      [2] = game:GetService("Players").LocalPlayer,
      [3] = selectedHouse
    }

    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "  	كراج تفتحة وتسده",
  Callback = function()
					local args = {
						[1] = "GarageDoor"
					}
					game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(args))
end
})




AddButton(Main, {
  Name = "  شباك تفتحة  وتسده",
  Callback = function()
					local args = {
						[1] = "Curtains"
					}
					game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(args))
end
})



AddButton(Main, {
  Name = " قفل البيت",
  Callback = function()
					local args = {
						[1] = "LockDoors"
					}
					game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(args))
end 
})
local Main = MakeTab({Name = "رحمه"})
AddSection(Main, {"رحمه"})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function fetchPlayerNames()
    local namesList = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= Players.LocalPlayer then 
            table.insert(namesList, plr.Name)
        end
    end
    return namesList
end

local dropdown = AddDropdown(Main, {
    Name = "اختر الاعب",
    Default = "...",
    Options = fetchPlayerNames(),
    Callback = function(Value)
        if Value ~= "" then
            getgenv().selectedPlayer = Value
        end
    end
})

local function createBangToggle(name, yOffset, faceBang)
    local bangActive = false
    local connection
    local togglePosition = false

    AddToggle(Main, {
        Name = name,
        Default = false,
        Callback = function(Value)
            bangActive = Value

            local player = Players.LocalPlayer
            local char = player.Character
            if not char then return end

            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if not humanoid then return end

            if Value then
                humanoid.PlatformStand = true

                if connection then connection:Disconnect() end

                connection = RunService.Heartbeat:Connect(function()
                    if bangActive and getgenv().selectedPlayer then
                        local targetPlayer = Players:FindFirstChild(getgenv().selectedPlayer)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character.PrimaryPart then
                            local targetHead = targetPlayer.Character:FindFirstChild("Head")
                            if targetHead and char.PrimaryPart then
                                local offset = togglePosition and 1 or 4
                                if faceBang then
                                    char:SetPrimaryPartCFrame(targetHead.CFrame * CFrame.new(0, 1, -offset) * CFrame.Angles(0, math.rad(180), 0))
                                else
                                    char:SetPrimaryPartCFrame(targetHead.CFrame * CFrame.new(0, yOffset, offset) * CFrame.Angles(0, 0, 0))
                                end
                                togglePosition = not togglePosition
                                wait(1)
                            end
                        end
                    end
                end)
            else
                humanoid.PlatformStand = false
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
            end
        end    
    })
end

createBangToggle("Bang", -1, false)
createBangToggle("Bang 2", -1.5, false)
createBangToggle("الوجه Bang", 1, true)
createBangToggle("الوجه Bang 2", 1, true)

local Main = MakeTab({Name = "الحمايه"})
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local fallLimitY = -20
local safePosition = Vector3.new(0, 10, 0)

local enabled = false
local connection

player.CharacterAdded:Connect(function(char)
	character = char
	humanoid = char:WaitForChild("Humanoid")
end)

local Toggle = AddToggle(Main, {
	Name = "حمايه من الجلوس",
	Default = false,
	Callback = function(Value)
		enabled = Value
		if enabled then
			connection = game:GetService("RunService").Heartbeat:Connect(function()
				if character and humanoid and humanoid.RootPart then
					if humanoid.RootPart.Position.Y < fallLimitY then
						character:SetPrimaryPartCFrame(CFrame.new(safePosition))
					end
					if humanoid.Sit then
						humanoid.Sit = false
					end
					if humanoid.HipHeight < 1.5 then
						humanoid.HipHeight = 2
					end
					if humanoid.WalkSpeed ~= 16 then
						humanoid.WalkSpeed = 16
					end
					if humanoid.JumpPower ~= 50 then
						humanoid.JumpPower = 50
					end
				end
			end)
		else
			if connection then
				connection:Disconnect()
				connection = nil
			end
		end
	end
})
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local safePosition = Vector3.new(0, 10, 0)
local fallLimitY = -20

local enabled = false
local connection

player.CharacterAdded:Connect(function(char)
	character = char
	humanoidRootPart = char:WaitForChild("HumanoidRootPart")
end)

local Toggle = AddToggle(Main, {
	Name = "حماي من الفيلنق",
	Default = false,
	Callback = function(Value)
		enabled = Value
		if enabled then
			connection = game:GetService("RunService").Heartbeat:Connect(function()
				if humanoidRootPart and humanoidRootPart.Position.Y < fallLimitY then
					character:SetPrimaryPartCFrame(CFrame.new(safePosition))
				end
			end)
		else
			if connection then
				connection:Disconnect()
				connection = nil
			end
		end
	end
})
local Main = MakeTab({Name = "تنقلات"})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local playerNames = {}
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        table.insert(playerNames, player.Name)
    end
end

local selectedPlayer = nil

local Dropdown = AddDropdown(Main, {
    Name = "اختَر لاعب",
    Options = playerNames,
    Default = playerNames[1] or "",
    Callback = function(Value)
        selectedPlayer = Value
    end
})

AddButton(Main, {
    Name = "انتقال إلى اللاعب",
    Callback = function()
        if selectedPlayer then
            local targetPlayer = Players:FindFirstChild(selectedPlayer)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
            end
        end
    end
})
AddSection(Main, {"اماكن الماب"})
AddButton(Main, {
    Name = "لوحة 1",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        local hrp = char:FindFirstChild("HumanoidRootPart")

        if hrp then
            hrp.CFrame = CFrame.new(-242.68215942382812, 89.68680572509766, -549.6495361328125)
        else
            warn("HumanoidRootPart not found")
        end
    end
})

AddButton(Main, {
    Name = "لوحة 2",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        local hrp = char:FindFirstChild("HumanoidRootPart")

        if hrp then
            hrp.CFrame = CFrame.new(-630.480712890625, 26.586822509765625, 365.14093017578125)
        else
            warn("HumanoidRootPart not found")
        end
    end
})

-- Function to teleport to Teleport
local function teleportToGasStation()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(192, 4, 272)
end

AddButton(Main, {
    Name = "ورا البيوت",
    Description = "",
    Callback = teleportToGasStation
})

-- Function to teleport to Teleport
local function teleportToCenter()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136, 4, 117)
end

AddButton(Main, {
    Name = "قدام البيوت",
    Description = "",
    Callback = teleportToCenter
})

-- Function to teleport to Criminal
local function teleportToCriminal()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-119, -28, 235)
end

AddButton(Main, {
    Name = "مكان أسلحة",
    Description = "Teleporta para as coordenadas do Criminal",
    Callback = teleportToCriminal
})

-- Function to teleport to House Abandoned
local function teleportToHouseAbandoned()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(986, 4, 63)
end

AddButton(Main, {
    Name = "بيت قفير",
    Description = "Teleporta para as coordenadas da Casa Abandonada",
    Callback = teleportToHouseAbandoned
})

-- Function to teleport to Portal Agency
local function teleportToPortalAgency()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(672, 4, -296)
end

AddButton(Main, {
    Name = "مكان سري",
    Description = "Teleporta para as coordenadas do Portal da Agência",
    Callback = teleportToPortalAgency
})

-- Function to teleport to Secret Location
local function teleportToSecretLocation()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(505, -75, 143)
end

AddButton(Main, {
    Name = "جو الأرض",
    Description = "Teleporta para as coordenadas do Local Secreto",
    Callback = teleportToSecretLocation
})

-- Function to teleport to School
local function teleportToSchool()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-312, 4, 211)
end

AddButton(Main, {
    Name = "مدرسة",
    Description = "Teleporta para as coordenadas da Escola",
    Callback = teleportToSchool
})

-- Function to teleport to Brooks Diner
local function teleportToBrooksDiner()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(161, 8, 52)
end

AddButton(Main, {
    Name = "قهوة",
    Description = "Teleporta para as coordenadas do Brooks Diner",
    Callback = teleportToBrooksDiner
})

local function teleportToBrooksDiner()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-26, 4, -23)
end

AddButton(Main, {
    Name = "البداية",
    Description = "Teleporta para as coordenadas do Brooks Diner",
    Callback = teleportToBrooksDiner
})


-- Function to teleport to Hospital
local function teleportToHospital()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-309, 4, 71)
end

AddButton(Main, {
    Name = "مستشفى",
    Description = "Teleporta para as coordenadas do Hospital",
    Callback = teleportToHospital
})

-- Function to teleport to Arch
local function teleportToArch()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-589, 141, -59)
end

AddButton(Main, {
    Name = "فوق الجسر",
    Description = "Teleporta para as coordenadas do Arco",
    Callback = teleportToArch
})

-- Function to teleport to Agency
local function teleportToAgency()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(179, 4, -464)
end

AddButton(Main, {
    Name = "مكان الكهرباء",
    Description = "Teleporta para as coordenadas da Agência",
    Callback = teleportToAgency
})

-- Function to teleport to Secret Room in Workshop
local function teleportToSecretRoomInWorkshop()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 4, -495)
end

AddButton(Main, {
    Name = "جو الأرض",
    Description = "Teleporta para as coordenadas da Sala Secreta na Oficina",
    Callback = teleportToSecretRoomInWorkshop
})

-- Function to teleport to Secret Room 2
local function teleportToSecretRoom2()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-343, 4, -613)
end

AddButton(Main, {
    Name = "جو الأرض 2",
    Description = "Teleporta para as coordenadas da Sala Secreta 2",
    Callback = teleportToSecretRoom2
})

-- Function to teleport to Island 1
local function teleportToIsland1()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1925, 23, 127)
end

AddButton(Main, {
    Name = "جزيرة 1",
    Description = "Teleporta para as coordenadas da Ilha 1",
    Callback = teleportToIsland1
})

-- Function to teleport to Airport
local function teleportToAirport()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(310, 5, 31)
end

AddButton(Main, {
    Name = "مطار",
    Description = "Teleporta para as coordenadas do Aeroporto",
    Callback = teleportToAirport
})

-- Function to teleport to Hotel Center
local function teleportToHotelCenter()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(182, 4, 150)
end

AddButton(Main, {
    Name = "البيوت",
    Description = "Teleporta para as coordenadas do Centro dos Hotéis",
    Callback = teleportToHotelCenter
})

-- Function to teleport to Lower Houses
local function teleportToLowerHouses()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63, 35, 410)
end

AddButton(Main, {
    Name = " نص الشارع",
    Description = "Teleporta para as coordenadas das Casas Inferiores",
    Callback = teleportToLowerHouses
})

-- Function to teleport to Mountain 1
local function teleportToMountain1()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-670, 251, 765)
end

AddButton(Main, {
    Name = "فوق الجبل",
    Description = "Teleporta para as coordenadas da Montanha 1",
    Callback = teleportToMountain1
})

-- Function to teleport to On Top of School
local function teleportToOnTopOfSchool()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-370, 50, 173)
end

AddButton(Main, {
    Name = "فوق المدرسة",
    Description = "Teleporta para as coordenadas Em Cima da Escola",
    Callback = teleportToOnTopOfSchool
})
local Main = MakeTab({Name = "يمكن تفيدك"})
AddTextBox(Main, {
  Name = "سرعة",
  Default = "",
  PlaceholderText = "ادخل رقم",
  ClearText = true,
  Callback = function(value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value     
 end
})
AddTextBox(Main, {
  Name = "قفز",
  Default = "",
  PlaceholderText = "ادخل رقم",
  ClearText = true,
  Callback = function(value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = value    
  end
})
AddTextBox(Main, {
  Name = "شاشه",
  Default = "",
  PlaceholderText = "ادخل رقم",
  ClearText = true,
  Callback = function(value)
local FovNumber = value
local Camera = workspace.CurrentCamera
Camera.FieldOfView = FovNumber  
  end
})
AddTextBox(Main, {
  Name = "دوران",
  Default = "",
  PlaceholderText = "ادخل رقم",
  ClearText = true,
  Callback = function(Value)
    getgenv().Spinspeed = Value

local Spin = Instance.new'BodyAngularVelocity'
Spin.Parent = game:GetService'Players'.LocalPlayer.Character:FindFirstChild'HumanoidRootPart'
Spin.MaxTorque = Vector3.new(0, math.huge, 100)
wait(0.1)
Spin.AngularVelocity = Vector3.new(100,Spinspeed,0)
  end
})
local infiniteJumpEnabled = false

-- Conectar o evento de pulo somente uma vez
local infiniteJumpConnection

-- Função de callback para o botão de alternância de pulo infinito
local function onInfiniteJumpToggle(value)
    infiniteJumpEnabled = value
    print("Infinite Jump Enabled:", infiniteJumpEnabled)
    
    -- Conectar o evento de pulo somente uma vez
    if not infiniteJumpConnection then
        infiniteJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            if infiniteJumpEnabled then
                local player = game.Players.LocalPlayer
                local character = player.Character
                if character and character:FindFirstChildOfClass("Humanoid") then
                    character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end
        end)
    end
end

-- Adiciona o botão de alternância "Infinitejump"
local Toggle = AddToggle(Main, {
    Name = "قفز لا نهائي",
    Default = false,
    Callback = onInfiniteJumpToggle
})
function MakeNotifi(notification)
    game.StarterGui:SetCore("SendNotification", {
        Title = notification.Title;
        Text = notification.Text;
        Duration = notification.Time;
    })
end
function MakeNotifi(notification)
    game.StarterGui:SetCore("SendNotification", {
        Title = notification.Title;
        Text = notification.Text;
        Duration = notification.Time;
    })
end

-- Variáveis e funções para a visualização dos jogadores
local viewEnabled = false
local selectedViewPlayer = nil
local characterAddedConnection = nil

local function toggleView(enabled)
    if enabled then
        if selectedViewPlayer then
            local player = selectedViewPlayer
            if player then
                game.Workspace.CurrentCamera.CameraSubject = player.Character
                if characterAddedConnection then
                    characterAddedConnection:Disconnect()
                end
                characterAddedConnection = player.CharacterAdded:Connect(function(character)
                    game.Workspace.CurrentCamera.CameraSubject = character
                end)
                MakeNotifi({
                    Title = "Visualizando " .. player.Name,
                    Text = "Você está visualizando o jogador: " .. player.Name,
                    Time = 6
                })
            else
                print("Jogador não encontrado.")
                viewEnabled = false
            end
        else
            print("Nenhum jogador selecionado para a visualização.")
            viewEnabled = false
        end
    else
        if characterAddedConnection then
            characterAddedConnection:Disconnect()
            characterAddedConnection = nil
        end
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    end
end

local value = "" -- Variável para armazenar o nome digitado

local function findPlayerByPartialNameOrNickname(partialName)
    value = partialName -- Atualiza a variável com o nome digitado completo
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name:lower():find(partialName:lower(), 1, true) or (player.DisplayName and player.DisplayName:lower():find(partialName:lower(), 1, true)) then
            return player
        end
    end
    return nil
end

-- Adicionando a caixa de texto para entrada do nome ou apelido do jogador
AddTextBox(Main, {
    Name = " دخل اول ثلاث أحرف من اسم اللاعب",
    Default = "",
    PlaceholderText = "دخل اسم اللاعب",
    ClearText = true,
    Callback = function(value)
        if value == "" then
            MakeNotifi({
                Title = "Erro",
                Text = "Nome do jogador não foi digitado.",
                Time = 5
            })
            if viewEnabled then
                toggleView(false)
            end
            return
        end

        selectedViewPlayer = findPlayerByPartialNameOrNickname(value)
        if selectedViewPlayer then
            print("Jogador encontrado: " .. selectedViewPlayer.Name)
            if viewEnabled then
                toggleView(false)
                toggleView(true)
            end
        else
            MakeNotifi({
                Title = "Erro",
                Text = "Nenhum jogador encontrado com esse nome ou apelido.",
                Time = 7
            })
            if viewEnabled then
                toggleView(false)
            end
        end
    end
})

-- Adicionando o toggle para ativar/desativar a visualização
AddToggle(Main, {
    Name = "شاهد",
    Default = false,
    Callback = function(enabled)
        viewEnabled = enabled
        toggleView(enabled)
    end
})

-- Conectando eventos de jogador removido
game.Players.PlayerRemoving:Connect(function(player)
    if selectedViewPlayer == player then
        selectedViewPlayer = nil
        if viewEnabled then
            toggleView(false)
            MakeNotifi({
                Title = "Jogador Saiu",
                Text = player.Name .. " saiu do jogo. Visualização desativada.",
                Time = 5
            })
        end
    end
end)

-- Função para manter a câmera no jogador selecionado
local function maintainView()
    while wait() do
        if viewEnabled and selectedViewPlayer then
            local player = selectedViewPlayer
            if player and game.Workspace.CurrentCamera.CameraSubject ~= player.Character then
                game.Workspace.CurrentCamera.CameraSubject = player.Character
            end
        end
    end
end
AddButton(Main, {
  Name = "اختفاء اللاعب",
  Callback = function()
    local args = {
    [1] = "CharacterSizeUp",
    [2] = 6
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "إلغاء اختفاء",
  Callback = function()
    local args = {
    [1] = "CharacterSizeUp",
    [2] = 1
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  end
})
-- Variável para controlar o estado do Noclip
local noclipEnabled = false
local runService = game:GetService("RunService")

-- Função para definir CanCollide para todas as partes do personagem
local function setCharacterCanCollide(character, canCollide)
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = canCollide
        end
    end
end

-- Função de callback para o botão de alternância de Noclip
local function onNoclipToggle(value)
    noclipEnabled = value
    print("Noclip Enabled:", noclipEnabled)
    
    local player = game.Players.LocalPlayer
    local character = player.Character

    if noclipEnabled then
        -- Inicia um loop para continuamente definir CanCollide
        noclipLoop = runService.Stepped:Connect(function()
            if character then
                setCharacterCanCollide(character, false)
            end
        end)
    else
        -- Desativa o loop e restaura CanCollide
        if noclipLoop then
            noclipLoop:Disconnect()
        end
        if character then
            setCharacterCanCollide(character, true)
        end
    end
end

-- Adiciona o botão de alternância "Noclip"
local Toggle = AddToggle(Main, {
    Name = " اختراق الجدار",
    Default = false,
    Callback = onNoclipToggle
})
AddButton(Main, {
  Name = "الطيران",
  Callback = function()
  loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
  end
})
AddButton(Main, {
Name = "قفل",
Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Luarmor123/community-Y-HUB/refs/heads/main/Shiftlock"))()
  end
})
AddButton(Main, {
  Name = " اعاده دخول الى سيرفر ",
  Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/j2ex7NdF"))()
  end
})
AddButton(Main, {
  Name = "احذف جميع الأشياء الي في ايدك",
  Callback = function()
    local args = {
    [1] = "ClearAllTools"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اقتل نفسك",
  Callback = function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
  end
})
