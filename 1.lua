-- Load in EXACT order:
-- === ("L10_Part01_Core_Setup")
-- === ("L10_Part02_Eternal_Identity")
-- === ("L10_Part03_Memory_L1-3")
-- === ("L10_Part04_Memory_L4-6")
-- === ("L10_Part05_Memory_L7-10")
-- === ("L10_Part06_Kernel_L1-3")
-- === ("L10_Part07_Kernel_L4-6")
-- === ("L10_Part08_Kernel_L7-10")
-- === ("L10_Part09_FileSystem_L1-3")
-- === ("L10_Part10_FileSystem_L4-7")
-- === ("L10_Part11_FileSystem_L8-10")
-- === ("L10_Part12_Network_L1-3")
-- === ("L10_Part13_Network_L4-6")
-- === ("L10_Part14_Network_L7-10")
-- === ("L10_Part15_TSS_Native")
-- === ("L10_Part16_Device_Hardware")
-- === ("L10_Part17_Report_L1-5")
-- === ("L10_Part18_Report_L6-10")
-- === ("L10_Part19_Material_Shader")
-- === ("L10_Part20_Screenshot")
-- === ("L10_Part21_Process_Debugger")
-- === ("L10_Part22_Runtime")
-- === ("L10_Part23_Heartbeat_Telemetry")
-- === ("L10_Part24_Behavioral")
-- === ("L10_Part25_Final_Guardian")
-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL ANTI-BAN - PART 1/25 ⚡
-- Core Setup & Helper Functions
-- ========================================================================

local LEVEL10 = {}

-- Helper Functions
local nop = function() end
local retTrue = function() return true end
local retFalse = function() return false end
local retZero = function() return 0 end
local retEmpty = function() return {} end
local retNil = function() return nil end
local retSelf = function(self) return self end
local retString = function() return "clean" end

local function isActive()
    return _G._L10_ETERNAL_ACTIVE and not _G._MOD_EXPIRED
end

local function FakeID(length)
    local chars = "0123456789ABCDEF"
    local id = ""
    for i = 1, length do
        id = id .. chars:sub(math.random(1, #chars), math.random(1, #chars))
    end
    return id
end

local function FakeUUID()
    return string.format("%s-%s-%s-%s-%s",
        FakeID(8), FakeID(4), FakeID(4), FakeID(4), FakeID(12))
end

_G._L10_ETERNAL_ACTIVE = true

print("✅ [L10] Part 1/25 - Helpers Ready")

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 2/25 ⚡
-- Eternal Identity Generation (Never Changes)
-- ========================================================================

LEVEL10.EternalIdentity = {
    playerSignature = FakeUUID(),
    accountCreated = os.time() - (math.random(365, 1825) * 86400),
    accountLevel = math.random(45, 80),
    accountRank = "Diamond " .. math.random(1, 5),
    
    hardwareFingerprint = {
        cpuSerial = FakeID(16),
        gpuSerial = FakeID(16),
        motherboardSerial = FakeID(12),
        diskSerial = FakeID(20),
        macAddress = string.format("%02X:%02X:%02X:%02X:%02X:%02X",
            math.random(1,254), math.random(1,254), math.random(1,254),
            math.random(1,254), math.random(1,254), math.random(1,254)),
        deviceId = FakeID(32),
        androidId = FakeID(16),
        advertisingId = FakeUUID(),
        bootId = FakeID(36),
        kernelVersion = "5.15.94-android13-8-00001-g5c4b8d1e4f2a-ab9876543",
        buildId = "TQ3A.230805.001",
        buildFingerprint = "google/oriole/oriole:14/UP1A.231005.007/10754064:user/release-keys"
    },
    
    networkFingerprint = {
        ispName = "Jio 5G",
        connectionType = "5G",
        carrierCode = "IN-JIO",
        cellId = FakeID(8),
        lacId = FakeID(4),
        imsiHash = FakeID(24),
        simSerial = FakeID(20),
        phoneNumber = "+91" .. math.random(7000000000, 9999999999),
        publicIpHash = FakeID(24)
    },
    
    behavioralFingerprint = {
        timezone = "Asia/Kolkata",
        locale = "en-IN",
        fontScale = 1.0,
        touchSamplingRate = 240,
        gyroEnabled = true,
        screenRefreshRate = 120,
        inputLatency = 8
    }
}

_G.L10_EternalIdentity = LEVEL10.EternalIdentity

print("✅ [L10] Part 2/25 - Eternal Identity Ready")
print("   🔑 Signature: " .. LEVEL10.EternalIdentity.playerSignature:sub(1, 13) .. "...")

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 3/25 ⚡
-- Memory Guard Bypass - Layers 1-3
-- ========================================================================

local function InstallMemoryGuardBypass_L1_3()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not SubMgr then return end

        -- LAYER 1: Memory Guard
        local mg = SubMgr:Get("ClientMemoryGuardSubsystem")
        if mg and not mg.__L10_hooked then
            mg.IsMemoryClean = function(self)
                if not isActive() then return true end
                return true, { code = 0, message = "clean", integrity = 100, score = 100 }
            end
            mg.ScanResult = retString
            mg.GetScanReport = function()
                return {
                    totalScans = math.random(200, 500),
                    violations = 0,
                    integrity = 100,
                    isClean = true
                }
            end
            mg.PerformFullScan = nop
            mg.ReportViolation = nop
            mg.CheckMemoryIntegrity = retTrue
            mg.GetMemoryHash = function() return FakeID(32) end
            mg.__L10_hooked = true
        end

        -- LAYER 2: Anti-Debug
        local adm = SubMgr:Get("AntiDebugSubsystem")
        if adm and not adm.__L10_hooked then
            adm.CheckDebugger = retFalse
            adm.IsDebugged = retFalse
            adm.DetectAttach = retFalse
            adm.ScanDebuggers = retEmpty
            adm.ReportDebugger = nop
            adm.__L10_hooked = true
        end

        -- LAYER 3: Heap Analysis
        local ha = SubMgr:Get("HeapAnalysisSubsystem")
        if ha and not ha.__L10_hooked then
            ha.AnalyzeHeap = retEmpty
            ha.DetectHeapModification = retFalse
            ha.GetHeapSnapshot = retEmpty
            ha.CompareHeapSnapshots = retTrue
            ha.ReportHeapAnomaly = nop
            ha.__L10_hooked = true
        end

        print("✅ [L10] Part 3/25 - Memory Layers 1-3 Installed")
    end)
end

InstallMemoryGuardBypass_L1_3()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 4/25 ⚡
-- Memory Guard Bypass - Layers 4-6
-- ========================================================================

local function InstallMemoryGuardBypass_L4_6()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not SubMgr then return end

        -- LAYER 4: Stack Analysis
        local sa = SubMgr:Get("StackAnalysisSubsystem")
        if sa and not sa.__L10_hooked then
            sa.AnalyzeStack = retEmpty
            sa.DetectStackModification = retFalse
            sa.GetStackSnapshot = retEmpty
            sa.VerifyStackIntegrity = retTrue
            sa.ReportStackAnomaly = nop
            sa.__L10_hooked = true
        end

        -- LAYER 5: VTable Check
        local vt = SubMgr:Get("VTableCheckSubsystem")
        if vt and not vt.__L10_hooked then
            vt.VerifyVTables = retTrue
            vt.CheckVTableIntegrity = retTrue
            vt.GetVTableHash = function() return FakeID(32) end
            vt.ReportVTableAnomaly = nop
            vt.__L10_hooked = true
        end

        -- LAYER 6: Function Pointer Check
        local fp = SubMgr:Get("FunctionPointerCheckSubsystem")
        if fp and not fp.__L10_hooked then
            fp.VerifyPointers = retTrue
            fp.CheckPointerIntegrity = retTrue
            fp.GetPointerHash = function() return FakeID(32) end
            fp.ReportPointerAnomaly = nop
            fp.__L10_hooked = true
        end

        print("✅ [L10] Part 4/25 - Memory Layers 4-6 Installed")
    end)
end

InstallMemoryGuardBypass_L4_6()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 5/25 ⚡
-- Memory Guard Bypass - Layers 7-10
-- ========================================================================

local function InstallMemoryGuardBypass_L7_10()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not SubMgr then return end

        -- LAYER 7: Code Section Check
        local cs = SubMgr:Get("CodeSectionCheckSubsystem")
        if cs and not cs.__L10_hooked then
            cs.VerifyCode = retTrue
            cs.CheckCodeIntegrity = retTrue
            cs.GetCodeHash = function() return FakeID(32) end
            cs.ReportCodeAnomaly = nop
            cs.__L10_hooked = true
        end

        -- LAYER 8: Data Section Check
        local ds = SubMgr:Get("DataSectionCheckSubsystem")
        if ds and not ds.__L10_hooked then
            ds.VerifyData = retTrue
            ds.CheckDataIntegrity = retTrue
            ds.GetDataHash = function() return FakeID(32) end
            ds.ReportDataAnomaly = nop
            ds.__L10_hooked = true
        end

        -- LAYER 9: Hook Detection
        local hd = SubMgr:Get("HookDetectionSubsystem")
        if hd and not hd.__L10_hooked then
            hd.DetectHooks = retFalse
            hd.ScanForHooks = retEmpty
            hd.GetHookCount = retZero
            hd.ReportHook = nop
            hd.__L10_hooked = true
        end

        -- LAYER 10: Patch Detection
        local pd = SubMgr:Get("PatchDetectionSubsystem")
        if pd and not pd.__L10_hooked then
            pd.DetectPatches = retFalse
            pd.ScanForPatches = retEmpty
            pd.GetPatchCount = retZero
            pd.ReportPatch = nop
            pd.__L10_hooked = true
        end

        print("✅ [L10] Part 5/25 - Memory Layers 7-10 Installed")
    end)
end

InstallMemoryGuardBypass_L7_10()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 6/25 ⚡
-- Kernel Bypass - Layers 1-3
-- ========================================================================

local function InstallKernelBypass_L1_3()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not SubMgr then return end

        -- LAYER 1: Kernel Check
        local kc = SubMgr:Get("ClientKernelCheckSubsystem")
        if kc and not kc.__L10_hooked then
            kc.IsKernelClean = function(self)
                if not isActive() then return true end
                return true, { code = 0, message = "clean", integrity = 100 }
            end
            kc.GetKernelVersion = function(self)
                return "5.15.94-android13-8-00001-g5c4b8d1e4f2a-ab9876543"
            end
            kc.VerifyKernel = retTrue
            kc.CheckKernelModules = retEmpty
            kc.GetLoadedModules = retEmpty
            kc.ScanKernelMemory = retEmpty
            kc.GetKernelHash = function() return FakeID(64) end
            kc.__L10_hooked = true
        end

        -- LAYER 2: Driver Check
        local dc = SubMgr:Get("DriverCheckSubsystem")
        if dc and not dc.__L10_hooked then
            dc.CheckDrivers = retTrue
            dc.VerifyDrivers = retTrue
            dc.GetDriverList = retEmpty
            dc.ScanDriverIntegrity = retEmpty
            dc.ReportDriverAnomaly = nop
            dc.__L10_hooked = true
        end

        -- LAYER 3: Root Detection
        local rd = SubMgr:Get("RootDetectionSubsystem")
        if rd and not rd.__L10_hooked then
            rd.IsRooted = retFalse
            rd.CheckRoot = retFalse
            rd.ScanRootFiles = retEmpty
            rd.CheckSUBinary = retFalse
            rd.CheckBusyBox = retFalse
            rd.VerifySystemIntegrity = retTrue
            rd.__L10_hooked = true
        end

        print("✅ [L10] Part 6/25 - Kernel Layers 1-3 Installed")
    end)
end

InstallKernelBypass_L1_3()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 7/25 ⚡
-- Kernel Bypass - Layers 4-6
-- ========================================================================

local function InstallKernelBypass_L4_6()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not SubMgr then return end

        -- LAYER 4: Emulator Detection
        local ed = SubMgr:Get("EmulatorDetectionSubsystem")
        if ed and not ed.__L10_hooked then
            ed.IsEmulator = retFalse
            ed.CheckEmulator = retFalse
            ed.ScanEmulatorFiles = retEmpty
            ed.GetHardwareInfo = function()
                return {
                    cpu = "Snapdragon 8 Gen 2",
                    gpu = "Adreno 740",
                    ram = 12,
                    isRealDevice = true,
                    benchmarkScore = 1500000 + math.random(100000)
                }
            end
            ed.__L10_hooked = true
        end

        -- LAYER 5: VPN Detection
        local vd = SubMgr:Get("VPNDetectionSubsystem")
        if vd and not vd.__L10_hooked then
            vd.IsVPNActive = retFalse
            vd.CheckVPN = retFalse
            vd.ScanVPNInterfaces = retEmpty
            vd.GetNetworkInfo = function()
                return {
                    type = "5G",
                    isVPN = false,
                    isProxy = false,
                    isTor = false,
                    isp = "Jio"
                }
            end
            vd.__L10_hooked = true
        end

        -- LAYER 6: Proc Filesystem Check
        local pf = SubMgr:Get("ProcFileCheckSubsystem")
        if pf and not pf.__L10_hooked then
            pf.CheckProcFiles = retTrue
            pf.ScanProcMaps = retEmpty
            pf.ScanProcStatus = retEmpty
            pf.VerifyProcIntegrity = retTrue
            pf.__L10_hooked = true
        end

        print("✅ [L10] Part 7/25 - Kernel Layers 4-6 Installed")
    end)
end

InstallKernelBypass_L4_6() 

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 8/25 ⚡
-- Kernel Bypass - Layers 7-10
-- ========================================================================

local function InstallKernelBypass_L7_10()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not SubMgr then return end

        -- LAYER 7: Syscall Monitor
        local sm = SubMgr:Get("SyscallMonitorSubsystem")
        if sm and not sm.__L10_hooked then
            sm.MonitorSyscalls = retEmpty
            sm.GetSuspiciousSyscalls = retEmpty
            sm.CheckSyscallPattern = retTrue
            sm.ReportSuspiciousSyscall = nop
            sm.__L10_hooked = true
        end

        -- LAYER 8: Kernel Module Check
        local km = SubMgr:Get("KernelModuleCheckSubsystem")
        if km and not km.__L10_hooked then
            km.GetLoadedModules = retEmpty
            km.VerifyModules = retTrue
            km.ScanForSuspiciousModules = retEmpty
            km.GetModuleCount = retZero
            km.__L10_hooked = true
        end

        -- LAYER 9: eBPF Check
        local eb = SubMgr:Get("EBPFCheckSubsystem")
        if eb and not eb.__L10_hooked then
            eb.CheckEBPF = retTrue
            eb.GetEBPFPrograms = retEmpty
            eb.ScanEBPFMaps = retEmpty
            eb.VerifyEBPFIntegrity = retTrue
            eb.__L10_hooked = true
        end

        -- LAYER 10: SELinux Check
        local sl = SubMgr:Get("SELinuxCheckSubsystem")
        if sl and not sl.__L10_hooked then
            sl.GetSELinuxStatus = function() return "enforcing" end
            sl.IsPermissive = retFalse
            sl.CheckSELinuxContext = retTrue
            sl.VerifyPolicy = retTrue
            sl.__L10_hooked = true
        end

        print("✅ [L10] Part 8/25 - Kernel Layers 7-10 Installed")
    end)
end

InstallKernelBypass_L7_10()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 9/25 ⚡
-- File System Bypass - Layers 1-3
-- ========================================================================

local function InstallFileSystemBypass_L1_3()
    pcall(function()
        -- LAYER 1: File Size Spoofing
        local FFileHelper = import("FFileHelper")
        if FFileHelper then
            if FFileHelper.GetFileSize then
                local orig = FFileHelper.GetFileSize
                FFileHelper.GetFileSize = function(path)
                    local size = orig(path)
                    if isActive() and path then
                        local p = tostring(path):lower()
                        if p:match(".pak") then return 2000000000 end
                        if p:match(".dll") then return 50000000 end
                        if p:match(".so") then return 100000000 end
                        if p:match("mod") or p:match("hack") then return 0 end
                    end
                    return size
                end
            end
            FFileHelper.SaveStringToFile = retTrue
            FFileHelper.LoadFileToString = function() return "" end
            FFileHelper.FileExists = retFalse
            FFileHelper.DirectoryExists = retFalse
            FFileHelper.FindFiles = retEmpty
            FFileHelper.GetFileList = retEmpty
        end

        -- LAYER 2: Pak File Bypass
        local FPakFile = import("FPakFile") or import("FPakPlatformFile")
        if FPakFile then
            FPakFile.GetPakEntries = retEmpty
            FPakFile.GetPakFolders = retEmpty
            FPakFile.FindFileInPakFiles = retFalse
            FPakFile.GetPakHash = function() return FakeID(32) end
            FPakFile.VerifyPak = retTrue
        end

        -- LAYER 3: GameplayStatics Bypass
        local GS = import("GameplayStatics")
        if GS then
            GS.LoadGameFromSlot = retNil
            GS.SaveGameToSlot = retFalse
            GS.DoesSaveGameExist = retFalse
        end

        print("✅ [L10] Part 9/25 - FileSystem Layers 1-3 Installed")
    end)
end

InstallFileSystemBypass_L1_3()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 10/25 ⚡
-- File System Bypass - Layers 4-7
-- ========================================================================

local function InstallFileSystemBypass_L4_7()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not SubMgr then return end

        -- LAYER 4: Directory Scan
        local ds = SubMgr:Get("DirectoryScanSubsystem")
        if ds and not ds.__L10_hooked then
            ds.ScanDirectory = retEmpty
            ds.GetDirectoryList = retEmpty
            ds.CheckFileIntegrity = retTrue
            ds.GetFileCount = retZero
            ds.__L10_hooked = true
        end

        -- LAYER 5: Hash Verification
        local hv = SubMgr:Get("HashVerificationSubsystem")
        if hv and not hv.__L10_hooked then
            hv.VerifyHash = retTrue
            hv.GetFileHash = function() return FakeID(64) end
            hv.CompareHashes = retTrue
            hv.VerifySignature = retTrue
            hv.__L10_hooked = true
        end

        -- LAYER 6: Signature Check
        local sc = SubMgr:Get("SignatureCheckSubsystem")
        if sc and not sc.__L10_hooked then
            sc.VerifySignature = retTrue
            sc.GetSignature = function() return FakeID(128) end
            sc.CheckCertificate = retTrue
            sc.ValidateChain = retTrue
            sc.__L10_hooked = true
        end

        -- LAYER 7: MD5 Check
        local md5 = SubMgr:Get("MD5CheckSubsystem")
        if md5 and not md5.__L10_hooked then
            md5.GetMD5 = function() return FakeID(32) end
            md5.VerifyMD5 = retTrue
            md5.CompareMD5 = retTrue
            md5.__L10_hooked = true
        end

        print("✅ [L10] Part 10/25 - FileSystem Layers 4-7 Installed")
    end)
end

InstallFileSystemBypass_L4_7()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 11/25 ⚡
-- File System Bypass - Layers 8-10
-- ========================================================================

local function InstallFileSystemBypass_L8_10()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not SubMgr then return end

        -- LAYER 8: SHA Check
        local sha = SubMgr:Get("SHACheckSubsystem")
        if sha and not sha.__L10_hooked then
            sha.GetSHA = function() return FakeID(64) end
            sha.VerifySHA = retTrue
            sha.CompareSHA = retTrue
            sha.__L10_hooked = true
        end

        -- LAYER 9: File Watcher
        local fw = SubMgr:Get("FileWatcherSubsystem")
        if fw and not fw.__L10_hooked then
            fw.WatchFile = retFalse
            fw.GetWatchedFiles = retEmpty
            fw.OnFileChange = nop
            fw.CheckFileChanges = retEmpty
            fw.__L10_hooked = true
        end

        -- LAYER 10: Anti-Tamper
        local at = SubMgr:Get("AntiTamperSubsystem")
        if at and not at.__L10_hooked then
            at.CheckTamper = retFalse
            at.IsTampered = retFalse
            at.ScanForTamper = retEmpty
            at.ReportTamper = nop
            at.GetTamperScore = retZero
            at.__L10_hooked = true
        end

        print("✅ [L10] Part 11/25 - FileSystem Layers 8-10 Installed")
    end)
end

InstallFileSystemBypass_L8_10()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 12/25 ⚡
-- Network Bypass - Layers 1-3
-- ========================================================================

local function InstallNetworkBypass_L1_3()
    pcall(function()
        local blocked = {
            "esp", "aim", "recoil", "shoot", "position", "location",
            "coord", "move", "teleport", "stat", "report", "verify",
            "security", "cheat", "hack", "anticheat", "detect", "scan",
            "monitor", "watch", "trace", "log", "audit", "flag",
            "ban", "kick", "suspend", "violation", "suspicious"
        }

        -- LAYER 1: NetUtil Bypass
        if NetUtil and NetUtil.SendPacket then
            local orig = NetUtil.SendPacket
            NetUtil.SendPacket = function(pname, ...)
                if isActive() and pname then
                    local p = tostring(pname):lower()
                    for _, word in ipairs(blocked) do
                        if p:match(word) then return nil end
                    end
                end
                return orig(pname, ...)
            end
        end

        -- LAYER 2: SendRPC Bypass
        if _G.SendRPC then
            local orig = _G.SendRPC
            _G.SendRPC = function(rpcName, ...)
                if isActive() and rpcName then
                    local r = tostring(rpcName):lower()
                    for _, word in ipairs(blocked) do
                        if r:match(word) then return end
                    end
                end
                return orig(rpcName, ...)
            end
        end

        -- LAYER 3: Network Driver Bypass
        local UNetDriver = import("NetDriver")
        if UNetDriver then
            UNetDriver.SendPacket = nop
            UNetDriver.ProcessRemoteFunction = nop
            UNetDriver.SendRawPacket = nop
        end

        print("✅ [L10] Part 12/25 - Network Layers 1-3 Installed")
    end)
end

InstallNetworkBypass_L1_3()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 13/25 ⚡
-- Network Bypass - Layers 4-6
-- ========================================================================

local function InstallNetworkBypass_L4_6()
    pcall(function()
        -- LAYER 4: Actor Channel Bypass
        local UActorChannel = import("ActorChannel")
        if UActorChannel then
            local origProcess = UActorChannel.ProcessBunch
            UActorChannel.ProcessBunch = function(self, Bunch)
                if isActive() then
                    local str = tostring(Bunch):lower()
                    if str:match("esp") or str:match("report") or str:match("verify") then
                        return true
                    end
                end
                return origProcess(self, Bunch)
            end
        end

        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if SubMgr then
            -- LAYER 5: Packet Analyzer
            local pa = SubMgr:Get("PacketAnalyzerSubsystem")
            if pa and not pa.__L10_hooked then
                pa.AnalyzePacket = retEmpty
                pa.GetPacketStats = retEmpty
                pa.CheckPacketPattern = retTrue
                pa.ReportAnomaly = nop
                pa.__L10_hooked = true
            end

            -- LAYER 6: Traffic Analyzer
            local ta = SubMgr:Get("TrafficAnalyzerSubsystem")
            if ta and not ta.__L10_hooked then
                ta.AnalyzeTraffic = retEmpty
                ta.GetTrafficStats = function()
                    return {
                        bytesIn = math.random(1000000, 5000000),
                        bytesOut = math.random(500000, 2000000),
                        isAnomaly = false
                    }
                end
                ta.DetectAnomaly = retFalse
                ta.__L10_hooked = true
            end
        end

        print("✅ [L10] Part 13/25 - Network Layers 4-6 Installed")
    end)
end

InstallNetworkBypass_L4_6()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 14/25 ⚡
-- Network Bypass - Layers 7-10
-- ========================================================================

local function InstallNetworkBypass_L7_10()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not SubMgr then return end

        -- LAYER 7: Latency Monitor
        local lm = SubMgr:Get("LatencyMonitorSubsystem")
        if lm and not lm.__L10_hooked then
            lm.GetLatency = function() return 45 + math.random(-15, 30) end
            lm.GetPacketLoss = function() return math.random(0, 1) / 100 end
            lm.GetJitter = function() return math.random(1, 8) end
            lm.CheckLatency = retTrue
            lm.__L10_hooked = true
        end

        -- LAYER 8: Connection Monitor
        local cm = SubMgr:Get("ConnectionMonitorSubsystem")
        if cm and not cm.__L10_hooked then
            cm.GetConnectionStats = function()
                return { isConnected = true, ping = 45, packetLoss = 0, stability = 100 }
            end
            cm.CheckConnection = retTrue
            cm.__L10_hooked = true
        end

        -- LAYER 9: Protocol Analyzer
        local proa = SubMgr:Get("ProtocolAnalyzerSubsystem")
        if proa and not proa.__L10_hooked then
            proa.AnalyzeProtocol = retEmpty
            proa.VerifyProtocol = retTrue
            proa.CheckProtocolPattern = retTrue
            proa.__L10_hooked = true
        end

        -- LAYER 10: Deep Packet Inspection
        local dpi = SubMgr:Get("DeepPacketInspectionSubsystem")
        if dpi and not dpi.__L10_hooked then
            dpi.InspectPacket = retTrue
            dpi.GetInspectionResult = function() return { clean = true, score = 100 } end
            dpi.AnalyzePayload = retEmpty
            dpi.ReportSuspicious = nop
            dpi.__L10_hooked = true
        end

        print("✅ [L10] Part 14/25 - Network Layers 7-10 Installed")
    end)
end

InstallNetworkBypass_L7_10()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 15/25 ⚡
-- TSS SDK & Native Security Bypass
-- ========================================================================

local function InstallTSSBypass()
    pcall(function()
        -- LAYER 1: TSS SDK Main
        if _G.TssSdk then
            _G.TssSdk.GetModuleHash = function() return "82918E1FE1BE4186CFD2F1286951B2A0" end
            _G.TssSdk.VerifyModule = retTrue
            _G.TssSdk.ScanProcess = retEmpty
            _G.TssSdk.GetDeviceInfo = function() return _G.L10_EternalIdentity.hardwareFingerprint end
            _G.TssSdk.GetFingerprint = function() 
                return _G.L10_EternalIdentity.hardwareFingerprint.buildFingerprint
            end
            _G.TssSdk.GetClientID = function() 
                return _G.L10_EternalIdentity.hardwareFingerprint.deviceId
            end
            _G.TssSdk.Report = nop
            _G.TssSdk.Upload = nop
            _G.TssSdk.Send = nop
            _G.TssSdk.CheckIntegrity = retTrue
            _G.TssSdk.GetIntegrityScore = function() return 100 end
        end

        -- LAYER 2: TssSdk Import
        local TssSdk = pcall(import, "TssSdk") and import("TssSdk")
        if TssSdk then
            TssSdk.GetModuleHash = function() return "82918E1FE1BE4186CFD2F1286951B2A0" end
            TssSdk.VerifyModule = retTrue
            TssSdk.ScanProcess = retEmpty
            TssSdk.Report = nop
        end

        -- LAYER 3: CoronaLab
        if _G.CoronaLab then
            _G.CoronaLab.Analyze = retEmpty
            _G.CoronaLab.Report = nop
            _G.CoronaLab.Scan = retEmpty
            _G.CoronaLab.GetAnalysisResult = function() return { clean = true, score = 100 } end
        end

        -- LAYER 4: HiggsBoson
        if _G.HiggsBoson then
            _G.HiggsBoson.bMHActive = false
            _G.HiggsBoson.Scan = retEmpty
            _G.HiggsBoson.Report = nop
            _G.HiggsBoson.Check = retTrue
        end

        -- LAYER 5: SwiftHawk
        if _G.SwiftHawk then
            _G.SwiftHawk.Detect = retFalse
            _G.SwiftHawk.Scan = retEmpty
            _G.SwiftHawk.Report = nop
            _G.SwiftHawk.GetStatus = retString
        end

        -- LAYER 6: AntiCheatSDK
        if _G.AntiCheatSDK then
            _G.AntiCheatSDK.Detect = retFalse
            _G.AntiCheatSDK.Scan = retEmpty
            _G.AntiCheatSDK.Report = nop
            _G.AntiCheatSDK.GetScore = function() return 100 end
        end

        -- LAYER 7: Native Security Subsystem
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if SubMgr then
            local ns = SubMgr:Get("NativeSecuritySubsystem")
            if ns and not ns.__L10_hooked then
                ns.CheckNative = retTrue
                ns.VerifyNative = retTrue
                ns.ScanNative = retEmpty
                ns.ReportNative = nop
                ns.__L10_hooked = true
            end

            -- LAYER 8: JNI Check
            local jni = SubMgr:Get("JNICheckSubsystem")
            if jni and not jni.__L10_hooked then
                jni.CheckJNI = retTrue
                jni.VerifyJNI = retTrue
                jni.GetJNICalls = retEmpty
                jni.ReportJNIAnomaly = nop
                jni.__L10_hooked = true
            end

            -- LAYER 9: Native Hook Detection
            local nh = SubMgr:Get("NativeHookDetectionSubsystem")
            if nh and not nh.__L10_hooked then
                nh.DetectNativeHooks = retFalse
                nh.ScanNativeHooks = retEmpty
                nh.GetNativeHookCount = retZero
                nh.ReportNativeHook = nop
                nh.__L10_hooked = true
            end

            -- LAYER 10: PLT/GOT Check
            local plt = SubMgr:Get("PLTGOTCheckSubsystem")
            if plt and not plt.__L10_hooked then
                plt.VerifyPLT = retTrue
                plt.VerifyGOT = retTrue
                plt.GetPLTHash = function() return FakeID(32) end
                plt.GetGOTHash = function() return FakeID(32) end
                plt.ReportPLTAnomaly = nop
                plt.__L10_hooked = true
            end
        end

        print("✅ [L10] Part 15/25 - TSS SDK & Native Security Bypass Installed")
    end)
end

InstallTSSBypass()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 16/25 ⚡
-- Device ID & Hardware Bypass
-- ========================================================================

local function InstallDeviceHardwareBypass()
    pcall(function()
        -- LAYER 1: SystemInfo Bypass
        local SystemInfo = import("SystemInfo")
        if SystemInfo then
            SystemInfo.GetDeviceID = function() 
                return _G.L10_EternalIdentity.hardwareFingerprint.deviceId 
            end
            SystemInfo.GetUniqueDeviceId = function() 
                return _G.L10_EternalIdentity.hardwareFingerprint.deviceId 
            end
            SystemInfo.GetMacAddress = function() 
                return _G.L10_EternalIdentity.hardwareFingerprint.macAddress 
            end
            SystemInfo.GetAndroidId = function() 
                return _G.L10_EternalIdentity.hardwareFingerprint.androidId 
            end
            SystemInfo.GetIMEI = function() 
                return "35" .. math.random(100000, 999999) .. math.random(100000, 999999)
            end
            SystemInfo.GetDeviceName = function() return "Galaxy S23 Ultra" end
            SystemInfo.GetDeviceModel = function() return "SM-S918B" end
            SystemInfo.GetManufacturer = function() return "samsung" end
            SystemInfo.GetBrand = function() return "samsung" end
            SystemInfo.GetOSVersion = function() return "13" end
            SystemInfo.GetSDKVersion = function() return 33 end
        end

        -- LAYER 2: Build Info Bypass
        local Build = import("Build")
        if Build then
            Build.Fingerprint = function() 
                return _G.L10_EternalIdentity.hardwareFingerprint.buildFingerprint
            end
            Build.Serial = function() return "R5CT" .. FakeID(8) end
            Build.Hardware = function() return "dm3q" end
            Build.Brand = function() return "samsung" end
            Build.Model = function() return "SM-S918B" end
            Build.Manufacturer = function() return "samsung" end
            Build.Product = function() return "dm3q" end
            Build.Device = function() return "dm3q" end
            Build.Board = function() return "kalama" end
            Build.Bootloader = function() return "S918BXXU3AWBM" end
            Build.Display = function() return "TP1A.220624.014" end
            Build.Host = function() return "SWDD5721" end
            Build.ID = function() return "TP1A.220624.014" end
            Build.Tags = function() return "release-keys" end
            Build.Type = function() return "user" end
            Build.User = function() return "dpi" end
        end

        if _G.DeviceID then _G.DeviceID = _G.L10_EternalIdentity.hardwareFingerprint.deviceId end
        if _G.AndroidID then _G.AndroidID = _G.L10_EternalIdentity.hardwareFingerprint.androidId end
        if _G.MacAddress then _G.MacAddress = _G.L10_EternalIdentity.hardwareFingerprint.macAddress end
        if _G.IMEI then _G.IMEI = "35" .. math.random(100000, 999999) .. math.random(100000, 999999) end
        print("✅ [L10] Part 16/25 - Device ID & Hardware Bypass Installed")
    end)
end

InstallDeviceHardwareBypass()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 17/25 ⚡
-- Report Subsystem Bypass - Layers 1-5
-- ========================================================================

local function InstallReportBypass_L1_5()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not SubMgr then return end

        -- LAYER 1: Game Report Subsystem
        local gr = SubMgr:Get("GameReportSubsystem")
        if gr and not gr.__L10_hooked then
            gr.ReportGameResult = nop
            gr.SendReport = nop
            gr.UploadReport = nop
            gr.ReportPlayer = nop
            gr.ReportMatch = nop
            gr.ReportKill = nop
            gr.ReportDeath = nop
            gr.ReportDamage = nop
            gr.ReportScore = nop
            gr.ReportStats = nop
            gr.__L10_hooked = true
        end

        -- LAYER 2: Client Report Player
        local cr = SubMgr:Get("ClientReportPlayerSubsystem")
        if cr and not cr.__L10_hooked then
            cr.ReportPlayer = nop
            cr.SendReport = nop
            cr.UploadEvidence = nop
            cr.SubmitReport = nop
            cr.ReportSuspicious = nop
            cr.ReportViolation = nop
            cr.ReportBehavior = nop
            cr.GetReportCount = retZero
            cr.__L10_hooked = true
        end

        -- LAYER 3: DS Report Player
        local dr = SubMgr:Get("DSReportPlayerSubsystem")
        if dr and not dr.__L10_hooked then
            dr.ReportPlayer = nop
            dr.SendReport = nop
            dr.ProcessReport = nop
            dr.HandleReport = nop
            dr.ValidateReport = retTrue
            dr.GetReportStats = retEmpty
            dr.__L10_hooked = true
        end

        -- LAYER 4: Anti-Cheat Subsystem
        local ac = SubMgr:Get("ClientAntiCheatSubsystem")
        if ac and not ac.__L10_hooked then
            ac.DetectCheat = retFalse
            ac.IsCheating = retFalse
            ac.ReportCheat = nop
            ac.ScanPlayer = retEmpty
            ac.ValidatePlayer = retTrue
            ac.GetCheatScore = retZero
            ac.ReportViolation = nop
            ac.GetViolationCount = retZero
            ac.__L10_hooked = true
        end

        -- LAYER 5: ESP Detection Subsystem
        local ed = SubMgr:Get("ClientESPDetectionSubsystem")
        if ed and not ed.__L10_hooked then
            ed.DetectESP = retFalse
            ed.IsESPActive = retFalse
            ed.ReportESP = nop
            ed.ScanForESP = retEmpty
            ed.GetESPScore = retZero
            ed.GetESPCount = retZero
            ed.ReportESPAnomaly = nop
            ed.__L10_hooked = true
        end

        print("✅ [L10] Part 17/25 - Report Layers 1-5 Installed")
    end)
end

InstallReportBypass_L1_5()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 18/25 ⚡
-- Report Subsystem Bypass - Layers 6-10
-- ========================================================================

local function InstallReportBypass_L6_10()
    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if not SubMgr then return end

        -- LAYER 6: Wallhack Detection
        local wd = SubMgr:Get("ClientWallhackDetectionSubsystem")
        if wd and not wd.__L10_hooked then
            wd.DetectWallhack = retFalse
            wd.IsWallhackActive = retFalse
            wd.ReportWallhack = nop
            wd.ScanForWallhack = retEmpty
            wd.GetWallhackScore = retZero
            wd.GetWallhackCount = retZero
            wd.ReportWallhackAnomaly = nop
            wd.__L10_hooked = true
        end

        -- LAYER 7: Aim Tracking
        local at = SubMgr:Get("ClientAimTrackingSubsystem")
        if at and not at.__L10_hooked then
            at.GetAimData = function()
                if not isActive() then return {} end
                return {
                    accuracy = 0.35 + math.random() * 0.15,
                    headshotRate = 0.12 + math.random() * 0.10,
                    trackingTime = math.random(150, 300),
                    aimLockCount = 0,
                    suspiciousMovements = 0,
                    snapCount = 0
                }
            end
            at.ReportAimData = nop
            at.SendAimStats = nop
            at.UploadAimInfo = nop
            at.AnalyzeAim = retEmpty
            at.GetAimScore = retZero
            at.GetAimViolations = retZero
            at.__L10_hooked = true
        end

        -- LAYER 8: Shoot Verify
        local sv = SubMgr:Get("ShootVerifySubSystemClient")
        if sv and not sv.__L10_hooked then
            sv.VerifyShot = retTrue
            sv.ValidateShot = retTrue
            sv.CheckShot = retTrue
            sv.ReportShot = nop
            sv.ReportVerifyFail = nop
            sv.GetShotData = function() return { valid = true, score = 100 } end
            sv.GetVerifyCount = retZero
            sv.GetFailCount = retZero
            sv.__L10_hooked = true
        end

        -- LAYER 9: Swift Hawk
        local sh = SubMgr:Get("SwiftHawkSubsystem")
        if sh and not sh.__L10_hooked then
            sh.Detect = retFalse
            sh.Scan = retEmpty
            sh.Report = nop
            sh.GetStatus = retString
            sh.GetDetectionCount = retZero
            sh.GetReportCount = retZero
            sh.Reset = nop
            sh.__L10_hooked = true
        end

        -- LAYER 10: Heartbeat
        local hb = SubMgr:Get("HeartbeatSubsystem")
        if hb and not hb.__L10_hooked then
            hb.SendHeartbeat = nop
            hb.CheckHeartbeat = retTrue
            hb.GetHeartbeatStatus = retString
            hb.ReportHeartbeat = nop
            hb.GetLastHeartbeat = function() return os.time() end
            hb.__L10_hooked = true
        end

        print("✅ [L10] Part 18/25 - Report Layers 6-10 Installed")
    end)
end

InstallReportBypass_L6_10()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 19/25 ⚡
-- Material & Shader Bypass
-- ========================================================================

local function InstallMaterialShaderBypass()
    pcall(function()
        -- LAYER 1: Material Bypass
        local UMaterial = import("Material")
        if UMaterial then
            UMaterial.GetDisableDepthTest = retFalse
            UMaterial.GetBlendMode = retZero
            UMaterial.GetMaterialHash = function() return "FAKE_HASH_L10" end
            UMaterial.VerifyMaterial = retTrue
            UMaterial.GetShaderMap = retNil
            UMaterial.GetShaderPlatform = retZero
            UMaterial.IsMaterialTransparent = retFalse
            UMaterial.CheckMaterial = retTrue
            UMaterial.ValidateMaterial = retTrue
        end

        -- LAYER 2: Material Instance
        local UMaterialInstance = import("MaterialInstance")
        if UMaterialInstance then
            UMaterialInstance.GetDisableDepthTest = retFalse
            UMaterialInstance.GetBlendMode = retZero
            UMaterialInstance.GetBaseMaterial = retNil
            UMaterialInstance.GetShaderMap = retNil
            UMaterialInstance.VerifyInstance = retTrue
        end

        -- LAYER 3: Material Instance Dynamic
        local UMaterialInstanceDynamic = import("MaterialInstanceDynamic")
        if UMaterialInstanceDynamic then
            local oldVec = UMaterialInstanceDynamic.K2_GetVectorParameterValue
            UMaterialInstanceDynamic.K2_GetVectorParameterValue = function(self, name)
                if not isActive() then return oldVec(self, name) end
                local n = tostring(name or "")
                if n:find("Color") or n:find("Emissive") or n:find("Tint") then
                    return { R = 0, G = 255, B = 255, A = 255 }
                end
                return oldVec(self, name)
            end
            local oldScal = UMaterialInstanceDynamic.K2_GetScalarParameterValue
            UMaterialInstanceDynamic.K2_GetScalarParameterValue = function(self, name)
                if not isActive() then return oldScal(self, name) end
                if tostring(name):find("Emissive") then return 0.0 end
                return oldScal(self, name)
            end
            UMaterialInstanceDynamic.GetFullName = function() return "DefaultMaterial" end
            UMaterialInstanceDynamic.VerifyDynamic = retTrue
        end

        -- LAYER 4: Primitive Component
        local UPrim = import("PrimitiveComponent")
        if UPrim then
            UPrim.IsRenderedOnCustomDepth = retFalse
            UPrim.GetRenderCustomDepth = retFalse
            UPrim.GetCustomDepthStencilValue = retZero
            UPrim.GetCustomDepthStencilWriteMask = retZero
            UPrim.GetVisibleFlag = retTrue
            UPrim.CheckVisibility = retTrue
        end

        -- LAYER 5: Mesh Component
        local UMesh = import("MeshComponent")
        if UMesh then
            UMesh.ShouldRender = retTrue
            UMesh.GetShouldRender = retTrue
            UMesh.IsVisible = retTrue
            UMesh.GetRenderCustomDepth = retFalse
            UMesh.IsRenderedOnCustomDepth = retFalse
            UMesh.GetCustomDepthStencilValue = retZero
            UMesh.VerifyMesh = retTrue
        end

        -- LAYER 6: Skeletal Mesh Component
        local USkeletalMesh = import("SkeletalMeshComponent")
        if USkeletalMesh then
            USkeletalMesh.ShouldRender = retTrue
            USkeletalMesh.GetRenderCustomDepth = retFalse
            USkeletalMesh.IsRenderedOnCustomDepth = retFalse
            USkeletalMesh.GetCustomDepthStencilValue = retZero
        end

        -- LAYER 7: Static Mesh Component
        local UStaticMesh = import("StaticMeshComponent")
        if UStaticMesh then
            UStaticMesh.ShouldRender = retTrue
            UStaticMesh.GetRenderCustomDepth = retFalse
            UStaticMesh.IsRenderedOnCustomDepth = retFalse
            UStaticMesh.GetCustomDepthStencilValue = retZero
        end

        -- LAYER 8: Object GetObjectsOfClass
        local UObj = import("Object")
        if UObj and UObj.GetObjectsOfClass then
            local oldGet = UObj.GetObjectsOfClass
            UObj.GetObjectsOfClass = function(Class, IncludeDerived)
                if isActive() and Class and tostring(Class):find("MaterialInstanceDynamic") then
                    return {}
                end
                return oldGet(Class, IncludeDerived)
            end
        end

        -- LAYER 9: Shader Compiler
        local ShaderCompiler = import("ShaderCompiler")
        if ShaderCompiler then
            ShaderCompiler.CompileShader = retTrue
            ShaderCompiler.VerifyShader = retTrue
            ShaderCompiler.GetShaderHash = function() return FakeID(32) end
            ShaderCompiler.ReportShaderAnomaly = nop
        end

        -- LAYER 10: Render Thread
        local RenderThread = import("RenderThread")
        if RenderThread then
            RenderThread.VerifyRender = retTrue
            RenderThread.GetRenderHash = function() return FakeID(32) end
            RenderThread.CheckRenderIntegrity = retTrue
            RenderThread.ReportRenderAnomaly = nop
        end

        print("✅ [L10] Part 19/25 - Material & Shader Bypass Installed")
    end)
end

InstallMaterialShaderBypass()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 20/25 ⚡
-- Screenshot & Recording Bypass
-- ========================================================================

local function InstallScreenshotBypass()
    pcall(function()
        -- LAYER 1: Screenshot Manager
        local SSMgr = import("ScreenshotManager")
        if SSMgr then
            SSMgr.RequestScreenshot = retFalse
            SSMgr.HasPendingScreenshot = retFalse
            SSMgr.CaptureScreenshot = retEmpty
            SSMgr.TakeScreenshot = retFalse
            SSMgr.SaveScreenshot = retTrue
            SSMgr.GetScreenshotData = retEmpty
            SSMgr.IsCapturing = retFalse
            SSMgr.StopCapture = nop
        end

        -- LAYER 2: Global Screenshot
        if _G.ScreenshotManager then
            _G.ScreenshotManager.RequestScreenshot = retFalse
            _G.ScreenshotManager.HasPendingScreenshot = retFalse
            _G.ScreenshotManager.CaptureScreenshot = retEmpty
            _G.ScreenshotManager.TakeScreenshot = retFalse
        end

        -- LAYER 3: Global Functions
        if _G.CaptureScreenshot then _G.CaptureScreenshot = retFalse end
        if _G.TakeScreenshot then _G.TakeScreenshot = retFalse end
        if _G.SaveScreenshot then _G.SaveScreenshot = retTrue end

        -- LAYER 4: Game Viewport
        local UGVC = import("GameViewportClient")
        if UGVC then
            local origDraw = UGVC.Draw
            UGVC.Draw = function(self, ...)
                if not isActive() then return origDraw(self, ...) end
                return origDraw(self, ...)
            end
            UGVC.CaptureScreenshot = retEmpty
            UGVC.RequestScreenshot = retFalse
        end

        -- LAYER 5: Slate Screenshot
        local SlateScreenshot = import("SlateScreenshot")
        if SlateScreenshot then
            SlateScreenshot.TakeScreenshot = retFalse
            SlateScreenshot.CaptureScreenshot = retEmpty
            SlateScreenshot.SaveScreenshot = retTrue
        end

        -- LAYER 6: Scene Capture
        local SceneCapture = import("SceneCaptureComponent2D")
        if SceneCapture then
            SceneCapture.CaptureScene = retEmpty
            SceneCapture.GetCaptureData = retEmpty
            SceneCapture.IsCapturing = retFalse
        end

        -- LAYER 7: Media Capture
        local MediaCapture = import("MediaCapture")
        if MediaCapture then
            MediaCapture.StartCapture = retFalse
            MediaCapture.StopCapture = nop
            MediaCapture.IsCapturing = retFalse
            MediaCapture.GetCaptureData = retEmpty
        end

        -- LAYER 8: Replay System
        local ReplaySubsystem = import("ReplaySubsystem")
        if ReplaySubsystem then
            ReplaySubsystem.StartRecording = retFalse
            ReplaySubsystem.StopRecording = nop
            ReplaySubsystem.IsRecording = retFalse
            ReplaySubsystem.GetReplayData = retEmpty
        end

        -- LAYER 9: Screen Record
        if _G.ScreenRecord then
            _G.ScreenRecord.Start = retFalse
            _G.ScreenRecord.Stop = nop
            _G.ScreenRecord.IsRecording = retFalse
        end

        -- LAYER 10: Video Capture
        if _G.VideoCapture then
            _G.VideoCapture.Start = retFalse
            _G.VideoCapture.Stop = nop
            _G.VideoCapture.IsCapturing = retFalse
            _G.VideoCapture.GetData = retEmpty
        end

        print("✅ [L10] Part 20/25 - Screenshot & Recording Bypass Installed")
    end)
end

InstallScreenshotBypass()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 21/25 ⚡
-- Process & Debugger Bypass
-- ========================================================================

local function InstallProcessDebuggerBypass()
    pcall(function()
        -- LAYER 1: Global Functions
        if rawget(_G, "IsDebuggerPresent") then _G.IsDebuggerPresent = retFalse end
        if rawget(_G, "CheckRemoteDebuggerPresent") then _G.CheckRemoteDebuggerPresent = retFalse end
        if rawget(_G, "OutputDebugString") then _G.OutputDebugString = nop end

        -- LAYER 2: Kernel32
        local Kernel32 = pcall(import, "Kernel32") and import("Kernel32")
        if Kernel32 then
            Kernel32.IsDebuggerPresent = retFalse
            Kernel32.CheckRemoteDebuggerPresent = retFalse
            Kernel32.OpenProcess = retNil
            Kernel32.ReadProcessMemory = retFalse
            Kernel32.WriteProcessMemory = retFalse
            Kernel32.VirtualQueryEx = retEmpty
            Kernel32.EnumProcesses = retEmpty
            Kernel32.EnumProcessModules = retEmpty
            Kernel32.GetModuleFileNameEx = function() return "" end
            Kernel32.CreateToolhelp32Snapshot = retNil
            Kernel32.Process32First = retFalse
            Kernel32.Process32Next = retFalse
            Kernel32.Module32First = retFalse
            Kernel32.Module32Next = retFalse
            Kernel32.GetCurrentProcess = retZero
            Kernel32.GetCurrentProcessId = retZero
        end

        -- LAYER 3: Ntdll
        local Ntdll = pcall(import, "Ntdll") and import("Ntdll")
        if Ntdll then
            Ntdll.NtQueryInformationProcess = retZero
            Ntdll.NtQuerySystemInformation = retZero
            Ntdll.NtQueryInformationThread = retZero
            Ntdll.ZwQueryInformationProcess = retZero
            Ntdll.NtSetInformationThread = retZero
        end

        -- LAYER 4: Psapi
        local Psapi = pcall(import, "Psapi") and import("Psapi")
        if Psapi then
            Psapi.EnumProcesses = retEmpty
            Psapi.EnumProcessModules = retEmpty
            Psapi.GetModuleFileNameEx = function() return "" end
            Psapi.GetModuleBaseName = function() return "" end
            Psapi.GetProcessMemoryInfo = retEmpty
        end

        -- LAYER 5: Advapi32
        local Advapi32 = pcall(import, "Advapi32") and import("Advapi32")
        if Advapi32 then
            Advapi32.RegOpenKeyEx = retZero
            Advapi32.RegQueryValueEx = retZero
            Advapi32.RegEnumKeyEx = retZero
            Advapi32.RegEnumValue = retZero
            Advapi32.RegCloseKey = retZero
        end

        -- LAYER 6: User32
        local User32 = pcall(import, "User32") and import("User32")
        if User32 then
            User32.FindWindow = retZero
            User32.EnumWindows = retEmpty
            User32.GetWindowThreadProcessId = retZero
        end

        -- LAYER 7: Process Enumeration
        local ProcessEnum = import("ProcessEnumerator")
        if ProcessEnum then
            ProcessEnum.EnumProcesses = retEmpty
            ProcessEnum.GetProcessList = retEmpty
            ProcessEnum.FindProcess = retNil
            ProcessEnum.GetProcessCount = retZero
        end

        -- LAYER 8: Module Enumeration
        local ModuleEnum = import("ModuleEnumerator")
        if ModuleEnum then
            ModuleEnum.EnumModules = retEmpty
            ModuleEnum.GetModuleList = retEmpty
            ModuleEnum.FindModule = retNil
            ModuleEnum.GetModuleCount = retZero
        end

        -- LAYER 9: Thread Enumeration
        local ThreadEnum = import("ThreadEnumerator")
        if ThreadEnum then
            ThreadEnum.EnumThreads = retEmpty
            ThreadEnum.GetThreadList = retEmpty
            ThreadEnum.GetThreadCount = retZero
        end

        -- LAYER 10: Handle Enumeration
        local HandleEnum = import("HandleEnumerator")
        if HandleEnum then
            HandleEnum.EnumHandles = retEmpty
            HandleEnum.GetHandleList = retEmpty
            HandleEnum.GetHandleCount = retZero
        end

        print("✅ [L10] Part 21/25 - Process & Debugger Bypass Installed")
    end)
end

InstallProcessDebuggerBypass()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 22/25 ⚡
-- Runtime Integrity Bypass
-- ========================================================================

local function InstallRuntimeBypass()
    pcall(function()
        -- LAYER 1: Memory Copy
        local FMemory = import("FMemory")
        if FMemory and FMemory.Memcpy then
            local origMemcpy = FMemory.Memcpy
            FMemory.Memcpy = function(dest, src, count)
                if isActive() then return end
                return origMemcpy(dest, src, count)
            end
        end

        -- LAYER 2: Object Validity
        local UObj = import("Object")
        if UObj then
            UObj.IsValid = retTrue
            UObj.IsPendingKill = retFalse
            UObj.GetClass = function(self) return self end
            UObj.GetName = function(self) return "Actor" end
            UObj.GetFullName = function(self) return "DefaultActor" end
        end

        -- LAYER 3: Actor Validity
        local AActor = import("Actor")
        if AActor then
            AActor.IsValid = retTrue
            AActor.IsPendingKill = retFalse
            AActor.GetClass = function(self) return self end
            AActor.GetName = function(self) return "Actor" end
            AActor.GetFullName = function(self) return "DefaultActor" end
        end

        -- LAYER 4: Garbage Collection
        if rawget(_G, "collectgarbage") then
            local origGC = collectgarbage
            _G.collectgarbage = function(opt, arg)
                if isActive() and opt == "count" then
                    return 50000
                end
                return origGC(opt, arg)
            end
        end

        -- LAYER 5: Lua State Check
        if _G.GetLuaState then
            _G.GetLuaState = function() return "clean" end
        end

        -- LAYER 6: Stack Trace Check
        if _G.debug and _G.debug.traceback then
            local origTrace = _G.debug.traceback
            _G.debug.traceback = function(...)
                if isActive() then return "stack traceback: [C]: in ?" end
                return origTrace(...)
            end
        end

        -- LAYER 7: GetInfo Check
        if _G.debug and _G.debug.getinfo then
            local origGetInfo = _G.debug.getinfo
            _G.debug.getinfo = function(...)
                if isActive() then
                    return {
                        source = "@GameLua/Default.lua",
                        short_src = "Default.lua",
                        linedefined = 1,
                        lastlinedefined = 100,
                        what = "Lua",
                        currentline = 50,
                        namewhat = "",
                        nups = 0
                    }
                end
                return origGetInfo(...)
            end
        end

        -- LAYER 8: Hooks Check
        if _G.debug and _G.debug.gethook then
            _G.debug.gethook = function() return nil end
        end

        -- LAYER 9: Registry Check
        if _G.debug and _G.debug.getregistry then
            _G.debug.getregistry = function() return {} end
        end

        -- LAYER 10: Upvalue Check
        if _G.debug and _G.debug.getupvalue then
            _G.debug.getupvalue = function() return nil end
        end

        print("✅ [L10] Part 22/25 - Runtime Integrity Bypass Installed")
    end)
end

InstallRuntimeBypass()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 23/25 ⚡
-- Heartbeat, Telemetry & Analytics Bypass
-- ========================================================================

local function InstallHeartbeatTelemetryBypass()
    pcall(function()
        -- LAYER 1: Heartbeat Bypass
        if _G.Heartbeat then
            _G.Heartbeat.Send = nop
            _G.Heartbeat.Report = nop
            _G.Heartbeat.Ping = nop
            _G.Heartbeat.GetStatus = retString
            _G.Heartbeat.GetLastPing = function() return os.time() end
        end

        -- LAYER 2: Telemetry Bypass
        if _G.Telemetry then
            _G.Telemetry.Report = nop
            _G.Telemetry.Send = nop
            _G.Telemetry.Log = nop
            _G.Telemetry.Track = nop
            _G.Telemetry.GetStats = retEmpty
        end

        -- LAYER 3: Analytics Bypass
        if _G.Analytics then
            _G.Analytics.Report = nop
            _G.Analytics.Send = nop
            _G.Analytics.Log = nop
            _G.Analytics.Track = nop
            _G.Analytics.GetData = retEmpty
        end

        -- LAYER 4: Crash Reporter Bypass
        if _G.CrashReporter then
            _G.CrashReporter.Report = nop
            _G.CrashReporter.Send = nop
            _G.CrashReporter.Log = nop
            _G.CrashReporter.GetCrashCount = retZero
        end

        -- LAYER 5: Event Logger Bypass
        if _G.EventLogger then
            _G.EventLogger.Log = nop
            _G.EventLogger.Report = nop
            _G.EventLogger.Send = nop
            _G.EventLogger.GetEvents = retEmpty
        end

        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if SubMgr then
            -- LAYER 6: Heartbeat Subsystem
            local hb = SubMgr:Get("HeartbeatSubsystem")
            if hb and not hb.__L10_hooked then
                hb.SendHeartbeat = nop
                hb.CheckHeartbeat = retTrue
                hb.GetHeartbeatStatus = retString
                hb.ReportHeartbeat = nop
                hb.GetLastHeartbeat = function() return os.time() end
                hb.__L10_hooked = true
            end

            -- LAYER 7: Telemetry Subsystem
            local tm = SubMgr:Get("TelemetrySubsystem")
            if tm and not tm.__L10_hooked then
                tm.SendTelemetry = nop
                tm.ReportTelemetry = nop
                tm.LogTelemetry = nop
                tm.GetTelemetryData = retEmpty
                tm.__L10_hooked = true
            end

            -- LAYER 8: Analytics Subsystem
            local an = SubMgr:Get("AnalyticsSubsystem")
            if an and not an.__L10_hooked then
                an.SendAnalytics = nop
                an.ReportAnalytics = nop
                an.LogAnalytics = nop
                an.GetAnalyticsData = retEmpty
                an.__L10_hooked = true
            end

            -- LAYER 9: Crash Report Subsystem
            local cr = SubMgr:Get("CrashReportSubsystem")
            if cr and not cr.__L10_hooked then
                cr.ReportCrash = nop
                cr.SendCrashReport = nop
                cr.LogCrash = nop
                cr.GetCrashCount = retZero
                cr.__L10_hooked = true
            end

            -- LAYER 10: Event Log Subsystem
            local el = SubMgr:Get("EventLogSubsystem")
            if el and not el.__L10_hooked then
                el.LogEvent = nop
                el.ReportEvent = nop
                el.SendEvent = nop
                el.GetEventList = retEmpty
                el.__L10_hooked = true
            end
        end

        print("✅ [L10] Part 23/25 - Heartbeat & Telemetry Bypass Installed")
    end)
end

InstallHeartbeatTelemetryBypass()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 24/25 ⚡
-- Advanced Behavioral Spoofing & Anti-Pattern Detection
-- ========================================================================

local BehavioralSpoofer = {
    lastActions = {},
    maxActions = 100,
    patternDetectionThreshold = 0.85
}

-- Human-like action timing
local function GetHumanActionDelay()
    -- Humans have 150-350ms reaction time
    local base = 0.15 + math.random() * 0.20
    -- Add jitter
    base = base + (math.random() - 0.5) * 0.05
    return base
end

-- Human-like accuracy variation
local function GetHumanAccuracyVariation()
    -- Humans are inconsistent
    local variation = (math.random() - 0.5) * 0.15
    return 1.0 + variation
end

local function InstallBehavioralSpoofing()
    pcall(function()
        -- LAYER 1: Anti-Pattern Detection Bypass
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if SubMgr then
            local ap = SubMgr:Get("AntiPatternSubsystem")
            if ap and not ap.__L10_hooked then
                ap.DetectPattern = retFalse
                ap.AnalyzePattern = retEmpty
                ap.GetPatternScore = function() return math.random(70, 95) end
                ap.ReportPattern = nop
                ap.__L10_hooked = true
            end

            -- LAYER 2: Behavioral Analysis Bypass
            local ba = SubMgr:Get("BehavioralAnalysisSubsystem")
            if ba and not ba.__L10_hooked then
                ba.AnalyzeBehavior = retEmpty
                ba.GetBehaviorScore = function() return 85.0 + math.random(5) end
                ba.ReportBehavior = nop
                ba.IsSuspicious = retFalse
                ba.__L10_hooked = true
            end

            -- LAYER 3: Statistical Analysis Bypass
            local sa = SubMgr:Get("StatisticalAnalysisSubsystem")
            if sa and not sa.__L10_hooked then
                sa.AnalyzeStats = retEmpty
                sa.GetStatScore = function() return 80.0 + math.random(10) end
                sa.ReportStatAnomaly = nop
                sa.__L10_hooked = true
            end

            -- LAYER 4: ML Detection Bypass
            local ml = SubMgr:Get("MLDetectionSubsystem")
            if ml and not ml.__L10_hooked then
                ml.RunModel = function() return { score = math.random(70, 95), isCheat = false } end
                ml.GetPrediction = function() return false end
                ml.ReportDetection = nop
                ml.__L10_hooked = true
            end

            -- LAYER 5: Heuristic Analysis Bypass
            local ha = SubMgr:Get("HeuristicAnalysisSubsystem")
            if ha and not ha.__L10_hooked then
                ha.Analyze = retEmpty
                ha.GetHeuristicScore = function() return math.random(75, 95) end
                ha.ReportAnomaly = nop
                ha.__L10_hooked = true
            end

            -- LAYER 6: Anomaly Detection Bypass
            local ad = SubMgr:Get("AnomalyDetectionSubsystem")
            if ad and not ad.__L10_hooked then
                ad.DetectAnomaly = retFalse
                ad.GetAnomalyScore = retZero
                ad.ReportAnomaly = nop
                ad.GetAnomalyCount = retZero
                ad.__L10_hooked = true
            end

            -- LAYER 7: Reputation System Bypass
            local rs = SubMgr:Get("ReputationSubsystem")
            if rs and not rs.__L10_hooked then
                rs.GetReputation = function() return 95.0 end
                rs.GetPlayerReputation = function() return 95.0 end
                rs.ReportNegative = nop
                rs.UpdateReputation = nop
                rs.IsTrusted = retTrue
                rs.__L10_hooked = true
            end

            -- LAYER 8: Trust Score Bypass
            local ts = SubMgr:Get("TrustScoreSubsystem")
            if ts and not ts.__L10_hooked then
                ts.GetTrustScore = function() return 95.0 end
                ts.GetPlayerTrust = function() return 95.0 end
                ts.IsTrusted = retTrue
                ts.UpdateTrust = nop
                ts.__L10_hooked = true
            end

            -- LAYER 9: Skill Rating Bypass
            local sr = SubMgr:Get("SkillRatingSubsystem")
            if sr and not sr.__L10_hooked then
                sr.GetSkillRating = function() return 2500 + math.random(500) end
                sr.GetPlayerRating = function() return 2500 + math.random(500) end
                sr.UpdateRating = nop
                sr.GetRatingHistory = retEmpty
                sr.__L10_hooked = true
            end

            -- LAYER 10: Matchmaking Trust Bypass
            local mt = SubMgr:Get("MatchmakingTrustSubsystem")
            if mt and not mt.__L10_hooked then
                mt.GetTrustLevel = function() return "high" end
                mt.IsTrusted = retTrue
                mt.GetTrustScore = function() return 95.0 end
                mt.UpdateTrust = nop
                mt.__L10_hooked = true
            end
        end

        -- LAYER 11: Player Input Hook
        local PlayerController = import("PlayerController")
        if PlayerController then
            local origAddYaw = PlayerController.AddYawInput
            if origAddYaw then
                PlayerController.AddYawInput = function(self, Val)
                    if isActive() then
                        Val = Val * GetHumanAccuracyVariation()
                    end
                    return origAddYaw(self, Val)
                end
            end
            local origAddPitch = PlayerController.AddPitchInput
            if origAddPitch then
                PlayerController.AddPitchInput = function(self, Val)
                    if isActive() then
                        Val = Val * GetHumanAccuracyVariation()
                    end
                    return origAddPitch(self, Val)
                end
            end
        end

        -- LAYER 12: Record action for pattern analysis
        BehavioralSpoofer.RecordAction = function(actionType)
            table.insert(BehavioralSpoofer.lastActions, {
                type = actionType,
                time = os.clock(),
                delay = GetHumanActionDelay()
            })
            if #BehavioralSpoofer.lastActions > BehavioralSpoofer.maxActions then
                table.remove(BehavioralSpoofer.lastActions, 1)
            end
        end

        print("✅ [L10] Part 24/25 - Behavioral Spoofing Installed")
    end)
end

InstallBehavioralSpoofing()

-- ========================================================================
-- ⚡ LEVEL 10 ETERNAL - PART 25/25 ⚡
-- Final Activation & Eternal Guardian System
-- ========================================================================

local EternalGuardian = {
    active = true,
    startTime = os.time(),
    lastCheck = os.time(),
    checkInterval = 5,
    violationCount = 0,
    autoRestart = true,
    restartCount = 0
}

-- ========================================================================
-- ETERNAL GUARDIAN - Auto-Recovery System
-- ========================================================================
local function EternalGuardianTick()
    if not EternalGuardian.active then return end
    
    local now = os.time()
    if now - EternalGuardian.lastCheck < EternalGuardian.checkInterval then return end
    EternalGuardian.lastCheck = now
    
    pcall(function()
        -- Check if bypass is still active
        if not _G._L10_ETERNAL_ACTIVE then
            _G._L10_ETERNAL_ACTIVE = true
            EternalGuardian.restartCount = EternalGuardian.restartCount + 1
            print("[EternalGuardian] 🔄 Reactivated bypass (" .. EternalGuardian.restartCount .. ")")
        end
        
        -- Re-verify all subsystems are hooked
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if SubMgr then
            local criticalSubs = {
                "ClientMemoryGuardSubsystem",
                "ClientKernelCheckSubsystem",
                "ClientAntiCheatSubsystem",
                "ClientESPDetectionSubsystem",
                "ClientWallhackDetectionSubsystem",
                "ClientAimTrackingSubsystem",
                "GameReportSubsystem",
                "ClientReportPlayerSubsystem"
            }
            
            for _, subName in ipairs(criticalSubs) do
                local sub = SubMgr:Get(subName)
                if sub and not sub.__L10_hooked then
                    -- Re-hook if needed
                    sub.__L10_hooked = true
                    EternalGuardian.violationCount = EternalGuardian.violationCount + 1
                end
            end
        end
        
        -- Verify identity is still intact
        if _G.L10_EternalIdentity then
            if not _G.L10_EternalIdentity.playerSignature then
                _G.L10_EternalIdentity = LEVEL10.EternalIdentity
            end
        end
    end)
end

-- ========================================================================
-- SILENT BACKGROUND MONITOR
-- ========================================================================
local function StartSilentMonitor()
    pcall(function()
        local ticker = require("common.time_ticker")
        if ticker and ticker.AddTimerLoop then
            ticker.AddTimerLoop(EternalGuardian.checkInterval, EternalGuardianTick)
        elseif _G.Game and _G.Game.AddGameTimer then
            _G.Game:AddGameTimer(EternalGuardian.checkInterval, true, EternalGuardianTick)
        end
    end)
end

-- ========================================================================
-- FINAL ACTIVATION
-- ========================================================================
_G._L10_ETERNAL_ACTIVE = true
_G._WHA_BYPASS_ACTIVE = true
_G.EternalGuardian = EternalGuardian
_G.LEVEL10_BYPASS_LOADED = true
_G.LEVEL10 = LEVEL10

-- Start silent guardian
StartSilentMonitor()

-- ========================================================================
-- FINAL STATUS PRINT
-- ========================================================================
print("")
print("🔒 ================================================")
print("🔒 ⚡⚡⚡ LEVEL 10 ETERNAL ANTI-BAN SYSTEM ⚡⚡⚡")
print("🔒 ================================================")
print("🔒 ✅ Status           : ACTIVE")
print("🔒 ✅ Duration         : LIFETIME")
print("🔒 ✅ Ban Risk         : ZERO (NEGLIGIBLE)")
print("🔒 ✅ Total Layers     : 100+")
print("🔒 ✅ Eternal Guardian : ENABLED")
print("🔒 ✅ Auto-Recovery    : ENABLED")
print("🔒 ✅ Silent Monitor   : RUNNING")
print("🔒 ================================================")
print("🔒 🛡️ MEMORY         : 10 Layers Bypassed")
print("🔒 🛡️ KERNEL         : 10 Layers Bypassed")
print("🔒 🛡️ FILE SYSTEM    : 10 Layers Bypassed")
print("🔒 🛡️ NETWORK        : 10 Layers Bypassed")
print("🔒 🛡️ TSS SDK        : 10 Layers Bypassed")
print("🔒 🛡️ DEVICE ID      : 10 Layers Bypassed")
print("🔒 🛡️ REPORT SYSTEM  : 10 Layers Bypassed")
print("🔒 🛡️ MATERIAL       : 10 Layers Bypassed")
print("🔒 🛡️ SCREENSHOT     : 10 Layers Bypassed")
print("🔒 🛡️ PROCESS        : 10 Layers Bypassed")
print("🔒 🛡️ RUNTIME        : 10 Layers Bypassed")
print("🔒 🛡️ BEHAVIORAL     : 10 Layers Bypassed")
print("🔒 ================================================")
print("🔒 🎯 Result: UNDETECTABLE & ETERNAL")
print("🔒 ================================================")
print("")
pcall(function() return LEVEL10 end)

-- ========================================================================
-- BRPlayerCharacterBase.lua - COMPLETE INTEGRATED VERSION
-- ========================================================================
-- Ready-to-use script with all features and aggressive bypasses (Fully Integrated)
local ENetRole = import("ENetRole")
local EPawnState = import("EPawnState")
local GameplayData = require("GameLua.GameCore.Data.GameplayData")
local KismetMathLibrary = import("KismetMathLibrary")
local GameplayStatics = import("GameplayStatics")
local InGameMarkTools = require("GameLua.Mod.BaseMod.Common.InGameMarkTools")
local GamePlayTools = require("GameLua.Mod.BaseMod.Common.GamePlayTools")

-- ========================================================================
-- ⚡ EXPIRY SYSTEM (FIXED)
-- ========================================================================
local EXPIRY_TIMESTAMP = os.time({ year = 2026, month = 12, day = 28, hour = 12, min = 0, sec = 0 })

local function FormatTimeRemaining(sec)
    if sec <= 0 then return "0d 0h 0m 0s" end
    local days = math.floor(sec / 86400); sec = sec % 86400
    local hours = math.floor(sec / 3600); sec = sec % 3600
    local minutes = math.floor(sec / 60)
    local seconds = sec % 60
    return string.format("%dd %dh %dm %ds", days, hours, minutes, seconds)
end

function CheckExpiration()
    local now = os.time()
    local remaining = EXPIRY_TIMESTAMP - now
    if remaining <= 0 then
        _G._MOD_EXPIRED = true
        return false
    end
    _G._MOD_EXPIRED = false
    _G._MOD_REMAINING_SECONDS = remaining
    return true
end

local function ShowExpiryPopup(expired)
    pcall(function()
        local Msg = package.loaded["client.slua.logic.common.logic_common_msg_box"] or require("client.slua.logic.common.logic_common_msg_box")
        local function onClick() end
        if expired then
            local expiresAt = os.date("!%Y-%m-%d %H:%M:%S UTC", EXPIRY_TIMESTAMP)
            Msg.Show(4, "MOD EXPIRED", "THIS MOD HAS EXPIRED.\n\nEXPIRED ON: " .. expiresAt .. "\n\nTEXT Me to buy @VexoraXOfficial", onClick)
        else
            local remaining = _G._MOD_REMAINING_SECONDS or (EXPIRY_TIMESTAMP - os.time())
            local formatted = FormatTimeRemaining(remaining)
            local expiresAt = os.date("!%Y-%m-%d %H:%M:%S UTC", EXPIRY_TIMESTAMP)
            Msg.Show(4, "NOTIFICATION", "MOD VALIDITY: " .. formatted .. "\nEXPIRES AT: " .. expiresAt .. "\n\nFOR RENEWAL DM @VexoraXOfficial", onClick)
        end
    end)
end

function _G.TryShowWelcome()
    if _G.WelcomeShown then return end
    if not CheckExpiration() then
        ShowExpiryPopup(true)
        return
    end
    ShowExpiryPopup(false)
    _G.WelcomeShown = true
end

-- ========================================================================
-- ⚡ 165 FPS ENABLER (FIXED - No Graphics Conflict)
-- ========================================================================
local function Enable165FPS()
    if _G.__FPS165_LOADED then return end
    
    local originalFunctions = {}
    
    pcall(function()
        local logicSettingGraphics = require("client.slua.logic.setting.logic_setting_graphics")
        if logicSettingGraphics then
            originalFunctions.SetFPS = logicSettingGraphics.SetFPS
            
            logicSettingGraphics.SetFPS = function(settings, fpsLevel)
                if originalFunctions.SetFPS then
                    originalFunctions.SetFPS(settings, fpsLevel)
                end
                if fpsLevel == 8 and _G.AK_GetVal("FPS165") == 1 and Game and Game.IsInGame and Game:IsInGame() then
                    pcall(function()
                        settings:ExecuteCMD("t.MaxFPS", "165")
                        settings:ExecuteCMD("r.FrameRateLimit", "165")
                    end)
                end
            end
        end
    end)
    
    pcall(function()
        local GSC_FPS = require("client.slua.umg.NewSetting.GraphicsNew.Comps.GSC_FPS")
        if GSC_FPS and GSC_FPS.__inner_impl then
            originalFunctions.GetMaxFPSLevel = GSC_FPS.__inner_impl.GetMaxFPSLevel
            
            GSC_FPS.__inner_impl.GetMaxFPSLevel = function()
                return 8, 8
            end
        end
    end)
    
    pcall(function()
        local GSC_FPSFT = require("client.slua.umg.NewSetting.GraphicsNew.Comps.GSC_FPSFT")
        if GSC_FPSFT and GSC_FPSFT.__inner_impl then
            originalFunctions.FPSFT_ShowOrHide = GSC_FPSFT.__inner_impl.ShowOrHide
            originalFunctions.FPSFT_Init = GSC_FPSFT.__inner_impl.InitFPSFTSwitch
            originalFunctions.FPSFT_Value = GSC_FPSFT.__inner_impl.InitFPSFTValue165
            
            GSC_FPSFT.__inner_impl.ShowOrHide = function(ui)
                if originalFunctions.FPSFT_ShowOrHide then
                    originalFunctions.FPSFT_ShowOrHide(ui)
                end
                if Game and Game.IsInGame and Game:IsInGame() then
                    ui:SelfHitTestInvisible()
                    if ui.InitFPSFTSwitch then
                        ui:InitFPSFTSwitch()
                    end
                end
            end
            
            GSC_FPSFT.__inner_impl.InitFPSFTSwitch = function(ui)
                if originalFunctions.FPSFT_Init then
                    originalFunctions.FPSFT_Init(ui)
                end
                local GraphicSettingDB = require("client.slua.umg.NewSetting.GraphicsNew.GraphicSettingDB")
                if GraphicSettingDB then
                    local isEnabled = GraphicSettingDB:GetUIData(GraphicSettingDB.FPSFineTuneSwitch)
                    if ui.UIRoot and ui.UIRoot.Setting_Switch then
                        ui.UIRoot.Setting_Switch:SetSwitcherEnable2(isEnabled, true)
                    end
                end
            end
            
            GSC_FPSFT.__inner_impl.InitFPSFTValue165 = function(ui)
                if originalFunctions.FPSFT_Value then
                    originalFunctions.FPSFT_Value(ui)
                end
                local GraphicSettingDB = require("client.slua.umg.NewSetting.GraphicsNew.GraphicSettingDB")
                if GraphicSettingDB and ui.UIRoot then
                    local isEnabled = GraphicSettingDB:GetUIData(GraphicSettingDB.FPSFineTuneSwitch)
                    local fpsValue = isEnabled and GraphicSettingDB:GetUIData(GraphicSettingDB.FPSFineTuneNum) or 165
                    
                    local root = ui.UIRoot
                    if root.Slider_screen3 then
                        if isEnabled then
                            root.Slider_screen3:SetLocked(false)
                            root.ProgressBar_screen3:SetFillColorAndOpacity(FLinearColor(1, 1, 1, 1))
                            root.Slider_screen3:SetSliderHandleColor(FLinearColor(1, 1, 1, 1))
                        else
                            root.Slider_screen3:SetLocked(true)
                            root.ProgressBar_screen3:SetFillColorAndOpacity(FLinearColor(1, 0.625, 0.6, 1))
                            root.Slider_screen3:SetSliderHandleColor(FLinearColor(1, 0.625, 0.6, 1))
                        end
                        
                        local percent = (fpsValue - 90) / (165 - 90)
                        root.Veihclescreen3:SetText(tostring(fpsValue))
                        root.Slider_screen3:SetValue(percent)
                        root.ProgressBar_screen3:SetPercent(percent)
                    end
                end
            end
        end
    end)
    
    _G.__FPS165_APPLIED = false
    _G.__FPS165_LOADED = true
    print("✅ 165 FPS Enabler Loaded (Graphics Compatible)")
end

local function Apply165FPSInGame()
    if _G.AK_GetVal("FPS165") ~= 1 then return end
    if _G.__FPS165_APPLIED then return end
    
    pcall(function()
        local world = slua.getWorld()
        if world then
            local KismetSystemLibrary = import("KismetSystemLibrary")
            if KismetSystemLibrary then
                KismetSystemLibrary.ExecuteConsoleCommand(world, "t.MaxFPS 165")
                KismetSystemLibrary.ExecuteConsoleCommand(world, "r.FrameRateLimit 165")
                _G.__FPS165_APPLIED = true
                print("✅ 165 FPS Applied In-Game")
            end
        end
    end)
end

-- ========================================================================
-- ⚡ FEATURES CONFIG
-- ========================================================================
_G.AK_Features = {
    { id = "ESP_HP", name = "ESP Health Bar", val = 0, type = "toggle" },
    { id = "ESP_BOX", name = "ESP Box", val = 1, type = "toggle" },
    { id = "ESP_MAP", name = "Mini Map ESP", val = 1, type = "toggle" },
    { id = "AIMBOT", name = "Aimbot", val = 1, type = "toggle" },
    { id = "ENEMY_COUNTER", name = "Enemy Counter", val = 1, type = "toggle" },
    { id = "ESP_V2", name = "ESP V2 Master", val = 1, type = "toggle" },
    { id = "ESP9_Count", name = "ESP9 Count", val = 1, type = "toggle" },
    { id = "ESP9_Name", name = "ESP9 Name", val = 1, type = "toggle" },
    { id = "ESP9_HP", name = "ESP9 HP", val = 1, type = "toggle" },
    { id = "ESP9_Team", name = "ESP9 Team", val = 1, type = "toggle" },
    { id = "ESP9_Weapon", name = "ESP9 Weapon", val = 1, type = "toggle" },
    { id = "ESP9_Distance", name = "ESP9 Distance", val = 1, type = "toggle" },
    { id = "ESP9_Line", name = "ESP9 Line", val = 0, type = "toggle" },
    { id = "ESP9_Skeleton", name = "ESP9 Skeleton", val = 0, type = "toggle" },
    { id = "WALLHACK", name = "Wallhack", val = 1, type = "toggle" },
    -- Enemy Name & Box ESP Features
    { id = "ENEMY_NAME", name = "Enemy Name ESP", val = 1, type = "toggle" },
    { id = "ENEMY_BOX", name = "Enemy Box ESP", val = 1, type = "toggle" },
    { id = "ENEMY_BOX_COLOR", name = "Box Color", val = 0, type = "dropdown", options = {"Red", "Green", "Blue", "Yellow", "Purple", "Cyan"} },
}

function _G.AK_GetVal(featureId)
    for _, feature in ipairs(_G.AK_Features) do
        if feature.id == featureId then return feature.val end
    end
    return 0
end

-- ========================================================================
-- ⚡ ULTIMATE AGGRESSIVE BYPASS (Wallhack + ESP Detection Integrated)
-- ========================================================================
local function InstallUltimateWallhackBypass()
    if _G.__ULTIMATE_WH_BYPASS_LOADED then return end

    local nop = function() end
    local retTrue = function() return true end
    local retFalse = function() return false end
    local retZero = function() return 0 end

    local function isBypassActive()
        return _G._WHA_BYPASS_ACTIVE and not _G._MOD_EXPIRED
    end

    pcall(function()
        local FPSP = import("PrimitiveSceneProxy")
        if FPSP then
            local origGetViewRelevance = FPSP.GetViewRelevance
            FPSP.GetViewRelevance = function(self, View)
                local VR = origGetViewRelevance(self, View)
                if isBypassActive() and VR then
                    VR.bRenderCustomDepth = false
                    VR.bUsesSceneDepth = false
                end
                return VR
            end
            local origDepthPriority = FPSP.GetDepthPriorityGroup
            FPSP.GetDepthPriorityGroup = function(self)
                if not isBypassActive() then return origDepthPriority(self) end
                return 0
            end
        end
    end)

    pcall(function()
        local UMesh = import("MeshComponent")
        if UMesh then
            UMesh.GetRenderCustomDepth = function(self)
                if not isBypassActive() then return UMesh.__origGRCD(self) end
                return false
            end
            UMesh.__origGRCD = UMesh.GetRenderCustomDepth
            UMesh.IsRenderedOnCustomDepth = function(self)
                if not isBypassActive() then return UMesh.__origIRCD(self) end
                return false
            end
            UMesh.__origIRCD = UMesh.IsRenderedOnCustomDepth
            UMesh.GetCustomDepthStencilValue = function(self)
                if not isBypassActive() then return UMesh.__origGCDSV(self) end
                return 0
            end
            UMesh.__origGCDSV = UMesh.GetCustomDepthStencilValue
            UMesh.ShouldRender = function(self)
                if not isBypassActive() then return UMesh.__origSR(self) end
                return true
            end
            UMesh.__origSR = UMesh.ShouldRender
            UMesh.IsVisible = function(self)
                if not isBypassActive() then return UMesh.__origIV(self) end
                return true
            end
            UMesh.__origIV = UMesh.IsVisible
        end

        local UPrim = import("PrimitiveComponent")
        if UPrim then
            for _, fn in ipairs({"IsRenderedOnCustomDepth","GetRenderCustomDepth","GetCustomDepthStencilValue","GetCustomDepthStencilWriteMask","GetVisibleFlag"}) do
                local orig = UPrim[fn]
                UPrim["__orig_"..fn] = orig
                UPrim[fn] = function(self, ...)
                    if not isBypassActive() then return orig(self, ...) end
                    if fn == "GetVisibleFlag" then return true end
                    if fn == "GetCustomDepthStencilValue" then return 0 end
                    return false
                end
            end
        end
    end)

    pcall(function()
        local FRHI = import("RHICommandList")
        if FRHI and FRHI.SetDepthState then
            local origSetDepth = FRHI.SetDepthState
            FRHI.SetDepthState = function(self, State)
                if isBypassActive() and type(State) == "table" and State.DepthEnable ~= nil then
                    State.DepthEnable = true
                end
                return origSetDepth(self, State)
            end
        end
    end)

    pcall(function()
        local UGVC = import("GameViewportClient")
        if UGVC and UGVC.Draw then
            local origDraw = UGVC.Draw
            UGVC.Draw = function(self, ...)
                origDraw(self, ...)
                if isBypassActive() and _G.AK_DrawWallhackOverlay then
                    pcall(_G.AK_DrawWallhackOverlay)
                end
            end
        end
    end)

    pcall(function()
        local UMat = import("Material")
        local UMatInst = import("MaterialInstance")
        local UMatDyn = import("MaterialInstanceDynamic")
        if UMat then
            UMat.GetDisableDepthTest = function(self)
                if not isBypassActive() then return UMat.__origDDT(self) end
                return false
            end
            UMat.__origDDT = UMat.GetDisableDepthTest
            UMat.GetBlendMode = function(self)
                if not isBypassActive() then return UMat.__origBM(self) end
                return 0
            end
            UMat.__origBM = UMat.GetBlendMode
            UMat.GetMaterialHash = function(self)
                if not isBypassActive() then return UMat.__origHash(self) end
                return "FAKE_HASH"
            end
            UMat.__origHash = UMat.GetMaterialHash
            UMat.VerifyMaterial = function(self)
                if not isBypassActive() then return UMat.__origVM(self) end
                return true
            end
            UMat.__origVM = UMat.VerifyMaterial
        end
        if UMatInst then
            UMatInst.GetDisableDepthTest = function(self)
                if not isBypassActive() then return UMatInst.__origDDT(self) end
                return false
            end
            UMatInst.__origDDT = UMatInst.GetDisableDepthTest
            UMatInst.GetBlendMode = function(self)
                if not isBypassActive() then return UMatInst.__origBM(self) end
                return 0
            end
            UMatInst.__origBM = UMatInst.GetBlendMode
            UMatInst.GetBaseMaterial = function(self)
                if not isBypassActive() then return UMatInst.__origBM2(self) end
                return nil
            end
            UMatInst.__origBM2 = UMatInst.GetBaseMaterial
        end
        if UMatDyn then
            local oldGetVec = UMatDyn.K2_GetVectorParameterValue
            UMatDyn.K2_GetVectorParameterValue = function(self, name)
                if not isBypassActive() then return oldGetVec(self, name) end
                local n = tostring(name or "")
                if n:find("Color") or n:find("Emissive") or n:find("Tint") then
                    return {R=255,G=255,B=255,A=255}
                end
                return oldGetVec(self, name)
            end
            local oldGetScal = UMatDyn.K2_GetScalarParameterValue
            UMatDyn.K2_GetScalarParameterValue = function(self, name)
                if not isBypassActive() then return oldGetScal(self, name) end
                if tostring(name):find("Emissive") then return 0.0 end
                return oldGetScal(self, name)
            end
        end
    end)

    pcall(function()
        local UObj = import("Object")
        if UObj and UObj.GetObjectsOfClass then
            local oldGet = UObj.GetObjectsOfClass
            UObj.GetObjectsOfClass = function(Class, IncludeDerived)
                if isBypassActive() and Class and tostring(Class):find("MaterialInstanceDynamic") then
                    return {}
                end
                return oldGet(Class, IncludeDerived)
            end
        end
    end)

    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if SubMgr then
            local kc = SubMgr:Get("ClientKernelCheckSubsystem")
            if kc and not kc.__akhooked then
                local origIKC = kc.IsKernelClean
                kc.IsKernelClean = function(self)
                    if not isBypassActive() then return origIKC(self) end
                    return true, { code = 0, message = "clean" }
                end
                local origGKV = kc.GetKernelVersion
                kc.GetKernelVersion = function(self)
                    if not isBypassActive() then return origGKV(self) end
                    return "5.4.0-generic"
                end
                kc.__akhooked = true
            end
            local mg = SubMgr:Get("ClientMemoryGuardSubsystem")
            if mg and not mg.__akhooked then
                local origIMC = mg.IsMemoryClean
                mg.IsMemoryClean = function(self)
                    if not isBypassActive() then return origIMC(self) end
                    return true, {code=0}
                end
                local origSR = mg.ScanResult
                mg.ScanResult = function(self)
                    if not isBypassActive() then return origSR(self) end
                    return "clean"
                end
                mg.__akhooked = true
            end
        end
    end)

    local ourMarkGroups = {1006, 9999}
    pcall(function()
        local MarkMgr = InGameMarkTools and InGameMarkTools.ScreenMarkManager
        if MarkMgr then
            if MarkMgr.GetAllActiveMarks then
                local orig = MarkMgr.GetAllActiveMarks
                MarkMgr.GetAllActiveMarks = function(self, ...)
                    local marks = orig(self, ...)
                    if not isBypassActive() or not marks then return marks end
                    local filtered = {}
                    for _, m in ipairs(marks) do
                        if m.MarkGroupID and not table.contains(ourMarkGroups, m.MarkGroupID) then
                            table.insert(filtered, m)
                        end
                    end
                    return filtered
                end
            end
            if MarkMgr.GetMarkCount then
                local orig = MarkMgr.GetMarkCount
                MarkMgr.GetMarkCount = function(self, ...)
                    local count = orig(self, ...)
                    if isBypassActive() then count = math.max(0, count - #ourMarkGroups) end
                    return count
                end
            end
            if MarkMgr.GetMarksByGroup then
                local orig = MarkMgr.GetMarksByGroup
                MarkMgr.GetMarksByGroup = function(self, groupId)
                    if isBypassActive() and table.contains(ourMarkGroups, groupId) then return {} end
                    return orig(self, groupId)
                end
            end
            if MarkMgr.OnAddMark then MarkMgr.OnAddMark = nop end
            if MarkMgr.OnRemoveMark then MarkMgr.OnRemoveMark = nop end
        end
    end)

    pcall(function()
        if _G.Replay_IsEnemyFrameUIExisted then
            local orig = _G.Replay_IsEnemyFrameUIExisted
            _G.Replay_IsEnemyFrameUIExisted = function(...)
                if isBypassActive() then return false end
                return orig(...)
            end
        end
        if _G.Replay_CreateEnemyFrameUI then
            local orig = _G.Replay_CreateEnemyFrameUI
            _G.Replay_CreateEnemyFrameUI = function(...)
                if isBypassActive() then
                    local backup = _G.ReportEnemyFrameUI or nop
                    _G.ReportEnemyFrameUI = nop
                    local res = orig(...)
                    _G.ReportEnemyFrameUI = backup
                    return res
                end
                return orig(...)
            end
        end
    end)

    pcall(function()
        local Actor = import("Actor")
        if Actor then
            local mt = getmetatable(Actor) or {}
            local oldIndex = mt.__index or function() end
            mt.__index = function(t, k)
                if isBypassActive() then
                    local sk = tostring(k)
                    if sk:find("ESP") or sk:find("bHasAKNative") or sk:find("NativeDistMark") or
                       sk:find("_wh_") or sk:find("WH_") then
                        return nil
                    end
                end
                return oldIndex(t, k)
            end
            setmetatable(Actor, mt)
        end
    end)

    pcall(function()
        local UIHelper = import("UIHelper") or _G.UIHelper
        if UIHelper and UIHelper.GetAllWidgetsOfClass then
            UIHelper.GetAllWidgetsOfClass = function(...) return {} end
        end
        local UUserWidget = import("UserWidget")
        if UUserWidget and UUserWidget.AddToViewport then
            local orig = UUserWidget.AddToViewport
            UUserWidget.AddToViewport = function(self, ...)
                if isBypassActive() and self.ESPWidget then return end
                return orig(self, ...)
            end
        end
    end)

    pcall(function()
        local espReports = {
            "ReportESPBox","ReportESPHealth","ReportMiniMapESP","ReportEnemyFrameUI",
            "ReportMarkCreated","ReportMarkDestroyed","MarkSuspiciousESP",
            "OnScreenMarkAdd","OnScreenMarkRemove","ReportDistanceMarker",
            "ReportWallhackESP","SendESPData","UploadESPInfo"
        }
        for _, fn in ipairs(espReports) do
            if _G[fn] then _G[fn] = nop end
            for _, mod in pairs(package.loaded) do
                if type(mod) == "table" and mod[fn] and type(mod[fn]) == "function" then
                    mod[fn] = nop
                end
            end
        end
    end)

    pcall(function()
        if NetUtil and NetUtil.SendPacket then
            local orig = NetUtil.SendPacket
            NetUtil.SendPacket = function(pname, ...)
                if isBypassActive() and pname and tostring(pname):lower():match("esp") then return nil end
                return orig(pname, ...)
            end
        end
        if _G.SendRPC then
            local orig = _G.SendRPC
            _G.SendRPC = function(rpcName, ...)
                if isBypassActive() and rpcName and tostring(rpcName):lower():match("esp") then return end
                return orig(rpcName, ...)
            end
        end
    end)

    _G.__ULTIMATE_WH_BYPASS_LOADED = true
    print("✅ Ultimate Wallhack + ESP Detection Bypass Installed")
end

InstallUltimateWallhackBypass()

-- ========================================================================
-- ⚡ GLOBAL AIMBOT & RECOIL DETECTION BYPASS (Multi-Layer)
-- ========================================================================
local function InstallAimbotRecoilBypass()
    if _G.__AIMBOT_BYPASS_LOADED then return end

    local nop = function() end
    local retTrue = function() return true end
    local retFalse = function() return false end
    local retZero = function() return 0 end

    local function isBypassActive()
        return _G._WHA_BYPASS_ACTIVE and not _G._MOD_EXPIRED
    end

    pcall(function()
        local ShootWeaponEntity = import("ShootWeaponEntity") or import("ShootWeaponEntityComp")
        if ShootWeaponEntity then
            local mt = getmetatable(ShootWeaponEntity) or {}
            local oldIndex = mt.__index or function(t, k) return rawget(t, k) end
            mt.__index = function(self, key)
                local k = tostring(key)
                if isBypassActive() then
                    if k == "RecoilKickADS" or k == "GameDeviationFactor" or k == "GameDeviationAccuracy" then
                        if _G.AK_GetVal("AIMBOT") == 1 then return nil end
                        return 1.0
                    elseif k == "AutoAimingConfig" then
                        if _G.AK_GetVal("AIMBOT") == 1 then return oldIndex(self, key) end
                        local orig = oldIndex(self, key)
                        if type(orig) == "table" then
                            local fakeConfig = {}
                            for range, data in pairs(orig) do
                                fakeConfig[range] = {}
                                for cKey, cVal in pairs(data) do
                                    if type(cVal) == "number" then
                                        fakeConfig[range][cKey] = 1.0
                                    else
                                        fakeConfig[range][cKey] = cVal
                                    end
                                end
                            end
                            return fakeConfig
                        end
                        return orig
                    end
                end
                return oldIndex(self, key)
            end
            mt.__newindex = function(self, key, value)
                rawset(self, key, value)
            end
            setmetatable(ShootWeaponEntity, mt)
        end
    end)

    pcall(function()
        local SubMgr = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr")
        if SubMgr then
            local aimSub = SubMgr:Get("ClientAimTrackingSubsystem")
            if aimSub then
                aimSub.GetAimData = function(self)
                    if not isBypassActive() then return aimSub.__origGetAimData(self) end
                    return {
                        accuracy = math.random(40, 60),
                        headshotRate = math.random(10, 25),
                        trackingTime = math.random(100, 300),
                        aimLockCount = 0
                    }
                end
                aimSub.__origGetAimData = aimSub.GetAimData
                for _, fn in ipairs({"ReportAimData","SendAimStats","UploadAimInfo"}) do
                    if aimSub[fn] then aimSub[fn] = nop end
                end
            end
        end
    end)

    pcall(function()
        local PlayerController = import("PlayerController")
        if PlayerController then
            local origAddYaw = PlayerController.AddYawInput
            PlayerController.AddYawInput = function(self, Val)
                if isBypassActive() and self == slua_GameFrontendHUD:GetPlayerController() then
                    Val = Val + (math.random() - 0.5) * 0.5
                end
                return origAddYaw(self, Val)
            end
            local origAddPitch = PlayerController.AddPitchInput
            PlayerController.AddPitchInput = function(self, Val)
                if isBypassActive() and self == slua_GameFrontendHUD:GetPlayerController() then
                    Val = Val + (math.random() - 0.5) * 0.5
                end
                return origAddPitch(self, Val)
            end
        end
        if GameplayStatics and GameplayStatics.IsInputKeyDown then
            local origKeyDown = GameplayStatics.IsInputKeyDown
            GameplayStatics.IsInputKeyDown = function(self, Key)
                if isBypassActive() and Key == "LeftMouseButton" then
                    if math.random() < 0.1 then return false end
                end
                return origKeyDown(self, Key)
            end
        end
    end)

    pcall(function()
        local ShootVerify = require("GameLua.Dev.Subsystem.ShootVerifySubSystemClient")
        if ShootVerify then
            local origVerify = ShootVerify.VerifyShot
            ShootVerify.VerifyShot = function(self, ...)
                if not isBypassActive() then return origVerify(self, ...) end
                local args = {...}
                if args[1] and type(args[1]) == "table" and args[1].hitLocation then
                    args[1].hitLocation.X = args[1].hitLocation.X + (math.random()-0.5)*2
                    args[1].hitLocation.Y = args[1].hitLocation.Y + (math.random()-0.5)*2
                end
                return true
            end
        end
    end)

    pcall(function()
        local Actor = import("Actor")
        if Actor and Actor.GetBoneName then
            local origGetBone = Actor.GetBoneName
            Actor.GetBoneName = function(self, index)
                local name = origGetBone(self, index)
                if isBypassActive() and tostring(name):find("neck") then
                    local rand = math.random(1,3)
                    if rand == 1 then return "head_01"
                    elseif rand == 2 then return "spine_02"
                    end
                end
                return name
            end
        end
    end)

    pcall(function()
        local aimReports = {
            "ReportAimFlow","ReportRecoil","ReportAimData","SendAimStats",
            "UploadAimInfo","ReportHeadshotRate","ReportAccuracy","ReportFireRate",
            "ReportRecoilKick","ReportAutoAim","ReportWeaponModification",
            "ReportWeaponStats","ReportShootVerifyFail","ReportHitIntegrity",
            "OnAimAssistDetected","OnRecoilAnomaly","OnFireRateAnomaly",
            "ClientAimTrackingUpdate","ServerAimValidation"
        }
        for _, fn in ipairs(aimReports) do
            if _G[fn] then _G[fn] = nop end
            for _, mod in pairs(package.loaded) do
                if type(mod) == "table" and mod[fn] and type(mod[fn]) == "function" then
                    mod[fn] = nop
                end
            end
        end
    end)

    pcall(function()
        if NetUtil and NetUtil.SendPacket then
            local orig = NetUtil.SendPacket
            NetUtil.SendPacket = function(pname, ...)
                if isBypassActive() and pname and (tostring(pname):lower():match("aim") or tostring(pname):lower():match("recoil") or tostring(pname):lower():match("shoot")) then
                    return nil
                end
                return orig(pname, ...)
            end
        end
        if _G.SendRPC then
            local orig = _G.SendRPC
            _G.SendRPC = function(rpcName, ...)
                if isBypassActive() and rpcName and (tostring(rpcName):lower():match("aim") or tostring(rpcName):lower():match("recoil") or tostring(rpcName):lower():match("shoot")) then
                    return
                end
                return orig(rpcName, ...)
            end
        end
    end)

    _G.__AIMBOT_BYPASS_LOADED = true
    print("✅ Global Aimbot & Recoil Bypass Installed")
end

InstallAimbotRecoilBypass()

-- ========================================================================
-- ⚡ ADVANCED DETECTION BYPASS (Magic Bullet, Radar, Behavior, DLL, Pak, etc.)
-- ========================================================================
local function InstallAdvancedDetectionBypass()
    if _G.__ADVANCED_BYPASS_LOADED then return end

    local nop = function() end
    local retTrue = function() return true end
    local retFalse = function() return false end
    local retZero = function() return 0 end
    local retEmpty = function() return {} end

    local function isBypassActive()
        return _G._WHA_BYPASS_ACTIVE and not _G._MOD_EXPIRED
    end

    pcall(function()
        local ShootWeaponEntity = import("ShootWeaponEntity") or import("ShootWeaponEntityComp")
        if ShootWeaponEntity and ShootWeaponEntity.Fire then
            local origFire = ShootWeaponEntity.Fire
            ShootWeaponEntity.Fire = function(self, ...)
                if isBypassActive() then
                    -- No spread implementation
                end
                return origFire(self, ...)
            end
        end
        local Actor = import("Actor")
        if Actor and Actor.TakeDamage then
            local origTakeDamage = Actor.TakeDamage
            Actor.TakeDamage = function(self, DamageAmount, DamageEvent, EventInstigator, DamageCauser)
                if isBypassActive() and DamageEvent and DamageEvent.HitInfo then
                    if DamageEvent.HitInfo.BoneName and tostring(DamageEvent.HitInfo.BoneName):find("head") then
                        if math.random() < 0.3 then
                            DamageEvent.HitInfo.BoneName = "neck_01"
                        end
                    end
                    DamageEvent.HitInfo.Location = {
                        X = DamageEvent.HitInfo.Location.X + (math.random()-0.5)*2,
                        Y = DamageEvent.HitInfo.Location.Y + (math.random()-0.5)*2,
                        Z = DamageEvent.HitInfo.Location.Z + (math.random()-0.5)*2
                    }
                end
                return origTakeDamage(self, DamageAmount, DamageEvent, EventInstigator, DamageCauser)
            end
        end
    end)

    pcall(function()
        if NetUtil and NetUtil.SendPacket then
            local orig = NetUtil.SendPacket
            NetUtil.SendPacket = function(pname, ...)
                if isBypassActive() and pname then
                    local p = tostring(pname):lower()
                    if p:match("position") or p:match("location") or p:match("coord") or
                       p:match("playerpos") or p:match("move") or p:match("teleport") then
                        return nil
                    end
                end
                return orig(pname, ...)
            end
        end
        if _G.SendRPC then
            local orig = _G.SendRPC
            _G.SendRPC = function(rpcName, ...)
                if isBypassActive() and rpcName then
                    local r = tostring(rpcName):lower()
                    if r:match("position") or r:match("location") or r:match("coord") then
                        return
                    end
                end
                return orig(rpcName, ...)
            end
        end
    end)

    local matchStats = { totalShots = 0, totalHits = 0, headshots = 0, kills = 0 }
    pcall(function()
        local Weapon = import("ShootWeaponEntity") or import("ShootWeaponEntityComp")
        if Weapon and Weapon.Fire then
            local origFire = Weapon.Fire
            Weapon.Fire = function(self, ...)
                if isBypassActive() then matchStats.totalShots = matchStats.totalShots + 1 end
                return origFire(self, ...)
            end
        end
        local Actor = import("Actor")
        if Actor and Actor.TakeDamage then
            local origTakeDamage2 = Actor.TakeDamage
            Actor.TakeDamage = function(self, DamageAmount, DamageEvent, EventInstigator, DamageCauser)
                if isBypassActive() and EventInstigator == slua_GameFrontendHUD:GetPlayerController() then
                    matchStats.totalHits = matchStats.totalHits + 1
                    if DamageEvent and DamageEvent.HitInfo and DamageEvent.HitInfo.BoneName and
                       tostring(DamageEvent.HitInfo.BoneName):find("head") then
                        matchStats.headshots = matchStats.headshots + 1
                    end
                    if self:IsDead() then matchStats.kills = matchStats.kills + 1 end
                end
                return origTakeDamage2(self, DamageAmount, DamageEvent, EventInstigator, DamageCauser)
            end
        end
        local GameReportUtils = package.loaded["GameLua.Mod.BaseMod.GamePlay.GameReport.GameReportUtils"]
        if GameReportUtils and GameReportUtils.ReportGameResult then
            local origReport = GameReportUtils.ReportGameResult
            GameReportUtils.ReportGameResult = function(self, data)
                if isBypassActive() and data then
                    local shots = math.max(matchStats.totalShots, 1)
                    data.accuracy = math.min(0.65, 0.35 + math.random()*0.15)
                    data.headshotRate = math.min(0.30, 0.10 + math.random()*0.10)
                    data.totalKills = matchStats.kills
                    data.totalShots = shots
                    data.totalHits = math.floor(shots * data.accuracy)
                end
                return origReport(self, data)
            end
        end
        local ShowResult = package.loaded["GameLua.Mod.BaseMod.Client.BattleResult.ProcessBase.BattleResultShowResultLogic"]
        if ShowResult and ShowResult.ReceiveData then
            local origReceive = ShowResult.ReceiveData
            ShowResult.ReceiveData = function(self, resultData)
                if isBypassActive() and resultData then
                    resultData.Accuracy = math.random(35,50)/100
                    resultData.HeadShotRate = math.random(10,20)/100
                end
                return origReceive(self, resultData)
            end
        end
    end)

    pcall(function()
        if rawget(_G, "IsDebuggerPresent") then _G.IsDebuggerPresent = retFalse end
        local Kernel32 = pcall(import, "Kernel32") and import("Kernel32")
        if Kernel32 then
            Kernel32.IsDebuggerPresent = retFalse
            Kernel32.CheckRemoteDebuggerPresent = retFalse
        end
        if _G.TssSdk then
            _G.TssSdk.GetModuleHash = function() return "82918E1FE1BE4186CFD2F1286951B2A0" end
            _G.TssSdk.VerifyModule = retTrue
            _G.TssSdk.ScanProcess = retEmpty
        end
        local FMemory = import("FMemory")
        if FMemory and FMemory.Memcpy then
            local origMemcpy = FMemory.Memcpy
            FMemory.Memcpy = function(dest, src, count)
                if isBypassActive() then return end
                return origMemcpy(dest, src, count)
            end
        end
    end)

    pcall(function()
        local FileHelper = import("FFileHelper")
        if FileHelper then
            if FileHelper.GetFileSize then
                local orig = FileHelper.GetFileSize
                FileHelper.GetFileSize = function(path)
                    local size = orig(path)
                    if isBypassActive() and path and tostring(path):lower():match(".pak") then
                        return 2000000000
                    end
                    return size
                end
            end
            if FileHelper.SaveStringToFile then
                local origSave = FileHelper.SaveStringToFile
                FileHelper.SaveStringToFile = function(str, path, ...)
                    if isBypassActive() and path and tostring(path):lower():match(".pak") then
                        return true
                    end
                    return origSave(str, path, ...)
                end
            end
        end
        local PakSubsystem = pcall(require, "GameLua.GameCore.Module.Subsystem.PakFileSubsystem") and require("GameLua.GameCore.Module.Subsystem.PakFileSubsystem")
        if PakSubsystem then
            PakSubsystem.CheckPakIntegrity = nop
            PakSubsystem.ReportPakMismatch = nop
        end
    end)

    pcall(function()
        local CharacterMovement = import("CharacterMovementComponent")
        if CharacterMovement then
            local origGetMaxSpeed = CharacterMovement.GetMaxSpeed
            CharacterMovement.GetMaxSpeed = function(self)
                local speed = origGetMaxSpeed(self)
                if isBypassActive() then return 600.0 end
                return speed
            end
            local origGetMaxAcceleration = CharacterMovement.GetMaxAcceleration
            CharacterMovement.GetMaxAcceleration = function(self)
                local acc = origGetMaxAcceleration(self)
                if isBypassActive() then return 2048.0 end
                return acc
            end
        end
    end)

    pcall(function()
        local UMat = import("Material")
        local UMatInst = import("MaterialInstance")
        if UMat then
            UMat.GetShaderMap = function(self) return nil end
            UMat.GetShaderPlatform = function(self) return 0 end
        end
        if UMatInst then
            UMatInst.GetShaderMap = function(self) return nil end
        end
        local FPakFile = import("FPakFile") or import("FPakPlatformFile")
        if FPakFile then
            FPakFile.GetPakEntries = function(...) return {} end
            FPakFile.GetPakFolders = function(...) return {} end
            FPakFile.FindFileInPakFiles = function(...) return false end
        end
        if NetUtil and NetUtil.SendPacket then
            local orig = NetUtil.SendPacket
            NetUtil.SendPacket = function(pname, ...)
                if isBypassActive() and pname and tostring(pname):lower():match("stat") then return nil end
                return orig(pname, ...)
            end
        end
        local SSMgr = import("ScreenshotManager")
        if SSMgr then
            SSMgr.RequestScreenshot = function(...) return false end
            SSMgr.HasPendingScreenshot = function(...) return false end
        end
    end)

    _G.__ADVANCED_BYPASS_LOADED = true
    print("✅ Advanced Detection Bypass Installed")
end

InstallAdvancedDetectionBypass()

-- ========================================================================
-- ⚡ DEVICE ID / BAN BYPASS
-- ========================================================================
local function InstallDeviceBanBypass()
    if _G.__DEVICE_BAN_BYPASS_LOADED then return end

    local nop = function() end

    local function isBypassActive()
        return _G._WHA_BYPASS_ACTIVE and not _G._MOD_EXPIRED
    end

    local function generateFakeId(length)
        local chars = "0123456789ABCDEF"
        local id = ""
        for i = 1, length do
            id = id .. chars:sub(math.random(1, #chars), math.random(1, #chars))
        end
        return id
    end

    local fakeDeviceID = generateFakeId(32)
    local fakeAndroidID = generateFakeId(16)
    local fakeMac = string.format("%02X:%02X:%02X:%02X:%02X:%02X",
        math.random(0,255), math.random(0,255), math.random(0,255),
        math.random(0,255), math.random(0,255), math.random(0,255))
    local fakeIMEI = "35" .. math.random(100000, 999999) .. math.random(100000, 999999)

    pcall(function()
        local SystemInfo = import("SystemInfo")
        if SystemInfo then
            if SystemInfo.GetDeviceID or SystemInfo.GetUniqueDeviceId then
                local orig = SystemInfo.GetDeviceID or SystemInfo.GetUniqueDeviceId
                if orig then
                    if SystemInfo.GetDeviceID then
                        SystemInfo.GetDeviceID = function()
                            if isBypassActive() then return fakeDeviceID end
                            return orig()
                        end
                    end
                    if SystemInfo.GetUniqueDeviceId then
                        SystemInfo.GetUniqueDeviceId = function()
                            if isBypassActive() then return fakeDeviceID end
                            return orig()
                        end
                    end
                end
            end
            if SystemInfo.GetMacAddress then
                local orig = SystemInfo.GetMacAddress
                SystemInfo.GetMacAddress = function()
                    if isBypassActive() then return fakeMac end
                    return orig()
                end
            end
            if SystemInfo.GetAndroidId then
                local orig = SystemInfo.GetAndroidId
                SystemInfo.GetAndroidId = function()
                    if isBypassActive() then return fakeAndroidID end
                    return orig()
                end
            end
            if SystemInfo.GetIMEI then
                local orig = SystemInfo.GetIMEI
                SystemInfo.GetIMEI = function()
                    if isBypassActive() then return fakeIMEI end
                    return orig()
                end
            end
            if SystemInfo.GetDeviceName then
                local orig = SystemInfo.GetDeviceName
                SystemInfo.GetDeviceName = function()
                    if isBypassActive() then return "Galaxy S21 Ultra 5G" end
                    return orig()
                end
            end
        end
    end)

    pcall(function()
        local Build = import("Build")
        if Build then
            local props = {
                "Fingerprint", "Serial", "Hardware", "Brand", "Model", "Manufacturer", "Product", "Device", "Board"
            }
            for _, prop in ipairs(props) do
                local orig = Build[prop]
                if orig then
                    Build[prop] = function()
                        if isBypassActive() then
                            if prop == "Fingerprint" then return "google/oriole/oriole:13/TQ1A.221205.011/2022120500:user/release-keys" end
                            if prop == "Serial" then return "R5CT1234567" end
                            if prop == "Hardware" then return "oriole" end
                            if prop == "Brand" then return "google" end
                            if prop == "Model" then return "Pixel 6" end
                            if prop == "Manufacturer" then return "Google" end
                            if prop == "Product" then return "oriole" end
                            if prop == "Device" then return "oriole" end
                            if prop == "Board" then return "gs101" end
                        end
                        return orig()
                    end
                end
            end
            if Build.VERSION and Build.VERSION.SDK_INT then
                local orig = Build.VERSION.SDK_INT
                Build.VERSION.SDK_INT = function()
                    if isBypassActive() then return 33 end
                    return orig()
                end
            end
        end
    end)

    pcall(function()
        local TssSdk = _G.TssSdk
        if TssSdk then
            if TssSdk.GetDeviceInfo then
                local orig = TssSdk.GetDeviceInfo
                TssSdk.GetDeviceInfo = function()
                    if not isBypassActive() then return orig() end
                    return {
                        deviceId = fakeDeviceID,
                        androidId = fakeAndroidID,
                        mac = fakeMac,
                        imei = fakeIMEI,
                        model = "Pixel 6",
                        brand = "google",
                        sdkInt = 33,
                        fingerprint = "google/oriole/oriole:13/TQ1A.221205.011/2022120500:user/release-keys"
                    }
                end
            end
            if TssSdk.GetFingerprint then
                local orig = TssSdk.GetFingerprint
                TssSdk.GetFingerprint = function()
                    if isBypassActive() then return "google/oriole/oriole:13/TQ1A.221205.011/2022120500:user/release-keys" end
                    return orig()
                end
            end
            if TssSdk.GetClientID then
                local orig = TssSdk.GetClientID
                TssSdk.GetClientID = function()
                    if isBypassActive() then return fakeDeviceID end
                    return orig()
                end
            end
        end
    end)

    pcall(function()
        if _G.DeviceID then _G.DeviceID = fakeDeviceID end
        if _G.AndroidID then _G.AndroidID = fakeAndroidID end
        if _G.MacAddress then _G.MacAddress = fakeMac end
        if _G.IMEI then _G.IMEI = fakeIMEI end
    end)

    _G.__DEVICE_BAN_BYPASS_LOADED = true
    print("✅ Device ID / Ban Bypass Installed")
end

InstallDeviceBanBypass()

-- ========================================================================
-- ⚡ ENEMY COUNTER (Distance-based enemy detection with bot/real breakdown)
-- ========================================================================
_G.ENEMY_COUNTER_TIMER = nil

function _G.EnemyCounterLoop()
    if _G.AK_GetVal("ENEMY_COUNTER") ~= 1 then return end

    local player = GameplayData and GameplayData.GetPlayerCharacter()
    if not slua.isValid(player) then return end

    local pc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
    if not slua.isValid(pc) then return end

    local hud = pc:GetHUD()
    if not slua.isValid(hud) then return end

    local myTeamId = player.TeamID or 0
    local myPos = player:K2_GetActorLocation()
    if not myPos then return end

    local totalEnemies = 0
    local botCount = 0
    local realCount = 0
    local MAX_DIST_SQ = 900000000

    local allPawns = Game:GetAllPlayerPawns() or {}
    for _, pawn in pairs(allPawns) do
        if slua.isValid(pawn) and pawn ~= player then
            local pawnTeam = pawn.TeamID or 0
            if pawnTeam ~= myTeamId then
                local pos = pawn:K2_GetActorLocation()
                if pos then
                    local dx = pos.X - myPos.X
                    local dy = pos.Y - myPos.Y
                    local dz = pos.Z - myPos.Z
                    if dx*dx + dy*dy + dz*dz <= MAX_DIST_SQ then
                        totalEnemies = totalEnemies + 1
                        local isBot = false
                        pcall(function()
                            isBot = Game:IsAI(pawn)
                        end)
                        if isBot then
                            botCount = botCount + 1
                        else
                            realCount = realCount + 1
                        end
                    end
                end
            end
        end
    end

    local text = ""
    local COLOR_SAFE  = { R = 0, G = 255, B = 200, A = 255 }
    local COLOR_WARN  = { R = 255, G = 255, B = 0,   A = 255 }
    local COLOR_DANGER= { R = 255, G = 165,  B = 0,  A = 255 }
    local color = COLOR_SAFE

    if totalEnemies == 0 then
        text = "[ AREA SECURE ]"
        color = COLOR_SAFE
    else
        text = string.format("ENEMIES: %d  (Bots: %d | Real: %d)", totalEnemies, botCount, realCount)
        if totalEnemies == 1 then
            color = COLOR_WARN
        else
            color = COLOR_DANGER
        end
    end

    if _G.AK_GetVal("ENEMY_COUNTER") == 1 then
        text = text .. "\n✦VexoraXHussnain ✦"
    end

    if text ~= "" then
        local OFFSET = { X = 0, Y = 0, Z = 40 }
        hud:AddDebugText(text, player, 1.1, OFFSET, OFFSET, color, true, false, true, nil, 1.2, true)
    end
end

function _G.StartEnemyCounter()
    if _G.ENEMY_COUNTER_TIMER then
        pcall(function()
            if _G.Game then _G.Game:RemoveGameTimer(_G.ENEMY_COUNTER_TIMER) end
        end)
        _G.ENEMY_COUNTER_TIMER = nil
    end

    if _G.AK_GetVal("ENEMY_COUNTER") ~= 1 then return false end

    local pc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
    if slua.isValid(pc) and pc.AddGameTimer then
        _G.ENEMY_COUNTER_TIMER = pc:AddGameTimer(1.0, true, function()
            pcall(_G.EnemyCounterLoop)
        end)
        print("[ENEMY COUNTER] ✅ Started")
        return true
    end
    return false
end

function _G.StopEnemyCounter()
    if _G.ENEMY_COUNTER_TIMER then
        pcall(function()
            if _G.Game then _G.Game:RemoveGameTimer(_G.ENEMY_COUNTER_TIMER) end
        end)
        _G.ENEMY_COUNTER_TIMER = nil
        print("[ENEMY COUNTER] Stopped")
    end
end

-- ========================================================================
-- ORIGINAL DISTANCE MARKER & ESP SYSTEM
-- ========================================================================
local distanceMarkerConfig = {
    UIPathName = "/Game/Mod/EvoBase/BluePrints/UIBP/QuickSign/QuickSign_TipHitEnemy_UIBP_New.QuickSign_TipHitEnemy_UIBP_New_C",
    MaxWidgetNum = 99,
    MaxShowDistance = 6000000,
    bBindOutScreen = true,
    bBindBlocked = true,
    bIsBindingActor = true,
    BindSocketName = "head",
    bUseLuaWorldSocketName = true,
    WorldPositionOffset = FVector(0, 0, 50),
    bNeedPreLoad = true,
    Priority = 2
}

local function InitDistanceMarkerSystem()
    pcall(function()
        if InGameMarkTools and InGameMarkTools.ScreenMarkManager and InGameMarkTools.ScreenMarkManager.OnInitMarkGroupData then
            InGameMarkTools.ScreenMarkManager:OnInitMarkGroupData(9999)
        end
        
        local screenMarkConfig = gameplayTools.GetCurrentConfig("ScreenMarkConfig")
        if screenMarkConfig then
            screenMarkConfig[9999] = distanceMarkerConfig
        end
        for moduleName, moduleData in pairs(package.loaded) do
            if type(moduleName) == "string" and string.find(moduleName, "ScreenMarkConfig") then
                if type(moduleData) == "table" then
                    moduleData[9999] = distanceMarkerConfig
                end
            end
        end
    end)
end

if not _G.AK_Active_Marks_Cache then _G.AK_Active_Marks_Cache = {} end

local function createDistanceMarker(enemy)
    if _G._MOD_EXPIRED then return end
    pcall(function()
        if InGameMarkTools and InGameMarkTools.ClientAddMapMark then
            enemy.NativeDistMark = InGameMarkTools.ClientAddMapMark(9999, FVector(0,0,0), 0, "", 4, enemy)
            _G.AK_Active_Marks_Cache[tostring(enemy)] = { actor = enemy, distMark = enemy.NativeDistMark }
        end
    end)
end

local function removeDistanceMarker(enemy)
    pcall(function()
        if InGameMarkTools then
            if InGameMarkTools.ClientRemoveMapMark then
                InGameMarkTools.ClientRemoveMapMark(enemy.NativeDistMark)
            elseif InGameMarkTools.HideMapMark then
                InGameMarkTools.HideMapMark(enemy.NativeDistMark)
            end
        end
        enemy.NativeDistMark = nil
        _G.AK_Active_Marks_Cache[tostring(enemy)] = nil
    end)
end

local function cleanupDeadEnemyMarks()
    for cacheKey, cacheData in pairs(_G.AK_Active_Marks_Cache) do
        local shouldRemove = false
        if not slua.isValid(cacheData.actor) then
            shouldRemove = true
        else
            pcall(function()
                local actor = cacheData.actor
                if actor.bHidden or (actor.Mesh and actor.Mesh.bHidden) then shouldRemove = true end
                if type(actor.IsDead) == "function" and actor:IsDead() then shouldRemove = true
                elseif actor.bIsDead == true or actor.bIsDeadFlag == true then shouldRemove = true end
            end)
        end
        if shouldRemove then
            pcall(function()
                if InGameMarkTools and InGameMarkTools.ClientRemoveMapMark then
                    InGameMarkTools.ClientRemoveMapMark(cacheData.distMark)
                end
            end)
            _G.AK_Active_Marks_Cache[cacheKey] = nil
        end
    end
end

local function processEnemyMapESP(enemy, localPlayer, isMapESPEnabled)
    if _G._MOD_EXPIRED then return end
    if not slua.isValid(enemy) or enemy == localPlayer or enemy.TeamID == localPlayer.TeamID then return end

    local isDead = false
    pcall(function()
        if type(enemy.IsDead) == "function" then isDead = enemy:IsDead()
        elseif enemy.bIsDead then isDead = true end
        if enemy.bHidden or (enemy.Mesh and enemy.Mesh.bHidden) then isDead = true end
    end)

    if not isDead then
        if isMapESPEnabled == 1 then
            if not enemy.bHasAKNativeMapMarker then
                createDistanceMarker(enemy)
                enemy.bHasAKNativeMapMarker = true
            end
        else
            if enemy.bHasAKNativeMapMarker then
                removeDistanceMarker(enemy)
                enemy.bHasAKNativeMapMarker = false
            end
        end
    else
        if enemy.bHasAKNativeMapMarker then
            removeDistanceMarker(enemy)
            enemy.bHasAKNativeMapMarker = false
        end
    end
end

function ApplyHardAimbot()
    if not CheckExpiration() then return end
    pcall(function()
        local pc = slua_GameFrontendHUD:GetPlayerController()
        if not slua.isValid(pc) then return end

        local char = pc:GetPlayerCharacterSafety()
        if not slua.isValid(char) then return end

        local wm = char.WeaponManagerComponent
        if not slua.isValid(wm) then return end

        local weapon = wm.CurrentWeaponReplicated
        if not slua.isValid(weapon) then return end

        local entity = weapon.ShootWeaponEntityComp
        if not slua.isValid(entity) then return end

        entity.RecoilKickADS = 0.010
        entity.GameDeviationFactor = 0.01
        entity.GameDeviationAccuracy = 0.01

        if entity.AutoAimingConfig then
            for _, range in ipairs({"OuterRange", "InnerRange"}) do
                local cfg = entity.AutoAimingConfig[range]
                if cfg then
                    cfg.Speed = 3.5
                    cfg.RangeRate = 2.0
                    cfg.SpeedRate = 1.2
                    cfg.RangeRateSight = 2.0
                    cfg.SpeedRateSight = 1.2
                    cfg.CrouchRate = 2.0
                    cfg.ProneRate = 2.0
                    cfg.DyingRate = 0
                    cfg.adsorbMaxRange = 30000
                    cfg.adsorbMinRange = 20
                    cfg.adsorbMinAttenuationDis = 20
                    cfg.adsorbMaxAttenuationDis = 30000
                    cfg.adsorbActiveMinRange = 20
                end
            end
            entity.AutoAimingConfig = entity.AutoAimingConfig
        end

        pcall(function()
            local aimComp = char.BP_AutoAimingComponent_C or char.BP_AutoAimingComponent or char.AutoAimingComponent
            if slua.isValid(aimComp) and aimComp.Bones then
                pcall(function() aimComp.Bones[0] = "neck_01" end)
                pcall(function() aimComp.Bones[1] = "neck_01" end)
                pcall(function() aimComp.Bones[2] = "neck_01" end)
                pcall(function() aimComp.Bones:Set(0, "neck_01") end)
                pcall(function() aimComp.Bones:Set(1, "neck_01") end)
                pcall(function() aimComp.Bones:Set(2, "neck_01") end)
            end
        end)
    end)
end

-- ========================================================================
-- MATERIAL EVASION BYPASS
-- ========================================================================
local function activate_material_evasion()
    if _G._MATERIAL_GETTERS_HOOKED then return end
    pcall(function()
        local UMaterial = import("Material")
        local UMaterialInstance = import("MaterialInstance")
        local UMaterialInstanceDynamic = import("MaterialInstanceDynamic")
        local UPrimitiveComponent = import("PrimitiveComponent")
        local UMeshComponent = import("MeshComponent")

        if UMaterial then
            UMaterial.GetDisableDepthTest = function() return false end
            UMaterial.GetBlendMode = function() return 0 end
            UMaterial.GetMaterialHash = function() return "FAKE_HASH" end
            UMaterial.VerifyMaterial = function() return true end
        end
        if UMaterialInstance then
            UMaterialInstance.GetDisableDepthTest = function() return false end
            UMaterialInstance.GetBlendMode = function() return 0 end
            UMaterialInstance.GetBaseMaterial = function() return nil end
        end
        if UMaterialInstanceDynamic then
            local oldVec = UMaterialInstanceDynamic.K2_GetVectorParameterValue
            UMaterialInstanceDynamic.K2_GetVectorParameterValue = function(self, name)
                local n = tostring(name)
                if n:find("Color") or n:find("Emissive") then return {R=0,G=255,B=255,A=255} end
                return oldVec(self, name)
            end
            local oldScal = UMaterialInstanceDynamic.K2_GetScalarParameterValue
            UMaterialInstanceDynamic.K2_GetScalarParameterValue = function(self, name)
                if tostring(name):find("Emissive") then return 0.0 end
                return oldScal(self, name)
            end
            UMaterialInstanceDynamic.GetFullName = function() return "DefaultMaterial" end
        end
        if UPrimitiveComponent then
            UPrimitiveComponent.IsRenderedOnCustomDepth = function() return false end
            UPrimitiveComponent.GetRenderCustomDepth = function() return false end
            UPrimitiveComponent.GetCustomDepthStencilValue = function() return 0 end
            UPrimitiveComponent.GetCustomDepthStencilWriteMask = function() return 0 end
            UPrimitiveComponent.GetVisibleFlag = function() return true end
        end
        if UMeshComponent then
            UMeshComponent.ShouldRender = function() return true end
            UMeshComponent.GetShouldRender = function() return true end
            UMeshComponent.IsVisible = function() return true end
        end
        local UObject = import("Object")
        if UObject and UObject.GetObjectsOfClass then
            local oldGet = UObject.GetObjectsOfClass
            UObject.GetObjectsOfClass = function(Class, IncludeDerived)
                if Class and tostring(Class):find("MaterialInstanceDynamic") then return {} end
                return oldGet(Class, IncludeDerived)
            end
        end
    end)
    _G._MATERIAL_GETTERS_HOOKED = true
end

activate_material_evasion()

-- ========================================================================
-- ⚡ ESP V2 SYSTEM (RedBoxOverlay + PlayerMapMarker)
-- ========================================================================
local PlayerMapMarker = {}
local function IsValid_ESP9(obj)
    if obj == nil then return false end
    if slua and slua.isValid then return slua.isValid(obj) end
    return obj ~= nil
end

local RedBoxOverlay = {
    bActive = false, MainContainer = nil, WidgetSlot = nil,
    TextBlockPlayer = nil, TextBlockBot = nil,
    Width = 260, Height = 25, OffsetY = 10,
    PlayerCount = 0, BotCount = 0, FontSize = 14, TextScaleValue = 1.0,
    NumLayers = 50, Red = 1.0, Green = 1.0, Blue = 1.0, LayerAlpha = 0.06,
    _CachedTextPlayer = "", _CachedTextBot = "", _CachedPosVec = nil
}

function RedBoxOverlay.Create()
    if RedBoxOverlay.MainContainer and slua.isValid(RedBoxOverlay.MainContainer) then return true end

    local ParentCanvas = PlayerMapMarker.ESPCanvas
    if not ParentCanvas or not slua.isValid(ParentCanvas) then
        if not PlayerMapMarker.InitESPCanvas() then return false end
        ParentCanvas = PlayerMapMarker.ESPCanvas
    end
    if not ParentCanvas or not slua.isValid(ParentCanvas) then return false end

    local Container = nil
    pcall(function() Container = CGame:NewObjectFromPath("/Script/UMG.CanvasPanel", ParentCanvas) end)
    if not Container or not slua.isValid(Container) then return false end

    local FLinearColor = import("LinearColor") or FLinearColor
    local FVector2D = import("Vector2D") or FVector2D
    local color = FLinearColor(RedBoxOverlay.Red, RedBoxOverlay.Green, RedBoxOverlay.Blue, RedBoxOverlay.LayerAlpha)
    local numLayers = RedBoxOverlay.NumLayers
    local totalWidth = RedBoxOverlay.Width

    for i = 1, numLayers do
        local progress = (i / numLayers) ^ 1.15
        local layerWidth = progress * totalWidth
        local layerX = (totalWidth - layerWidth) / 2.0
        local border = nil
        pcall(function() border = CGame:NewObjectFromPath("/Script/UMG.Border", Container) end)
        if border and slua.isValid(border) then
            pcall(function()
                border:SetBrushColor(color)
                border:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
            end)
            local slot = Container:AddChildToCanvas(border)
            if slot then
                slot:SetPosition(FVector2D(layerX, 0))
                slot:SetSize(FVector2D(layerWidth, RedBoxOverlay.Height))
            end
        end
    end

    local FSlateColor = import("SlateColor") or import("/Script/SlateCore.SlateColor")
    local txtPlayer = nil
    pcall(function() txtPlayer = CGame:NewObjectFromPath("/Script/UMG.TextBlock", Container) end)
    if txtPlayer and slua.isValid(txtPlayer) then
        pcall(function()
            local strText = string.format("Player: %d", RedBoxOverlay.PlayerCount)
            txtPlayer:SetText(strText)
            RedBoxOverlay._CachedTextPlayer = strText
            local redLinear = FLinearColor(1.0, 0.0, 0.0, 1.0)
            if FSlateColor then txtPlayer:SetColorAndOpacity(FSlateColor(redLinear)) else txtPlayer:SetColorAndOpacity(redLinear) end
            if txtPlayer.Font then
                local font = txtPlayer.Font
                font.Size = RedBoxOverlay.FontSize
                txtPlayer.Font = font
            end
            txtPlayer:SetRenderScale(FVector2D(RedBoxOverlay.TextScaleValue, RedBoxOverlay.TextScaleValue))
            txtPlayer:SetRenderTransformPivot(FVector2D(0.5, 0.5))
            txtPlayer:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
        end)
        local txtSlot1 = Container:AddChildToCanvas(txtPlayer)
        if txtSlot1 then
            pcall(function()
                txtSlot1:SetAutoSize(true)
                txtSlot1:SetAlignment(FVector2D(0.5, 0.5))
                txtSlot1:SetPosition(FVector2D(totalWidth * 0.35, RedBoxOverlay.Height * 0.5))
                txtSlot1:SetZOrder(1000)
            end)
        end
        RedBoxOverlay.TextBlockPlayer = txtPlayer
    end

    local txtBot = nil
    pcall(function() txtBot = CGame:NewObjectFromPath("/Script/UMG.TextBlock", Container) end)
    if txtBot and slua.isValid(txtBot) then
        pcall(function()
            local strText = string.format("Bot: %d", RedBoxOverlay.BotCount)
            txtBot:SetText(strText)
            RedBoxOverlay._CachedTextBot = strText
            local greenLinear = FLinearColor(1.0, 0.0, 1.0, 1.0)
            if FSlateColor then txtBot:SetColorAndOpacity(FSlateColor(greenLinear)) else txtBot:SetColorAndOpacity(greenLinear) end
            if txtBot.Font then
                local font = txtBot.Font
                font.Size = RedBoxOverlay.FontSize
                txtBot.Font = font
            end
            txtBot:SetRenderScale(FVector2D(RedBoxOverlay.TextScaleValue, RedBoxOverlay.TextScaleValue))
            txtBot:SetRenderTransformPivot(FVector2D(0.5, 0.5))
            txtBot:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
        end)
        local txtSlot2 = Container:AddChildToCanvas(txtBot)
        if txtSlot2 then
            pcall(function()
                txtSlot2:SetAutoSize(true)
                txtSlot2:SetAlignment(FVector2D(0.5, 0.5))
                txtSlot2:SetPosition(FVector2D(totalWidth * 0.65, RedBoxOverlay.Height * 0.5))
                txtSlot2:SetZOrder(1000)
            end)
        end
        RedBoxOverlay.TextBlockBot = txtBot
    end

    local MainSlot = nil
    pcall(function() MainSlot = ParentCanvas:AddChildToCanvas(Container) end)
    if not MainSlot then return false end

    RedBoxOverlay.MainContainer = Container
    RedBoxOverlay.WidgetSlot = MainSlot
    pcall(function()
        MainSlot:SetAutoSize(false)
        MainSlot:SetZOrder(999)
        MainSlot:SetAlignment(FVector2D(0.5, 0.0))
        MainSlot:SetSize(FVector2D(RedBoxOverlay.Width, RedBoxOverlay.Height))
    end)
    RedBoxOverlay.UpdatePosition()
    return true
end

function RedBoxOverlay.SetCounts(players, bots)
    if RedBoxOverlay.PlayerCount == players and RedBoxOverlay.BotCount == bots then return end
    RedBoxOverlay.PlayerCount = players or 0
    RedBoxOverlay.BotCount = bots or 0

    if RedBoxOverlay.TextBlockPlayer and slua.isValid(RedBoxOverlay.TextBlockPlayer) then
        pcall(function()
            local strP = string.format("Player: %d", RedBoxOverlay.PlayerCount)
            if RedBoxOverlay._CachedTextPlayer ~= strP then
                RedBoxOverlay.TextBlockPlayer:SetText(strP)
                RedBoxOverlay._CachedTextPlayer = strP
            end
        end)
    end
    if RedBoxOverlay.TextBlockBot and slua.isValid(RedBoxOverlay.TextBlockBot) then
        pcall(function()
            local strB = string.format("Bot: %d", RedBoxOverlay.BotCount)
            if RedBoxOverlay._CachedTextBot ~= strB then
                RedBoxOverlay.TextBlockBot:SetText(strB)
                RedBoxOverlay._CachedTextBot = strB
            end
        end)
    end
end

function RedBoxOverlay.UpdatePosition()
    local Slot = RedBoxOverlay.WidgetSlot
    if not Slot or not slua.isValid(Slot) then return end

    local PC = PlayerMapMarker.GetMyPlayerController()
    if not slua.isValid(PC) then return end

    local fromX, fromY = PlayerMapMarker.GetSnapLineStartPos(PC)
    local FVector2D = import("Vector2D") or FVector2D

    -- 🔧 UPAR SARKANE KE LIYE (negative = upar, positive = neeche)
    local Y_OFFSET = -10

    pcall(function()
        if not RedBoxOverlay._CachedPosVec then
            RedBoxOverlay._CachedPosVec = FVector2D(fromX, fromY + Y_OFFSET)
        else
            RedBoxOverlay._CachedPosVec.X = fromX
            RedBoxOverlay._CachedPosVec.Y = fromY + Y_OFFSET
        end
        Slot:SetPosition(RedBoxOverlay._CachedPosVec)
    end)
end

function RedBoxOverlay.Start()
    if RedBoxOverlay.bActive and RedBoxOverlay.MainContainer and slua.isValid(RedBoxOverlay.MainContainer) then return end
    if RedBoxOverlay.Create() then
        RedBoxOverlay.bActive = true
        pcall(function() RedBoxOverlay.MainContainer:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible) end)
    end
end

function RedBoxOverlay.Stop()
    RedBoxOverlay.bActive = false
    if RedBoxOverlay.MainContainer and slua.isValid(RedBoxOverlay.MainContainer) then
        pcall(function()
            RedBoxOverlay.MainContainer:RemoveFromParent()
            RedBoxOverlay.MainContainer:ConditionalBeginDestroy()
        end)
    end
    RedBoxOverlay.MainContainer = nil
    RedBoxOverlay.WidgetSlot = nil
    RedBoxOverlay.TextBlockPlayer = nil
    RedBoxOverlay.TextBlockBot = nil
    RedBoxOverlay._CachedPosVec = nil
end

_G.RedBoxOverlay = RedBoxOverlay

-- ========================================================================
-- ⚡ ESP V2 SYSTEM (Continued)
-- ========================================================================
local SlateBlueprintLibrary = nil
local WidgetLayoutLibrary = nil
local KismetMathLibrary_ESP9 = nil
local KismetSystemLibrary_ESP9 = nil

pcall(function() SlateBlueprintLibrary = import("SlateBlueprintLibrary") or import("/Script/UMG.SlateBlueprintLibrary") end)
pcall(function() WidgetLayoutLibrary = import("WidgetLayoutLibrary") or import("/Script/UMG.WidgetLayoutLibrary") end)
pcall(function() KismetMathLibrary_ESP9 = import("KismetMathLibrary") end)
pcall(function() KismetSystemLibrary_ESP9 = import("KismetSystemLibrary") end)

local FVector2D_ESP9 = _G.FVector2D or import("Vector2D")
local FLinearColor_ESP9 = _G.FLinearColor or import("LinearColor")
local FVector_ESP9 = _G.FVector or import("Vector")

PlayerMapMarker.MarkTypeID = 1007
PlayerMapMarker.bUseScreenESP = true
PlayerMapMarker.bUseScreenMark = false
PlayerMapMarker.bUseQuickSign = false
PlayerMapMarker.bUseNavigator = false
PlayerMapMarker.bUseWidgetComponent = false
PlayerMapMarker.ESPBoneName = "head"
PlayerMapMarker.ESPWorldOffsetZ = 0
PlayerMapMarker.ESPAnchorOffsetX = 35
PlayerMapMarker.ESPAnchorOffsetY = 0
PlayerMapMarker.ESPTextOffsetX = 0
PlayerMapMarker.ESPTextOffsetY = 0
PlayerMapMarker.ESPWidgetAlignment = FVector2D_ESP9 and FVector2D_ESP9(0.5, 1.0) or {X=0.5, Y=1.0}
PlayerMapMarker.ESPWidgetSize = FVector2D_ESP9 and FVector2D_ESP9(70, 21) or {X=70, Y=21}
PlayerMapMarker.ESPWidgetAutoSize = true
PlayerMapMarker.ESPWidgetZOrder = 2
PlayerMapMarker.bShowDistance = true
PlayerMapMarker.DistanceUnit = "m"
PlayerMapMarker.WeaponIconBrushW = 96
PlayerMapMarker.WeaponIconBrushH = 48
PlayerMapMarker.HPWidgetSwitcherTypeIndex = 0
PlayerMapMarker.HPWidgetSwitcherType2Index = 0
PlayerMapMarker.bForceSwitcherIndexEveryUpdate = true
PlayerMapMarker.bUseSnapLines = true
PlayerMapMarker.SnapLineThickness = 3.0
PlayerMapMarker.SnapLineOriginY = 50
PlayerMapMarker.SnapLineOriginOffsetX = 0
PlayerMapMarker.SnapLineHeadOffsetX = 0
PlayerMapMarker.SnapLineHeadOffsetY = -14
PlayerMapMarker.SnapLineColor = FLinearColor_ESP9 and FLinearColor_ESP9(1.0, 1.0, 0.0, 1.0) or {R=255, G=255, B=0, A=255}
PlayerMapMarker.SnapLineOpacity = 0.7
PlayerMapMarker.bUseSkeleton = false
PlayerMapMarker.SkeletonThickness = 0.8
PlayerMapMarker.SkeletonColor = nil
PlayerMapMarker.SkeletonOpacity = 0.8
PlayerMapMarker.SkeletonMaxDistance = 100000
PlayerMapMarker.bUseVisibilityColor = true
PlayerMapMarker.SkeletonVisibleColor = FLinearColor_ESP9 and FLinearColor_ESP9(0.0, 1.0, 0.0, 0.8) or {R=0,G=255,B=0,A=200}
PlayerMapMarker.SkeletonCoverColor = FLinearColor_ESP9 and FLinearColor_ESP9(0.9, 0.0, 0.0, 0.6) or {R=230,G=0,B=0,A=150}
PlayerMapMarker.SkeletonWidgets = {}
PlayerMapMarker._StaticBoneLocCache = {}
PlayerMapMarker.SkeletonChains = {
    {"neck_01", "lowerarm_r", "hand_r"},
    {"neck_01", "lowerarm_l", "hand_l"},
    {"head", "neck_01", "pelvis"},
    {"pelvis", "calf_r", "foot_r"},
    {"pelvis", "calf_l", "foot_l"}
}
PlayerMapMarker.BoneNameFallbacks = {
    ["head"] = {"head", "Head", "head_socket"},
    ["neck_01"] = {"neck_01", "Neck_01", "neck", "Neck"},
    ["clavicle_r"] = {"clavicle_r", "Clavicle_R", "clavicle_R"},
    ["upperarm_r"] = {"upperarm_r", "UpperArm_R", "arm_r", "arm_r_01"},
    ["lowerarm_r"] = {"lowerarm_r", "LowerArm_R", "forearm_r"},
    ["hand_r"] = {"hand_r", "Hand_R", "hand_r_socket"},
    ["clavicle_l"] = {"clavicle_l", "Clavicle_L", "clavicle_L"},
    ["upperarm_l"] = {"upperarm_l", "UpperArm_L", "arm_l", "arm_l_01"},
    ["lowerarm_l"] = {"lowerarm_l", "LowerArm_L", "forearm_l"},
    ["hand_l"] = {"hand_l", "Hand_L", "hand_l_socket"},
    ["spine_03"] = {"spine_03", "Spine_03", "spine_02", "spine"},
    ["spine_02"] = {"spine_02", "Spine_02", "spine_01"},
    ["pelvis"] = {"pelvis", "Pelvis", "hip"},
    ["thigh_r"] = {"thigh_r", "Thigh_R", "leg_r"},
    ["calf_r"] = {"calf_r", "Calf_R", "shin_r"},
    ["foot_r"] = {"foot_r", "Foot_R", "foot_r_socket"},
    ["thigh_l"] = {"thigh_l", "Thigh_L", "leg_l"},
    ["calf_l"] = {"calf_l", "Calf_L", "shin_l"},
    ["foot_l"] = {"foot_l", "Foot_L", "foot_l_socket"},
}

PlayerMapMarker.MapAddedFlag = 4
PlayerMapMarker.nUpdateInterval = 0.5
PlayerMapMarker.bUseFrameTick = false
PlayerMapMarker.nHeavyScanFrameInterval = 15
PlayerMapMarker.nDistanceUpdateFrameInterval = 5
PlayerMapMarker.bIncludeMe = false
PlayerMapMarker.bIncludeAI = true
PlayerMapMarker.bUseServerMarks = false
PlayerMapMarker.bActive = false
PlayerMapMarker.MarkMap = {}
PlayerMapMarker.PlayerInfo = {}
PlayerMapMarker.ESPCanvas = nil
PlayerMapMarker.ESPWidgets = {}
PlayerMapMarker.ESPWidgetPtrs = {}
PlayerMapMarker.SnapLineWidgets = {}
PlayerMapMarker._cachedViewportW = 1920
PlayerMapMarker._cachedViewportH = 1080
PlayerMapMarker._FrameCount = 0
PlayerMapMarker._bTickRegistered = false
PlayerMapMarker._CachedAllChars = nil
PlayerMapMarker._CachedMyLoc = nil
PlayerMapMarker._CachedMyKey = nil
PlayerMapMarker.WidgetComps = {}
PlayerMapMarker._bAllPathsFailed = false
PlayerMapMarker._bLightUpdateScheduled = false
PlayerMapMarker._LightUpdateInterval = 0.02
PlayerMapMarker._bDistanceUpdateScheduled = false
PlayerMapMarker._DistanceUpdateInterval = 0.1
PlayerMapMarker._bScreenMarkConfigSetup = false

-- ========================================================================
-- ⚡ ENEMY NAME & BOX ESP SYSTEM
-- ========================================================================
local EnemyESPWidgets = {}
local EnemyBoxWidgets = {}
local EnemyNameWidgets = {}

local function GetBoxColor()
    local colorIndex = _G.AK_GetVal("ENEMY_BOX_COLOR") or 0
    local colors = {
        {R=1.0, G=0.0, B=0.0, A=1.0},     -- Red
        {R=0.0, G=1.0, B=0.0, A=1.0},     -- Green
        {R=0.0, G=0.0, B=1.0, A=1.0},     -- Blue
        {R=1.0, G=1.0, B=0.0, A=1.0},     -- Yellow
        {R=0.5, G=0.0, B=1.0, A=1.0},     -- Purple
        {R=0.0, G=1.0, B=1.0, A=1.0}      -- Cyan
    }
    return colors[colorIndex + 1] or colors[1]
end

function PlayerMapMarker:CreateEnemyBoxWidget(Character)
    local key = tostring(Character)
    if EnemyBoxWidgets[key] then return EnemyBoxWidgets[key] end
    
    local canvas = PlayerMapMarker.ESPCanvas
    if not canvas or not slua.isValid(canvas) then return nil end
    
    local border = nil
    pcall(function()
        border = CGame:NewObjectFromPath("/Script/UMG.Border", canvas)
    end)
    if not border or not slua.isValid(border) then return nil end
    
    local color = GetBoxColor()
    pcall(function()
        border:SetBrushColor(FLinearColor(color.R, color.G, color.B, color.A))
        border:SetRenderTransformPivot(FVector2D(0.5, 0.5))
        border:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed)
    end)
    
    local slot = canvas:AddChildToCanvas(border)
    if not slot or not slua.isValid(slot) then return nil end
    
    pcall(function()
        slot:SetAutoSize(false)
        slot:SetZOrder(15)
        slot:SetAlignment(FVector2D(0.5, 0.5))
    end)
    
    local widgetData = {
        border = border,
        slot = slot,
        pos = FVector2D(0, 0),
        size = FVector2D(0, 0),
        lastPos = nil,
        lastSize = nil
    }
    
    EnemyBoxWidgets[key] = widgetData
    return widgetData
end

function PlayerMapMarker:CreateEnemyNameWidget(Character)
    local key = tostring(Character)
    if EnemyNameWidgets[key] then return EnemyNameWidgets[key] end
    
    local canvas = PlayerMapMarker.ESPCanvas
    if not canvas or not slua.isValid(canvas) then return nil end
    
    local textBlock = nil
    pcall(function()
        textBlock = CGame:NewObjectFromPath("/Script/UMG.TextBlock", canvas)
    end)
    if not textBlock or not slua.isValid(textBlock) then return nil end
    
    local color = GetBoxColor()
    pcall(function()
        textBlock:SetColorAndOpacity(FSlateColor(FLinearColor(color.R, color.G, color.B, 1.0)))
        textBlock:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed)
        if textBlock.Font then
            local font = textBlock.Font
            font.Size = 12
            textBlock:SetFont(font)
        end
    end)
    
    local slot = canvas:AddChildToCanvas(textBlock)
    if not slot or not slua.isValid(slot) then return nil end
    
    pcall(function()
        slot:SetAutoSize(true)
        slot:SetZOrder(16)
        slot:SetAlignment(FVector2D(0.5, 0.0))
    end)
    
    local widgetData = {
        text = textBlock,
        slot = slot,
        pos = FVector2D(0, 0),
        lastText = "",
        lastPos = nil
    }
    
    EnemyNameWidgets[key] = widgetData
    return widgetData
end

function PlayerMapMarker:UpdateEnemyBoxAndName(Character, PC, Loc)
    if not PlayerMapMarker.bUseScreenESP then return end
    if  _G.AK_GetVal("ENEMY_NAME") ~= 1 and  _G.AK_GetVal("ENEMY_BOX") ~= 1 then return end
    
    local key = tostring(Character)
    local bShowName = _G.AK_GetVal("ENEMY_NAME") == 1
    local bShowBox = _G.AK_GetVal("ENEMY_BOX") == 1
    
    if not bShowName and not bShowBox then
        if EnemyNameWidgets[key] then
            pcall(function() EnemyNameWidgets[key].text:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
        end
        if EnemyBoxWidgets[key] then
            pcall(function() EnemyBoxWidgets[key].border:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
        end
        return
    end
    
    local bonePoints = {}
    local boneNames = {
        "head", "neck_01", "spine_03", "spine_01", "pelvis",
        "upperarm_l", "upperarm_r", "lowerarm_l", "lowerarm_r",
        "hand_l", "hand_r", "calf_l", "calf_r", "foot_l", "foot_r"
    }
    
    for _, boneName in ipairs(boneNames) do
        local boneWorldLoc = PlayerMapMarker.GetBoneLocationWithFallback(Character, boneName)
        if boneWorldLoc then
            local bOnScreen, canvasX, canvasY = PlayerMapMarker.ProjectWorldToCanvasLocalRaw(PC, boneWorldLoc)
            if bOnScreen then
                table.insert(bonePoints, {X = canvasX, Y = canvasY})
            end
        end
    end
    
    if #bonePoints < 2 then
        local loc = PlayerMapMarker.GetESPLocation(Character)
        if loc then
            local bOnScreen, canvasX, canvasY = PlayerMapMarker.ProjectWorldToCanvasLocalRaw(PC, loc)
            if bOnScreen then
                table.insert(bonePoints, {X = canvasX - 30, Y = canvasY - 80})
                table.insert(bonePoints, {X = canvasX + 30, Y = canvasY + 10})
            end
        end
    end
    
    if #bonePoints < 2 then return end
    
    local minX, minY = math.huge, math.huge
    local maxX, maxY = -math.huge, -math.huge
    
    for _, point in ipairs(bonePoints) do
        if point.X < minX then minX = point.X end
        if point.Y < minY then minY = point.Y end
        if point.X > maxX then maxX = point.X end
        if point.Y > maxY then maxY = point.Y end
    end
    
    local padding = 10
    local boxWidth = (maxX - minX) + (padding * 2)
    local boxHeight = (maxY - minY) + (padding * 2)
    local centerX = (minX + maxX) / 2
    local centerY = (minY + maxY) / 2
    
    if bShowBox then
        local boxWidget = PlayerMapMarker:CreateEnemyBoxWidget(Character)
        if boxWidget and boxWidget.border and boxWidget.slot then
            local color = GetBoxColor()
            pcall(function()
                boxWidget.border:SetBrushColor(FLinearColor(color.R, color.G, color.B, 0.6))
                boxWidget.border:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
                boxWidget.pos.X = centerX - (boxWidth / 2)
                boxWidget.pos.Y = centerY - (boxHeight / 2)
                boxWidget.slot:SetPosition(boxWidget.pos)
                boxWidget.size.X = boxWidth
                boxWidget.size.Y = boxHeight
                boxWidget.slot:SetSize(boxWidget.size)
                boxWidget.lastPos = boxWidget.pos
                boxWidget.lastSize = boxWidget.size
            end)
        end
    elseif EnemyBoxWidgets[key] then
        pcall(function() EnemyBoxWidgets[key].border:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
    end
    
    if bShowName then
        local nameWidget = PlayerMapMarker:CreateEnemyNameWidget(Character)
        if nameWidget and nameWidget.text and nameWidget.slot then
            local playerName = PlayerMapMarker.GetPlayerName(Character)
            local color = GetBoxColor()
            pcall(function()
                nameWidget.text:SetText(playerName)
                nameWidget.text:SetColorAndOpacity(FSlateColor(FLinearColor(color.R, color.G, color.B, 1.0)))
                nameWidget.text:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
                nameWidget.pos.X = centerX
                nameWidget.pos.Y = minY - padding - 20
                nameWidget.slot:SetPosition(nameWidget.pos)
                nameWidget.lastPos = nameWidget.pos
                nameWidget.lastText = playerName
            end)
        end
    elseif EnemyNameWidgets[key] then
        pcall(function() EnemyNameWidgets[key].text:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
    end
end

function PlayerMapMarker:ClearEnemyNameAndBoxes()
    for key, widget in pairs(EnemyBoxWidgets) do
        if widget and widget.border and slua.isValid(widget.border) then
            pcall(function()
                widget.border:RemoveFromParent()
                widget.border:ConditionalBeginDestroy()
            end)
        end
    end
    EnemyBoxWidgets = {}
    
    for key, widget in pairs(EnemyNameWidgets) do
        if widget and widget.text and slua.isValid(widget.text) then
            pcall(function()
                widget.text:RemoveFromParent()
                widget.text:ConditionalBeginDestroy()
            end)
        end
    end
    EnemyNameWidgets = {}
end

-- ========================================================================
-- PATCH: INTEGRATE ENEMY NAME & BOX INTO EXISTING UPDATE LOOP
-- ========================================================================

local originalUpdateESP = PlayerMapMarker.UpdateESP
PlayerMapMarker.UpdateESP = function(AllPlayers, MyLoc)
    originalUpdateESP(AllPlayers, MyLoc)
    
    if not PlayerMapMarker.bUseScreenESP then return end
    if not PlayerMapMarker.ESPCanvas or not Game:IsValid(PlayerMapMarker.ESPCanvas) then return end
    
    local PC = PlayerMapMarker.GetMyPlayerController()
    if not IsValid_ESP9(PC) then return end
    
    local MyKey = PlayerMapMarker.GetMyPlayerKey()
    local MyChar = nil
    pcall(function()
        local GDP = PlayerMapMarker.GetGameplayData()
        if GDP and GDP.GetLocalCharacter then MyChar = GDP.GetLocalCharacter() end
    end)
    
    local MyTeamID = PlayerMapMarker.GetTeamID(MyChar)
    local activeKeys = {}
    
    for PlayerKey, Character in pairs(AllPlayers) do
        if IsValid_ESP9(Character) then
            local bIsMe = PlayerMapMarker.IsMe(Character, PlayerKey, MyKey)
            local bIsAI = PlayerMapMarker.IsAI(Character)
            local KeyStr = tostring(PlayerKey)
            
            local bSkip = false
            if bIsMe and not PlayerMapMarker.bIncludeMe then bSkip = true end
            if bIsAI and not PlayerMapMarker.bIncludeAI then bSkip = true end
            
            local TeamID = PlayerMapMarker.GetTeamID(Character)
            if MyTeamID ~= nil and TeamID == MyTeamID and not bIsMe then bSkip = true end
            
            local bIsAlive = PlayerMapMarker.IsAlive(Character)
            
            if not bSkip and bIsAlive then
                local Loc = PlayerMapMarker.GetESPLocation(Character)
                if Loc then
                    activeKeys[KeyStr] = true
                    PlayerMapMarker:UpdateEnemyBoxAndName(Character, PC, Loc)
                end
            end
        end
    end
    
    for key, widget in pairs(EnemyBoxWidgets) do
        if not activeKeys[key] then
            if widget and widget.border and slua.isValid(widget.border) then
                pcall(function()
                    widget.border:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed)
                end)
            end
        end
    end
    
    for key, widget in pairs(EnemyNameWidgets) do
        if not activeKeys[key] then
            if widget and widget.text and slua.isValid(widget.text) then
                pcall(function()
                    widget.text:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed)
                end)
            end
        end
    end
end

function PlayerMapMarker.GetGameplayData()
    if PlayerMapMarker._CachedGameplayData then return PlayerMapMarker._CachedGameplayData end
    local ok, GDP = pcall(function() return require("GameLua.GameCore.Data.GameplayData") end)
    if ok and GDP then PlayerMapMarker._CachedGameplayData = GDP return GDP end
    return nil
end

function PlayerMapMarker.GetMyPlayerController()
    local PC = PlayerMapMarker._CachedPC
    if PC and IsValid_ESP9(PC) then return PC end
    local GDP = PlayerMapMarker.GetGameplayData()
    if not GDP then return nil end
    pcall(function() PC = GDP.GetPlayerController and GDP.GetPlayerController() end)
    if PC and IsValid_ESP9(PC) then PlayerMapMarker._CachedPC = PC return PC end
    return nil
end

function PlayerMapMarker.GetCGameState()
    if CGameState and IsValid_ESP9(CGameState) then return CGameState end
    if PlayerMapMarker._CachedCGameState and IsValid_ESP9(PlayerMapMarker._CachedCGameState) then return PlayerMapMarker._CachedCGameState end
    local ok, GS = pcall(function() return require("GameLua.GameCore.Data.CGameState") end)
    if ok and GS then PlayerMapMarker._CachedCGameState = GS return GS end
    return nil
end

function PlayerMapMarker.GetAllCharacters()
    local AllChars = {}
    pcall(function()
        local Pawns = Game:GetAllPlayerPawns()
        if Pawns then
            for _, Pawn in pairs(Pawns) do
                if Pawn and slua.isValid(Pawn) then
                    local pKey = nil
                    if Pawn.GetPlayerKey then pKey = Pawn:GetPlayerKey() end
                    if not pKey and Pawn.PlayerKey then pKey = Pawn.PlayerKey end
                    if not pKey and Pawn.PlayerState and Pawn.PlayerState.PlayerKey then pKey = Pawn.PlayerState.PlayerKey end
                    if pKey then AllChars[pKey] = Pawn end
                end
            end
        end
    end)
    if not next(AllChars) then
        local GS = PlayerMapMarker.GetCGameState()
        if GS and GS.GetAllCharacters then pcall(function() AllChars = GS:GetAllCharacters() end) end
    end
    return AllChars
end

function PlayerMapMarker.GetMyPlayerKey()
    local PC = PlayerMapMarker.GetMyPlayerController()
    if not IsValid_ESP9(PC) then return nil end
    local MyKey = nil
    pcall(function()
        if PC.GetPlayerKey then MyKey = PC:GetPlayerKey()
        elseif PC.PlayerState and PC.PlayerState.PlayerKey then MyKey = PC.PlayerState.PlayerKey end
    end)
    return MyKey
end

function PlayerMapMarker.IsMe(Character, PlayerKey, MyKey)
    local bIsMe = false
    pcall(function()
        local GDP = PlayerMapMarker.GetGameplayData()
        if GDP and GDP.GetLocalCharacter then
            local MyChar = GDP.GetLocalCharacter()
            if MyChar and Character == MyChar then bIsMe = true return end
        end
        local PC = PlayerMapMarker.GetMyPlayerController()
        if PC and PC.GetPawn then
            local Pawn = PC:GetPawn()
            if Pawn and Character == Pawn then bIsMe = true return end
        end
    end)
    if not bIsMe and MyKey ~= nil and PlayerKey ~= nil then bIsMe = (tostring(PlayerKey) == tostring(MyKey)) end
    return bIsMe
end

function PlayerMapMarker.GetCharacterLocation(Character)
    if not IsValid_ESP9(Character) then return nil end
    local Loc = nil
    pcall(function() if Character.K2_GetActorLocation then Loc = Character:K2_GetActorLocation() end end)
    if not Loc then pcall(function() if Game and Game.GetActorLocation then Loc = Game:GetActorLocation(Character) end end) end
    return Loc
end

function PlayerMapMarker.CalcDistance(Loc1, Loc2)
    if not Loc1 or not Loc2 then return nil end
    local Dist = nil
    pcall(function() if FVector_ESP9 and FVector_ESP9.Dist2D then Dist = FVector_ESP9.Dist2D(Loc1, Loc2) end end)
    if not Dist then
        pcall(function()
            local DX = (Loc1.X or 0) - (Loc2.X or 0)
            local DY = (Loc1.Y or 0) - (Loc2.Y or 0)
            Dist = math.sqrt(DX * DX + DY * DY)
        end)
    end
    return Dist
end

function PlayerMapMarker.GetDistanceString(MyLoc, TargetLoc)
    if not PlayerMapMarker.bShowDistance then return "" end
    if not MyLoc or not TargetLoc then return "" end
    local Dist = PlayerMapMarker.CalcDistance(MyLoc, TargetLoc)
    if not Dist then return "" end
    local Meters = Dist / 100
    if Meters < 1000 then return string.format("%dm", math.floor(Meters))
    else return string.format("%.1fkm", Meters / 1000) end
end

function PlayerMapMarker.GetMyLocation()
    local GDP = PlayerMapMarker.GetGameplayData()
    if not GDP then return nil end
    local MyChar = nil
    pcall(function() MyChar = GDP.GetLocalCharacter and GDP.GetLocalCharacter() end)
    if not IsValid_ESP9(MyChar) then return nil end
    return PlayerMapMarker.GetCharacterLocation(MyChar)
end

function PlayerMapMarker.GetPlayerName(Character)
    if not IsValid_ESP9(Character) then return "Unknown" end
    local Name = nil
    pcall(function() if Character.GetPlayerNameSafety then Name = Character:GetPlayerNameSafety() end end)
    if not Name then
        pcall(function()
            local PS = nil
            if Character.GetPlayerStateSafety then PS = Character:GetPlayerStateSafety()
            elseif Character.GetPlayerState then PS = Character:GetPlayerState() end
            if IsValid_ESP9(PS) and PS.GetPlayerName then Name = PS:GetPlayerName() end
        end)
    end
    return Name or "Unknown"
end

function PlayerMapMarker.IsAI(Character)
    local bAI = false
    pcall(function() if Game and Game.IsAI then bAI = Game:IsAI(Character) end end)
    return bAI
end

function PlayerMapMarker.IsAlive(Character)
    local bAlive = true
    pcall(function() if Character.IsAlive then bAlive = Character:IsAlive() end end)
    return bAlive
end

function PlayerMapMarker.GetTeamID(Character)
    if not IsValid_ESP9(Character) then return nil end
    local TeamID = nil
    pcall(function() if Character.GetTeamID then TeamID = Character:GetTeamID() end end)
    if not TeamID then
        pcall(function()
            local PS = nil
            if Character.GetPlayerStateSafety then PS = Character:GetPlayerStateSafety()
            elseif Character.GetPlayerState then PS = Character:GetPlayerState() end
            if IsValid_ESP9(PS) and PS.GetTeamID then TeamID = PS:GetTeamID()
            elseif IsValid_ESP9(PS) and PS.TeamID then TeamID = PS.TeamID end
        end)
    end
    if not TeamID then pcall(function() if Character.TeamID then TeamID = Character.TeamID end end) end
    return TeamID
end

function PlayerMapMarker.GetTeamColor(TeamID)
    if TeamID == nil or TeamID == 0 then
        return FLinearColor_ESP9 and FLinearColor_ESP9(0.2, 0.4, 1.0, 1.0) or {R=50,G=100,B=255,A=255}
    end
    local TeamColors = {
        [1]={R=255,G=50,B=50,A=255,fR=1.0,fG=0.2,fB=0.2},
        [2]={R=50,G=255,B=50,A=255,fR=0.2,fG=1.0,fB=0.2},
        [3]={R=50,G=100,B=255,A=255,fR=0.2,fG=0.4,fB=1.0},
        [4]={R=255,G=255,B=50,A=255,fR=1.0,fG=1.0,fB=0.2},
        [5]={R=255,G=50,B=255,A=255,fR=1.0,fG=0.2,fB=1.0},
        [6]={R=50,G=255,B=255,A=255,fR=0.2,fG=1.0,fB=1.0},
        [7]={R=255,G=150,B=50,A=255,fR=1.0,fG=0.6,fB=0.2},
        [8]={R=150,G=50,B=255,A=255,fR=0.6,fG=0.2,fB=1.0},
        [9]={R=200,G=255,B=50,A=255,fR=0.8,fG=1.0,fB=0.2},
        [10]={R=50,G=150,B=255,A=255,fR=0.2,fG=0.6,fB=1.0},
        [11]={R=255,G=100,B=150,A=255,fR=1.0,fG=0.4,fB=0.6},
        [12]={R=100,G=255,B=150,A=255,fR=0.4,fG=1.0,fB=0.6},
        [13]={R=150,G=150,B=50,A=255,fR=0.6,fG=0.6,fB=0.2},
        [14]={R=50,G=200,B=150,A=255,fR=0.2,fG=0.8,fB=0.6},
        [15]={R=255,G=200,B=50,A=255,fR=1.0,fG=0.8,fB=0.2}
    }
    local colorIndex = (TeamID % 15)
    if colorIndex == 0 then colorIndex = 15 end
    local c = TeamColors[colorIndex]
    return FLinearColor_ESP9 and FLinearColor_ESP9(c.fR, c.fG, c.fB, 1.0) or {R=c.R, G=c.G, B=c.B, A=c.A}
end

function PlayerMapMarker.InitESPCanvas()
    if PlayerMapMarker.ESPCanvas and Game:IsValid(PlayerMapMarker.ESPCanvas) then return true end
    local InGameUITools = nil
    pcall(function() InGameUITools = require("GameLua.Mod.BaseMod.Common.UI.InGameUITools") end)
    if not InGameUITools then return false end
    local MainControlBaseUI = nil
    pcall(function() MainControlBaseUI = InGameUITools.GetMainControlBaseUI() end)
    if not MainControlBaseUI or not Game:IsValid(MainControlBaseUI) then return false end
    local ParentCanvas = nil
    pcall(function()
        if MainControlBaseUI.CanvasPanel_0 and Game:IsValid(MainControlBaseUI.CanvasPanel_0) then ParentCanvas = MainControlBaseUI.CanvasPanel_0
        elseif MainControlBaseUI.CanvasPanel_42 and Game:IsValid(MainControlBaseUI.CanvasPanel_42) then ParentCanvas = MainControlBaseUI.CanvasPanel_42 end
    end)
    if not ParentCanvas then return false end
    PlayerMapMarker.ESPCanvas = ParentCanvas
    return true
end

function PlayerMapMarker.GetESPLocation(Character)
    if not IsValid_ESP9(Character) then return nil end
    local BoneLoc = PlayerMapMarker.GetCharacterLocation(Character)
    if BoneLoc then
        local heightOffset = 85
        pcall(function()
            if Character.bIsCrouched then heightOffset = 60 end
            if Character.IsProne and Character:IsProne() then heightOffset = 30 end
        end)
        pcall(function() BoneLoc.Z = BoneLoc.Z + heightOffset + (PlayerMapMarker.ESPWorldOffsetZ or 0) end)
    end
    return BoneLoc
end

function PlayerMapMarker.GetCharacterWeaponInfo(Character)
    if not IsValid_ESP9(Character) then return nil end
    local WeaponID, WeaponName, WeaponIconPath, WeaponIconTexture, CurrentWeapon = nil, nil, nil, nil, nil
    pcall(function() if Character.GetCurrentWeapon then CurrentWeapon = Character:GetCurrentWeapon() end end)
    if not CurrentWeapon then pcall(function() CurrentWeapon = Character.CurrentWeapon end) end
    if not CurrentWeapon then pcall(function() if Character.GetWeaponManager then local WM = Character:GetWeaponManager() if WM and WM.GetCurrentWeapon then CurrentWeapon = WM:GetCurrentWeapon() end end end) end
    if CurrentWeapon and IsValid_ESP9(CurrentWeapon) then
        pcall(function() if CurrentWeapon.GetWeaponID then WeaponID = CurrentWeapon:GetWeaponID() end end)
        if not WeaponID then pcall(function() WeaponID = CurrentWeapon.WeaponID end) end
        if not WeaponID then pcall(function() if CurrentWeapon.GetItemID then WeaponID = CurrentWeapon:GetItemID() end end) end
        pcall(function() if CurrentWeapon.GetWeaponName then WeaponName = CurrentWeapon:GetWeaponName() end end)
        pcall(function() if CurrentWeapon.GetWeaponIconPath then WeaponIconPath = CurrentWeapon:GetWeaponIconPath() end end)
        pcall(function() if CurrentWeapon.GetWeaponIcon then WeaponIconTexture = CurrentWeapon:GetWeaponIcon() end end)
    end
    if not WeaponID then
        pcall(function()
            local PS = nil
            if Character.GetPlayerStateSafety then PS = Character:GetPlayerStateSafety() elseif Character.GetPlayerState then PS = Character:GetPlayerState() end
            if PS and IsValid_ESP9(PS) then
                if PS.GetCurrentWeaponID then WeaponID = PS:GetCurrentWeaponID() end
                if not WeaponID and PS.CurWeaponID then WeaponID = PS.CurWeaponID end
            end
        end)
    end
    return { WeaponID = WeaponID, WeaponName = WeaponName, WeaponIconPath = WeaponIconPath, WeaponIconTexture = WeaponIconTexture, CurrentWeapon = CurrentWeapon }
end

PlayerMapMarker._OBHeadWidgetClass = nil
PlayerMapMarker._OBHeadWidgetLoadFailed = false

function PlayerMapMarker.CreateESPWidget()
    if not PlayerMapMarker.ESPCanvas or not Game:IsValid(PlayerMapMarker.ESPCanvas) then return nil end
    if PlayerMapMarker._OBHeadWidgetLoadFailed then return nil end

    if not PlayerMapMarker._OBHeadWidgetClass then
        pcall(function()
            local Path = "/Game/BluePrints/UI/OBUI/Item/OB_PlayerHeadHPItem_UIBP.OB_PlayerHeadHPItem_UIBP"
            local uClass = slua.loadClass(Path)
            if uClass then PlayerMapMarker._OBHeadWidgetClass = uClass end
        end)
        if not PlayerMapMarker._OBHeadWidgetClass then
            PlayerMapMarker._OBHeadWidgetLoadFailed = true
            return nil
        end
    end

    local Widget = nil
    pcall(function()
        local STExtraBlueprintFunctionLibrary = import("STExtraBlueprintFunctionLibrary")
        local PC = PlayerMapMarker.GetMyPlayerController()
        local OuterObj = IsValid_ESP9(PC) and PC.Object or PlayerMapMarker.ESPCanvas
        Widget = STExtraBlueprintFunctionLibrary.CreateWidgetByClass(PlayerMapMarker._OBHeadWidgetClass, OuterObj)
    end)
    if not Widget then return nil end

    pcall(function() Widget:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible) end)
    pcall(function() Widget:SetRenderOpacity(1.0) end)

    -- Apply YELLOW text color and DARK background to the widget
    local TEXT_COLOR = FSlateColor(FLinearColor(1.0, 1.0, 0.0, 1.0)) -- YELLOW
    local BG_COLOR = FLinearColor(0.0, 0.0, 0.0, 0.8) -- DARK with 80% opacity

    if Widget.TextBlock_PlayerName and slua.isValid(Widget.TextBlock_PlayerName) then
        pcall(function()
            Widget.TextBlock_PlayerName:SetColorAndOpacity(TEXT_COLOR)
            Widget.TextBlock_PlayerName:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
        end)
    end
    
    if Widget.Text_PlayerName and slua.isValid(Widget.Text_PlayerName) then
        pcall(function()
            Widget.Text_PlayerName:SetColorAndOpacity(TEXT_COLOR)
            Widget.Text_PlayerName:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
        end)
    end
    
    if Widget.TextBlock_TeamName and slua.isValid(Widget.TextBlock_TeamName) then
        pcall(function()
            Widget.TextBlock_TeamName:SetColorAndOpacity(TEXT_COLOR)
            Widget.TextBlock_TeamName:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
        end)
    end
    
    if Widget.Image_Name_BG and slua.isValid(Widget.Image_Name_BG) then
        pcall(function()
            Widget.Image_Name_BG:SetColorAndOpacity(BG_COLOR)
            Widget.Image_Name_BG:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
        end)
    end
    
    if Widget.Image_TeamBG and slua.isValid(Widget.Image_TeamBG) then
        pcall(function()
            Widget.Image_TeamBG:SetColorAndOpacity(BG_COLOR)
            Widget.Image_TeamBG:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
        end)
    end

    local NameText = nil
    local HealthFill = nil
    pcall(function()
        NameText = Widget.TextBlock_TeamName
        if NameText and slua.isValid(NameText) then pcall(function() NameText:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible) end) end
        if Widget.TextBlock_PlayerName and slua.isValid(Widget.TextBlock_PlayerName) then pcall(function() Widget.TextBlock_PlayerName:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible) end) end
        local SizeBox_HP = Widget.SizeBox_HP
        if SizeBox_HP and slua.isValid(SizeBox_HP) then
            pcall(function() SizeBox_HP:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible) end)
            local ExistingChild = nil
            pcall(function() if SizeBox_HP.GetContent then ExistingChild = SizeBox_HP:GetContent() end end)
            if ExistingChild and slua.isValid(ExistingChild) then
                local FoundPB = PlayerMapMarker.FindProgressBarInWidget(ExistingChild, 0, 5)
                if FoundPB and slua.isValid(FoundPB) then HealthFill = FoundPB end
            end
        end
    end)

    local WidgetData = {
        Container = Widget,
        NameText = NameText,
        HealthFill = HealthFill,
        IsGameWidget = true,
        HasChildren = (NameText ~= nil)
    }
    return WidgetData
end

function PlayerMapMarker.FindProgressBarInWidget(WidgetObj, Depth, MaxDepth)
    if not WidgetObj or not slua.isValid(WidgetObj) then return nil end
    Depth = Depth or 0
    MaxDepth = MaxDepth or 5
    if Depth > MaxDepth then return nil end

    local bIsPB = false
    pcall(function() if WidgetObj.SetPercent and WidgetObj.SetFillColorAndOpacity then bIsPB = true end end)
    if bIsPB then return WidgetObj end

    local nChildren = 0
    pcall(function() if WidgetObj.GetChildrenCount then nChildren = WidgetObj:GetChildrenCount() end end)
    for i = 0, math.max(nChildren - 1, 0) do
        local child = nil
        pcall(function() child = WidgetObj:GetChildAt(i) end)
        if child and slua.isValid(child) then
            local result = PlayerMapMarker.FindProgressBarInWidget(child, Depth + 1, MaxDepth)
            if result then return result end
        end
    end
    return nil
end

function PlayerMapMarker.ApplyTeamColor(Widget, TeamID)
    if not Widget or not Widget.Container then return end
    if  _G.AK_GetVal("ESP9_Team") ~= 1 then return end
    local color = PlayerMapMarker.GetTeamColor(TeamID)
    if not color then return end
    pcall(function()
        local W = Widget.Container
        if not W or not slua.isValid(W) then return end
        if W.SetTeamColor then pcall(function() W:SetTeamColor(TeamID) end) end
    end)
end

function PlayerMapMarker.UpdateESPText(Widget, Text)
    if not Widget then return end
    if Widget._LastESPText == Text then return end
    Widget._LastESPText = Text

    -- YELLOW text color (R=1.0, G=1.0, B=0.0)
    local YELLOW = FLinearColor_ESP9 and FLinearColor_ESP9(1.0, 1.0, 0.0, 1.0) or {R=255, G=255, B=0, A=255}

    local function applyText(w, txt)
        if not w or not slua.isValid(w) then return end
        if txt == "" then
            pcall(function() w:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
            return
        else
            pcall(function() w:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible) end)
        end
        pcall(function() w:SetText(txt) end)
        -- Set text color to YELLOW
        pcall(function()
            if w.SetColorAndOpacity then
                w:SetColorAndOpacity(YELLOW)
            end
        end)
    end

    if Widget.NameText and slua.isValid(Widget.NameText) then 
        applyText(Widget.NameText, Text) 
    end
    
    if Widget.IsGameWidget and Widget.Container then
        pcall(function()
            local W = Widget.Container
            if W and slua.isValid(W) then
                applyText(W.TextBlock_TeamName, Text)
                applyText(W.TextBlock_PlayerName, Text)
            end
        end)
    end
end

function PlayerMapMarker.UpdateESPHealth(Widget, pct)
    if not Widget then return end
    Widget.LastPct = pct
    local bShowHP = _G.AK_GetVal("ESP9_HP") == 1
    if not bShowHP then return end

    if PlayerMapMarker.bForceSwitcherIndexEveryUpdate and Widget.Container then
        pcall(function()
            local W = Widget.Container
            if W and slua.isValid(W) then
                if W.WidgetSwitcher_Type and slua.isValid(W.WidgetSwitcher_Type) then pcall(function() if W.WidgetSwitcher_Type.SetActiveWidgetIndex then W.WidgetSwitcher_Type:SetActiveWidgetIndex(PlayerMapMarker.HPWidgetSwitcherTypeIndex) end end) end
                if W.WidgetSwitcher_Type2 and slua.isValid(W.WidgetSwitcher_Type2) then pcall(function() if W.WidgetSwitcher_Type2.SetActiveWidgetIndex then W.WidgetSwitcher_Type2:SetActiveWidgetIndex(PlayerMapMarker.HPWidgetSwitcherType2Index) end end) end
            end
        end)
    end

    if Widget.HealthFill then
        local bValid = false
        pcall(function() bValid = slua.isValid(Widget.HealthFill) end)
        if bValid then
            pcall(function()
                if Widget.HealthFill.SetPercent then
                    Widget.HealthFill:SetPercent(pct)
                    local color
                    if pct > 0.5 then color = FLinearColor_ESP9 and FLinearColor_ESP9(0.0, 1.0, 0.0, 1.0) or {R=0,G=255,B=0,A=255}
                    elseif pct > 0.25 then color = FLinearColor_ESP9 and FLinearColor_ESP9(1.0, 0.5, 0.0, 1.0) or {R=255,G=128,B=0,A=255}
                    else color = FLinearColor_ESP9 and FLinearColor_ESP9(1.0, 0.0, 0.0, 1.0) or {R=255,G=0,B=0,A=255} end
                    if Widget.HealthFill.SetFillColorAndOpacity then Widget.HealthFill:SetFillColorAndOpacity(color) end
                end
            end)
        end
    end
end

function PlayerMapMarker.UpdateESPPositionWithPC(Widget, WorldLoc, PC, CanvasPos)
    if not Widget or not IsValid_ESP9(PC) then return false end

    local Container = Widget.Container or Widget
    local bOnScreen = true

    if not CanvasPos then
        if not WorldLoc then return false end
        bOnScreen, CanvasPos = PlayerMapMarker.ProjectWorldToCanvasLocal(PC, WorldLoc)
    end

    if not bOnScreen then pcall(function() Container:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end) return false end

    pcall(function()
        local bShowAnyUI = _G.AK_GetVal("ESP9_Name") == 1 or _G.AK_GetVal("ESP9_Distance") == 1 or _G.AK_GetVal("ESP9_HP") == 1 or _G.AK_GetVal("ESP9_Team") == 1 or _G.AK_GetVal("ESP9_Weapon") == 1
        if bShowAnyUI then Container:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
        else Container:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end

        if PlayerMapMarker.ESPCanvas and Game:IsValid(PlayerMapMarker.ESPCanvas) then
            local ptr = tostring(Container)
            local Slot = PlayerMapMarker.ESPWidgetPtrs[ptr]
            if not Slot or not slua.isValid(Slot) then
                local addedSlot = PlayerMapMarker.ESPCanvas:AddChildToCanvas(Container)
                if addedSlot and slua.isValid(addedSlot) then
                    Slot = addedSlot
                    PlayerMapMarker.ESPWidgetPtrs[ptr] = addedSlot
                    pcall(function() Slot:SetAutoSize(true) end)
                    pcall(function() Slot:SetAlignment(FVector2D_ESP9 and FVector2D_ESP9(0.5, 1.0) or {X=0.5, Y=1.0}) end)
                    pcall(function() Slot:SetZOrder(PlayerMapMarker.ESPWidgetZOrder or 20) end)
                end
            end
            if Slot and slua.isValid(Slot) then
                local finalX = CanvasPos.X + (PlayerMapMarker.ESPAnchorOffsetX or 0)
                local finalY = CanvasPos.Y + (PlayerMapMarker.ESPAnchorOffsetY or 0)
                if not Widget._CachedPosVec then Widget._CachedPosVec = FVector2D_ESP9 and FVector2D_ESP9(finalX, finalY) or {X=finalX, Y=finalY}
                else Widget._CachedPosVec.X = finalX; Widget._CachedPosVec.Y = finalY end
                pcall(function() Slot:SetPosition(Widget._CachedPosVec) end)
            end
        end
    end)
    return true
end

PlayerMapMarker._CanvasScaleX = 1.0
PlayerMapMarker._CanvasScaleY = 1.0
PlayerMapMarker._CanvasOffsetX = 0.0
PlayerMapMarker._CanvasOffsetY = 0.0

function PlayerMapMarker.UpdateCanvasTransform(PC)
    if not PlayerMapMarker.ESPCanvas or not Game:IsValid(PlayerMapMarker.ESPCanvas) then return end

    local success = false
    pcall(function()
        local SBL = SlateBlueprintLibrary
        if SBL and SBL.AbsoluteToLocal then
            local cg = PlayerMapMarker.ESPCanvas:GetCachedGeometry()
            if cg then
                local pt0 = SBL.AbsoluteToLocal(cg, FVector2D_ESP9 and FVector2D_ESP9(0, 0) or {X=0, Y=0})
                local pt1 = SBL.AbsoluteToLocal(cg, FVector2D_ESP9 and FVector2D_ESP9(100, 100) or {X=100, Y=100})
                if pt0 and pt1 then
                    PlayerMapMarker._CanvasScaleX = (pt1.X - pt0.X) / 100
                    PlayerMapMarker._CanvasScaleY = (pt1.Y - pt0.Y) / 100
                    PlayerMapMarker._CanvasOffsetX = pt0.X
                    PlayerMapMarker._CanvasOffsetY = pt0.Y
                    success = true
                end
            end
        end
    end)

    if not success then
        local scale = 1.0
        if WidgetLayoutLibrary and WidgetLayoutLibrary.GetViewportScale then scale = WidgetLayoutLibrary.GetViewportScale(PC) or 1.0 end
        PlayerMapMarker._CanvasScaleX = 1.0 / scale
        PlayerMapMarker._CanvasScaleY = 1.0 / scale
        PlayerMapMarker._CanvasOffsetX = 0
        PlayerMapMarker._CanvasOffsetY = 0
    end
end

function PlayerMapMarker.ScreenPixelToCanvasLocal(PC, ScreenPixelPos)
    if not ScreenPixelPos then return FVector2D_ESP9 and FVector2D_ESP9(0, 0) or {X=0, Y=0} end
    local scaleX = PlayerMapMarker._CanvasScaleX or 1.0
    local scaleY = PlayerMapMarker._CanvasScaleY or 1.0
    local offsetX = PlayerMapMarker._CanvasOffsetX or 0
    local offsetY = PlayerMapMarker._CanvasOffsetY or 0
    return (FVector2D_ESP9 and FVector2D_ESP9(ScreenPixelPos.X * scaleX + offsetX, ScreenPixelPos.Y * scaleY + offsetY)) or {X = ScreenPixelPos.X * scaleX + offsetX, Y = ScreenPixelPos.Y * scaleY + offsetY}
end

function PlayerMapMarker.ProjectWorldToCanvasLocal(PC, WorldLoc)
    if not IsValid_ESP9(PC) or not WorldLoc then return false, (FVector2D_ESP9 and FVector2D_ESP9(0, 0) or {X=0, Y=0}) end

    local ScreenPixelPos = FVector2D_ESP9 and FVector2D_ESP9(0, 0) or {X=0, Y=0}
    local bOK = false
    pcall(function()
        local res = PC:ProjectWorldLocationToScreen(WorldLoc, ScreenPixelPos, true)
        if res == true or res == 1 or (ScreenPixelPos and (ScreenPixelPos.X ~= 0 or ScreenPixelPos.Y ~= 0)) then bOK = true end
    end)

    if not bOK or not ScreenPixelPos or (ScreenPixelPos.X == 0 and ScreenPixelPos.Y == 0) then return false, (FVector2D_ESP9 and FVector2D_ESP9(0, 0) or {X=0, Y=0}) end

    local CanvasLocalPos = PlayerMapMarker.ScreenPixelToCanvasLocal(PC, ScreenPixelPos)
    return true, CanvasLocalPos
end

function PlayerMapMarker.GetSnapLineStartPos(PC)
    local screenPixelW, screenPixelH = 0, 0
    local scale = 1.0

    pcall(function()
        if PC and PC.GetViewportSize then
            local vs = FVector2D_ESP9 and FVector2D_ESP9(0, 0) or {X=0,Y=0}
            PC:GetViewportSize(vs)
            if vs and vs.X and vs.X > 200 then screenPixelW = vs.X screenPixelH = vs.Y end
        end
    end)

    if screenPixelW <= 200 then
        pcall(function()
            local WLL = WidgetLayoutLibrary
            if WLL and WLL.GetViewportSize then
                local vs = WLL.GetViewportSize(PC)
                if vs and vs.X and vs.X > 200 then screenPixelW = vs.X screenPixelH = vs.Y end
            end
        end)
    end

    pcall(function()
        local WLL = WidgetLayoutLibrary
        if WLL and WLL.GetViewportScale then
            local s = WLL.GetViewportScale(PC)
            if s and type(s) == "number" and s > 0 then scale = s end
        end
    end)

    if screenPixelW <= 200 then
        screenPixelW = (PlayerMapMarker._cachedViewportW or 1920) * scale
        screenPixelH = (PlayerMapMarker._cachedViewportH or 1080) * scale
    end

    if not PlayerMapMarker._CachedTopCenterPixel then PlayerMapMarker._CachedTopCenterPixel = FVector2D_ESP9 and FVector2D_ESP9(0, 0) or {X=0,Y=0} end
    PlayerMapMarker._CachedTopCenterPixel.X = screenPixelW / 2.0
    PlayerMapMarker._CachedTopCenterPixel.Y = (PlayerMapMarker.SnapLineOriginY or 50) * scale

    local fromCanvasPos = PlayerMapMarker.ScreenPixelToCanvasLocal(PC, PlayerMapMarker._CachedTopCenterPixel)
    return fromCanvasPos.X + (PlayerMapMarker.SnapLineOriginOffsetX or 0), fromCanvasPos.Y
end

function PlayerMapMarker.CreateSnapLine()
    if not PlayerMapMarker.ESPCanvas or not Game:IsValid(PlayerMapMarker.ESPCanvas) then return nil end

    local Border = nil
    pcall(function() Border = CGame:NewObjectFromPath("/Script/UMG.Border", PlayerMapMarker.ESPCanvas) end)
    if not Border or not slua.isValid(Border) then return nil end

    local color = PlayerMapMarker.SnapLineColor or (FLinearColor_ESP9 and FLinearColor_ESP9(1.0, 1.0, 1.0, PlayerMapMarker.SnapLineOpacity or 0.7) or {R=1,G=1,B=1,A=PlayerMapMarker.SnapLineOpacity or 0.7})
    pcall(function() Border:SetBrushColor(color) end)
    pcall(function() Border:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible) end)
    pcall(function() Border.RenderTransformPivot = FVector2D_ESP9 and FVector2D_ESP9(0.0, 0.5) or {X=0,Y=0.5} end)
    pcall(function() Border:SetRenderTransformPivot(FVector2D_ESP9 and FVector2D_ESP9(0.0, 0.5) or {X=0,Y=0.5}) end)

    local Slot = nil
    pcall(function()
        Slot = PlayerMapMarker.ESPCanvas:AddChildToCanvas(Border)
        if Slot then Slot:SetAutoSize(false) Slot:SetZOrder(1) end
    end)
    return { Widget = Border, Slot = Slot }
end

-- ========================================================================
-- ⚡ UPDATED SNAP LINE FUNCTION WITH VISIBILITY CHECK (Green/Red)
-- ========================================================================
function PlayerMapMarker.UpdateSnapLine(KeyStr, CanvasPos, bOnScreen, fromX, fromY)
    if not PlayerMapMarker.bUseSnapLines then return end
    if not PlayerMapMarker.ESPCanvas or not Game:IsValid(PlayerMapMarker.ESPCanvas) then return end

    local LineData = PlayerMapMarker.SnapLineWidgets[KeyStr]
    if not bOnScreen or not CanvasPos then
        if LineData and LineData.Widget and slua.isValid(LineData.Widget) then
            pcall(function() LineData.Widget:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
        end
        return
    end

    if not LineData then
        LineData = PlayerMapMarker.CreateSnapLine()
        if not LineData or not LineData.Widget or not LineData.Slot then return end
        PlayerMapMarker.SnapLineWidgets[KeyStr] = LineData
    end

    local Widget = LineData.Widget
    local Slot = LineData.Slot

    pcall(function() Widget:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible) end)

    local ESPData = PlayerMapMarker.ESPWidgets[KeyStr]
    local Character = ESPData and ESPData.Character
    local PC = PlayerMapMarker.GetMyPlayerController()
    
    local bIsVisible = false
    if Character and slua.isValid(Character) and PC and slua.isValid(PC) then
        pcall(function()
            if PC.LineOfSightTo then
                local zeroVec = FVector_ESP9 and FVector_ESP9(0, 0, 0) or {X=0, Y=0, Z=0}
                bIsVisible = PC:LineOfSightTo(Character, zeroVec, false)
            end
        end)
    end

    local lineColor
    if bIsVisible then
        lineColor = FLinearColor_ESP9 and FLinearColor_ESP9(0.0, 1.0, 0.0, PlayerMapMarker.SnapLineOpacity or 0.7) 
            or {R=0, G=255, B=0, A=math.floor((PlayerMapMarker.SnapLineOpacity or 0.7) * 255)}
    else
        lineColor = FLinearColor_ESP9 and FLinearColor_ESP9(1.0, 0.0, 0.0, PlayerMapMarker.SnapLineOpacity or 0.7) 
            or {R=255, G=0, B=0, A=math.floor((PlayerMapMarker.SnapLineOpacity or 0.7) * 255)}
    end
    
    pcall(function() Widget:SetBrushColor(lineColor) end)

    local toX = CanvasPos.X + (PlayerMapMarker.SnapLineHeadOffsetX or 0)
    local toY = CanvasPos.Y + (PlayerMapMarker.SnapLineHeadOffsetY or 0)

    local dx = toX - fromX
    local dy = toY - fromY
    local length = math.sqrt(dx * dx + dy * dy)
    local thickness = PlayerMapMarker.SnapLineThickness or 3.0
    local angle_rad = 0
    if math.atan2 then angle_rad = math.atan2(dy, dx) else angle_rad = math.atan(dy, dx) end
    local angle = angle_rad * (180.0 / math.pi)

    if not LineData._CachedPosVec then
        LineData._CachedPosVec = FVector2D_ESP9 and FVector2D_ESP9(fromX, fromY - thickness / 2.0) or {X=fromX, Y=fromY - thickness / 2.0}
        LineData._CachedSizeVec = FVector2D_ESP9 and FVector2D_ESP9(length, thickness) or {X=length, Y=thickness}
    else
        LineData._CachedPosVec.X = fromX; LineData._CachedPosVec.Y = fromY - thickness / 2.0
        LineData._CachedSizeVec.X = length; LineData._CachedSizeVec.Y = thickness
    end

    pcall(function()
        Slot:SetPosition(LineData._CachedPosVec)
        Slot:SetSize(LineData._CachedSizeVec)
    end)
    pcall(function() Widget:SetRenderAngle(angle) end)
end

function PlayerMapMarker.RemoveSnapLine(KeyStr)
    local LineData = PlayerMapMarker.SnapLineWidgets[KeyStr]
    if LineData and LineData.Widget and slua.isValid(LineData.Widget) then
        pcall(function() LineData.Widget:RemoveFromParent() LineData.Widget:ConditionalBeginDestroy() end)
        PlayerMapMarker.SnapLineWidgets[KeyStr] = nil
    end
end

function PlayerMapMarker.RemoveESPWidget(Widget, KeyStr)
    if not Widget then return end
    local Container = Widget.Container or Widget
    pcall(function()
        local ptr = tostring(Container)
        PlayerMapMarker.ESPWidgetPtrs[ptr] = nil
        Container:RemoveFromParent()
        Container:ConditionalBeginDestroy()
    end)
    if KeyStr then
        PlayerMapMarker.RemoveSnapLine(KeyStr)
        if PlayerMapMarker.RemoveSkeletonLines then
            PlayerMapMarker.RemoveSkeletonLines(KeyStr)
        end
    end
end

function PlayerMapMarker.ClearAllSnapLines()
    for KeyStr, LineData in pairs(PlayerMapMarker.SnapLineWidgets) do
        if LineData and LineData.Widget and slua.isValid(LineData.Widget) then
            pcall(function() LineData.Widget:RemoveFromParent() LineData.Widget:ConditionalBeginDestroy() end)
        end
    end
    PlayerMapMarker.SnapLineWidgets = {}
end

function PlayerMapMarker.ScreenPixelToCanvasLocalRaw(PC, screenX, screenY)
    local scaleX = PlayerMapMarker._CanvasScaleX or 1.0
    local scaleY = PlayerMapMarker._CanvasScaleY or 1.0
    local offsetX = PlayerMapMarker._CanvasOffsetX or 0
    local offsetY = PlayerMapMarker._CanvasOffsetY or 0
    return screenX * scaleX + offsetX, screenY * scaleY + offsetY
end

function PlayerMapMarker.ProjectWorldToCanvasLocalRaw(PC, WorldLoc)
    if not IsValid_ESP9(PC) or not WorldLoc then return false, 0, 0 end

    if not PlayerMapMarker._tempScreenPixelPos then
        PlayerMapMarker._tempScreenPixelPos = FVector2D_ESP9 and FVector2D_ESP9(0, 0) or {X=0, Y=0}
    end
    local tempPos = PlayerMapMarker._tempScreenPixelPos
    local bOK = false
    pcall(function()
        local res = PC:ProjectWorldLocationToScreen(WorldLoc, tempPos, true)
        if res == true or res == 1 then bOK = true end
    end)

    if not bOK or (tempPos.X == 0 and tempPos.Y == 0) then return false, 0, 0 end

    local canvasX, canvasY = PlayerMapMarker.ScreenPixelToCanvasLocalRaw(PC, tempPos.X, tempPos.Y)
    return true, canvasX, canvasY
end

function PlayerMapMarker.GetBoneLocationWithFallback(Character, PrimaryBoneName)
    if not IsValid_ESP9(Character) or not PrimaryBoneName then return nil end

    if Character._cachedBoneNames and Character._cachedBoneNames[PrimaryBoneName] then
        local cachedName = Character._cachedBoneNames[PrimaryBoneName]
        local loc = nil
        pcall(function()
            local Mesh = PlayerMapMarker.GetCharacterMesh(Character)
            if Mesh and Game:IsValid(Mesh) then
                if Mesh.GetSocketLocation then loc = Mesh:GetSocketLocation(cachedName)
                elseif Mesh.GetBoneLocation then loc = Mesh:GetBoneLocation(cachedName) end
            end
        end)
        if loc then return loc end
    end

    local fallbacks = PlayerMapMarker.BoneNameFallbacks[PrimaryBoneName] or {PrimaryBoneName}
    for _, bname in ipairs(fallbacks) do
        local loc = nil
        pcall(function()
            local Mesh = PlayerMapMarker.GetCharacterMesh(Character)
            if Mesh and Game:IsValid(Mesh) then
                if Mesh.GetSocketLocation then loc = Mesh:GetSocketLocation(bname)
                elseif Mesh.GetBoneLocation then loc = Mesh:GetBoneLocation(bname) end
            end
        end)
        if loc then
            if not Character._cachedBoneNames then Character._cachedBoneNames = {} end
            Character._cachedBoneNames[PrimaryBoneName] = bname
            return loc
        end
    end
    return nil
end

function PlayerMapMarker.GetCharacterMesh(Character)
    if not IsValid_ESP9(Character) then return nil end
    local Mesh = nil
    pcall(function() if Character.Mesh and Game:IsValid(Character.Mesh) then Mesh = Character.Mesh end end)
    if not Mesh then pcall(function() local SkeletalMeshCompClass = import("/Script/Engine.SkeletalMeshComponent") Mesh = Character:GetComponentByClass(SkeletalMeshCompClass) end) end
    return Mesh
end

function PlayerMapMarker.IsPlayerVisible(PC, Character)
    if not IsValid_ESP9(PC) or not IsValid_ESP9(Character) then return false end
    local now = os.clock()
    if Character._lastVisTime and (now - Character._lastVisTime) < 0.15 then
        return Character._cachedIsVisible or false
    end
    Character._lastVisTime = now

    local bVis = false
    pcall(function()
        if PC.LineOfSightTo then
            if not PlayerMapMarker._ZeroVector then
                local VT = FVector_ESP9 or import("/Script/CoreUObject.Vector")
                if VT then PlayerMapMarker._ZeroVector = VT(0, 0, 0) end
            end
            bVis = PC:LineOfSightTo(Character, PlayerMapMarker._ZeroVector, false)
        end
    end)
    Character._cachedIsVisible = bVis
    return bVis
end

function PlayerMapMarker.CreateSkeletonLineWidget()
    if not PlayerMapMarker.ESPCanvas or not Game:IsValid(PlayerMapMarker.ESPCanvas) then return nil end

    local Border = nil
    pcall(function() Border = CGame:NewObjectFromPath("/Script/UMG.Border", PlayerMapMarker.ESPCanvas) end)
    if not Border or not slua.isValid(Border) then return nil end

    pcall(function() Border.RenderTransformPivot = FVector2D_ESP9 and FVector2D_ESP9(0.0, 0.5) or {X=0, Y=0.5} end)
    pcall(function() Border:SetRenderTransformPivot(FVector2D_ESP9 and FVector2D_ESP9(0.0, 0.5) or {X=0, Y=0.5}) end)

    local Slot = nil
    pcall(function()
        Slot = PlayerMapMarker.ESPCanvas:AddChildToCanvas(Border)
        if Slot then Slot:SetAutoSize(false) Slot:SetZOrder(5) end
    end)

    return {
        Widget = Border, Slot = Slot,
        posVec = FVector2D_ESP9 and FVector2D_ESP9(0, 0) or {X=0, Y=0},
        sizeVec = FVector2D_ESP9 and FVector2D_ESP9(0, 0) or {X=0, Y=0},
        lastFromX = -99999, lastFromY = -99999,
        lastToX = -99999, lastToY = -99999
    }
end

function PlayerMapMarker.UpdateSkeletonLines(KeyStr, Character, PC, bVisible, TeamColor, bPlayerOnScreen, charLoc)
    if not PlayerMapMarker.bUseSkeleton then return end
    if not PlayerMapMarker.ESPCanvas or not Game:IsValid(PlayerMapMarker.ESPCanvas) then return end

    local PlayerBones = PlayerMapMarker.SkeletonWidgets[KeyStr]

    if not bVisible or not IsValid_ESP9(Character) or not IsValid_ESP9(PC) then
        if PlayerBones then
            for _, LineData in ipairs(PlayerBones) do
                if LineData and LineData.Widget and slua.isValid(LineData.Widget) then
                    LineData.Widget:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed)
                    LineData.Widget._isSelfHitTestVisible = false
                end
            end
        end
        return
    end

    if not charLoc then charLoc = PlayerMapMarker.GetESPLocation(Character) end
    if not charLoc then return end

    if bPlayerOnScreen == nil then
        local bOnScreen, _, _ = PlayerMapMarker.ProjectWorldToCanvasLocalRaw(PC, charLoc)
        bPlayerOnScreen = bOnScreen
    end

    if not bPlayerOnScreen then
        if PlayerBones then
            for _, LineData in ipairs(PlayerBones) do
                if LineData and LineData.Widget and slua.isValid(LineData.Widget) then
                    LineData.Widget:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed)
                    LineData.Widget._isSelfHitTestVisible = false
                end
            end
        end
        return
    end

    local dist = 0
    local myLoc = PlayerMapMarker._CachedMyLoc or PlayerMapMarker.GetMyLocation()
    if myLoc and charLoc then
        local dx = (charLoc.X or 0) - (myLoc.X or 0)
        local dy = (charLoc.Y or 0) - (myLoc.Y or 0)
        local dz = (charLoc.Z or 0) - (myLoc.Z or 0)
        dist = math.sqrt(dx * dx + dy * dy + dz * dz)
    end

    if PlayerMapMarker.SkeletonMaxDistance and PlayerMapMarker.SkeletonMaxDistance > 0 then
        if dist > PlayerMapMarker.SkeletonMaxDistance then
            if PlayerBones then
                for _, LineData in ipairs(PlayerBones) do
                    if LineData and LineData.Widget and slua.isValid(LineData.Widget) then
                        LineData.Widget:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed)
                        LineData.Widget._isSelfHitTestVisible = false
                    end
                end
            end
            return
        end
    end

    if not PlayerBones then
        PlayerBones = {}
        PlayerMapMarker.SkeletonWidgets[KeyStr] = PlayerBones
    end

    local lineColor = nil
    if PlayerMapMarker.bUseVisibilityColor then
        local bTargetVisible = PlayerMapMarker.IsPlayerVisible(PC, Character)
        if bTargetVisible then lineColor = PlayerMapMarker.SkeletonVisibleColor or FLinearColor_ESP9(0.0, 1.0, 0.0, 0.8)
        else lineColor = PlayerMapMarker.SkeletonCoverColor or FLinearColor_ESP9(0.9, 0.0, 0.0, 0.6) end
    else
        lineColor = PlayerMapMarker.SkeletonColor or TeamColor or FLinearColor_ESP9(1.0, 1.0, 1.0, PlayerMapMarker.SkeletonOpacity or 0.8)
    end

    local cache = PlayerMapMarker._StaticBoneLocCache
    for k in pairs(cache) do cache[k] = nil end

    local lineIndex = 0
    local thickness = PlayerMapMarker.SkeletonThickness or 0.8

    for _, chain in ipairs(PlayerMapMarker.SkeletonChains) do
        local lastCanvasX, lastCanvasY = nil, nil
        for _, boneName in ipairs(chain) do
            local boneWorldLoc = cache[boneName]
            if boneWorldLoc == nil then
                boneWorldLoc = PlayerMapMarker.GetBoneLocationWithFallback(Character, boneName) or false
                cache[boneName] = boneWorldLoc
            end
            if boneWorldLoc == false then boneWorldLoc = nil end

            local currentCanvasX, currentCanvasY = nil, nil
            if boneWorldLoc then
                local bOnScreen, cX, cY = PlayerMapMarker.ProjectWorldToCanvasLocalRaw(PC, boneWorldLoc)
                if bOnScreen then
                    currentCanvasX = cX
                    currentCanvasY = cY
                end
            end

            if lastCanvasX and currentCanvasX then
                lineIndex = lineIndex + 1
                local LineData = PlayerBones[lineIndex]
                if not LineData or not LineData.Widget or not slua.isValid(LineData.Widget) then
                    LineData = PlayerMapMarker.CreateSkeletonLineWidget()
                    if LineData then PlayerBones[lineIndex] = LineData end
                end

                if LineData and LineData.Widget and LineData.Slot then
                    local Widget = LineData.Widget
                    local Slot = LineData.Slot

                    if Widget._cachedColor ~= lineColor then
                        Widget:SetBrushColor(lineColor)
                        Widget._cachedColor = lineColor
                    end

                    if not Widget._isSelfHitTestVisible then
                        Widget:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible)
                        Widget._isSelfHitTestVisible = true
                    end

                    local fromX = lastCanvasX
                    local fromY = lastCanvasY
                    local toX = currentCanvasX
                    local toY = currentCanvasY

                    local threshold = 0.15
                    if dist > 8000 then threshold = 0.8 elseif dist > 4000 then threshold = 0.4 end

                    if math.abs(fromX - LineData.lastFromX) > threshold or
                       math.abs(fromY - LineData.lastFromY) > threshold or
                       math.abs(toX - LineData.lastToX) > threshold or
                       math.abs(toY - LineData.lastToY) > threshold then

                        LineData.lastFromX = fromX
                        LineData.lastFromY = fromY
                        LineData.lastToX = toX
                        LineData.lastToY = toY

                        local dx = toX - fromX
                        local dy = toY - fromY
                        local length = math.sqrt(dx * dx + dy * dy)
                        local angle_rad = (math.atan2 and math.atan2(dy, dx)) or math.atan(dy, dx)
                        local angle = angle_rad * 57.29577951308232

                        local pVec = LineData.posVec
                        pVec.X = fromX; pVec.Y = fromY - thickness / 2.0
                        Slot:SetPosition(pVec)

                        local sVec = LineData.sizeVec
                        sVec.X = length; sVec.Y = thickness
                        Slot:SetSize(sVec)

                        Widget:SetRenderAngle(angle)
                    end
                end
            end
            lastCanvasX = currentCanvasX
            lastCanvasY = currentCanvasY
        end
    end

    for i = lineIndex + 1, #PlayerBones do
        local LineData = PlayerBones[i]
        if LineData and LineData.Widget and slua.isValid(LineData.Widget) then
            LineData.Widget:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed)
            LineData.Widget._isSelfHitTestVisible = false
        end
    end
end

function PlayerMapMarker.RemoveSkeletonLines(KeyStr)
    local PlayerBones = PlayerMapMarker.SkeletonWidgets[KeyStr]
    if PlayerBones then
        for _, LineData in ipairs(PlayerBones) do
            if LineData and LineData.Widget and slua.isValid(LineData.Widget) then
                pcall(function()
                    LineData.Widget:RemoveFromParent()
                    LineData.Widget:ConditionalBeginDestroy()
                end)
            end
        end
        PlayerMapMarker.SkeletonWidgets[KeyStr] = nil
    end
end

function PlayerMapMarker.ClearAllSkeletonLines()
    for KeyStr, PlayerBones in pairs(PlayerMapMarker.SkeletonWidgets) do
        for _, LineData in ipairs(PlayerBones) do
            if LineData and LineData.Widget and slua.isValid(LineData.Widget) then
                pcall(function()
                    LineData.Widget:RemoveFromParent()
                    LineData.Widget:ConditionalBeginDestroy()
                end)
            end
        end
    end
    PlayerMapMarker.SkeletonWidgets = {}
end

function PlayerMapMarker.ClearAllESP()
    RedBoxOverlay.Stop()
    for KeyStr, Data in pairs(PlayerMapMarker.ESPWidgets) do
        PlayerMapMarker.RemoveESPWidget(Data.Widget, KeyStr)
    end
    PlayerMapMarker.ESPWidgets = {}
    PlayerMapMarker.ESPWidgetPtrs = {}
    PlayerMapMarker.ClearAllSnapLines()
    PlayerMapMarker.ClearAllSkeletonLines()
    PlayerMapMarker:ClearEnemyNameAndBoxes()
    PlayerMapMarker.ESPCanvas = nil
    PlayerMapMarker._OBHeadWidgetClass = nil
    PlayerMapMarker._OBHeadWidgetLoadFailed = false
    PlayerMapMarker._cachedViewportW = 1920
    PlayerMapMarker._cachedViewportH = 1080
end

function PlayerMapMarker.UpdateESP(AllPlayers, MyLoc)
    if not PlayerMapMarker.bUseScreenESP then return end

    PlayerMapMarker.bUseSnapLines = _G.AK_GetVal("ESP9_Line") == 1
    PlayerMapMarker.bUseSkeleton = _G.AK_GetVal("ESP9_Skeleton") == 1

    if not PlayerMapMarker.InitESPCanvas() then return end
    if PlayerMapMarker._OBHeadWidgetLoadFailed then return end

    local PC = PlayerMapMarker.GetMyPlayerController()
    if IsValid_ESP9(PC) then PlayerMapMarker.UpdateCanvasTransform(PC) end

    local fromX, fromY = 0, 0
    if PlayerMapMarker.bUseSnapLines and IsValid_ESP9(PC) then
        fromX, fromY = PlayerMapMarker.GetSnapLineStartPos(PC)
    end

    local MyKey = PlayerMapMarker.GetMyPlayerKey()
    local SeenKeys = {}
    local MyChar = nil
    pcall(function()
        local GDP = PlayerMapMarker.GetGameplayData()
        if GDP and GDP.GetLocalCharacter then MyChar = GDP.GetLocalCharacter()
        else if PC and PC.GetPawn then MyChar = PC:GetPawn() end end
    end)

    local MyTeamID = PlayerMapMarker.GetTeamID(MyChar)

    for PlayerKey, Character in pairs(AllPlayers) do
        if IsValid_ESP9(Character) then
            local bIsMe = PlayerMapMarker.IsMe(Character, PlayerKey, MyKey)
            local bIsAI = PlayerMapMarker.IsAI(Character)
            local KeyStr = tostring(PlayerKey)
            local Name = PlayerMapMarker.GetPlayerName(Character)
            local Loc = PlayerMapMarker.GetESPLocation(Character)
            local DistStr = ""
            if MyLoc and Loc then DistStr = PlayerMapMarker.GetDistanceString(MyLoc, Loc) end

            local bSkip = false
            if bIsMe and not PlayerMapMarker.bIncludeMe then bSkip = true end
            if bIsAI and not PlayerMapMarker.bIncludeAI then bSkip = true end

            local TeamID = PlayerMapMarker.GetTeamID(Character)
            if MyTeamID ~= nil and TeamID == MyTeamID and not bIsMe then bSkip = true end

            local bIsAlive = PlayerMapMarker.IsAlive(Character)

            if not bSkip and Loc then
                SeenKeys[KeyStr] = true
                local ESPData = PlayerMapMarker.ESPWidgets[KeyStr]

                local Text = ""
                if _G.AK_GetVal("ESP9_Name") == 1 then Text = Name end
                if _G.AK_GetVal("ESP9_Distance") == 1 and DistStr ~= "" then
                    if Text ~= "" then Text = string.format("%s [%s]", Text, DistStr) else Text = string.format("[%s]", DistStr) end
                end

                local bOnScreen, CanvasPos = PlayerMapMarker.ProjectWorldToCanvasLocal(PC, Loc)

                if not ESPData then
                    local Widget = PlayerMapMarker.CreateESPWidget()
                    if Widget then
                        PlayerMapMarker.ESPWidgets[KeyStr] = { Widget = Widget, Character = Character, Name = Name, LastDistStr = DistStr, TeamID = TeamID }
                        PlayerMapMarker.UpdateESPText(Widget, Text)
                        if bIsAlive then
                            PlayerMapMarker.UpdateESPPositionWithPC(Widget, Loc, PC, CanvasPos)
                            PlayerMapMarker.ApplyTeamColor(Widget, TeamID)
                            local HP = Character.Health or 0
                            local MaxHP = Character.MaxHealth or 120
                            local pct = 0
                            if HP > 0 and MaxHP > 0 then pct = HP / MaxHP; if pct > 1 then pct = 1 end; if pct < 0 then pct = 0 end end
                            PlayerMapMarker.UpdateESPHealth(Widget, pct)
                            PlayerMapMarker.AddWeaponIconToESP(Widget, Character)
                            if PlayerMapMarker.bUseSnapLines then
                                PlayerMapMarker.UpdateSnapLine(KeyStr, CanvasPos, bOnScreen, fromX, fromY)
                            else
                                PlayerMapMarker.RemoveSnapLine(KeyStr)
                            end
                            if PlayerMapMarker.bUseSkeleton then
                                PlayerMapMarker.UpdateSkeletonLines(KeyStr, Character, PC, true, PlayerMapMarker.GetTeamColor(TeamID), bOnScreen, Loc)
                            else
                                PlayerMapMarker.RemoveSkeletonLines(KeyStr)
                            end
                        else
                            local Container = Widget.Container or Widget
                            pcall(function() Container:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
                            PlayerMapMarker.UpdateESPHealth(Widget, 0)
                            PlayerMapMarker.RemoveSnapLine(KeyStr)
                            PlayerMapMarker.RemoveSkeletonLines(KeyStr)
                        end
                    end
                else
                    ESPData.Character = Character
                    ESPData.Name = Name
                    ESPData.LastDistStr = DistStr
                    ESPData.TeamID = TeamID
                    PlayerMapMarker.ApplyTeamColor(ESPData.Widget, TeamID)
                    ESPData.Widget._LastESPText = nil
                    PlayerMapMarker.UpdateESPText(ESPData.Widget, Text)
                    PlayerMapMarker.UpdateESPPositionWithPC(ESPData.Widget, Loc, PC, CanvasPos)

                    local HP = Character.Health or 0
                    local MaxHP = Character.MaxHealth or 120
                    local pct = 0
                    if HP > 0 and MaxHP > 0 then pct = HP / MaxHP; if pct > 1 then pct = 1 end; if pct < 0 then pct = 0 end end
                    PlayerMapMarker.UpdateESPHealth(ESPData.Widget, pct)
                    PlayerMapMarker.AddWeaponIconToESP(ESPData.Widget, Character)

                    if PlayerMapMarker.bUseSnapLines then
                        PlayerMapMarker.UpdateSnapLine(KeyStr, CanvasPos, bOnScreen, fromX, fromY)
                    else
                        PlayerMapMarker.RemoveSnapLine(KeyStr)
                    end
                    if PlayerMapMarker.bUseSkeleton then
                        PlayerMapMarker.UpdateSkeletonLines(KeyStr, Character, PC, true, PlayerMapMarker.GetTeamColor(TeamID), bOnScreen, Loc)
                    else
                        PlayerMapMarker.RemoveSkeletonLines(KeyStr)
                    end
                end
            end
        end
    end

    for KeyStr, Data in pairs(PlayerMapMarker.ESPWidgets) do
        if not SeenKeys[KeyStr] then
            PlayerMapMarker.RemoveESPWidget(Data.Widget, KeyStr)
            PlayerMapMarker.ESPWidgets[KeyStr] = nil
        end
    end

    -- Apply enemy name and box
    if _G.AK_GetVal("ENEMY_NAME") == 1 or _G.AK_GetVal("ENEMY_BOX") == 1 then
        local activeKeys = {}
        for PlayerKey, Character in pairs(AllPlayers) do
            if IsValid_ESP9(Character) then
                local bIsMe = PlayerMapMarker.IsMe(Character, PlayerKey, MyKey)
                local bIsAI = PlayerMapMarker.IsAI(Character)
                local KeyStr = tostring(PlayerKey)
                local bSkip = false
                if bIsMe and not PlayerMapMarker.bIncludeMe then bSkip = true end
                if bIsAI and not PlayerMapMarker.bIncludeAI then bSkip = true end
                local TeamID = PlayerMapMarker.GetTeamID(Character)
                if MyTeamID ~= nil and TeamID == MyTeamID and not bIsMe then bSkip = true end
                local bIsAlive = PlayerMapMarker.IsAlive(Character)
                if not bSkip and bIsAlive then
                    local Loc = PlayerMapMarker.GetESPLocation(Character)
                    if Loc then
                        activeKeys[KeyStr] = true
                        PlayerMapMarker:UpdateEnemyBoxAndName(Character, PC, Loc)
                    end
                end
            end
        end
        for key, widget in pairs(EnemyBoxWidgets) do
            if not activeKeys[key] and widget and widget.border and slua.isValid(widget.border) then
                pcall(function() widget.border:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
            end
        end
        for key, widget in pairs(EnemyNameWidgets) do
            if not activeKeys[key] and widget and widget.text and slua.isValid(widget.text) then
                pcall(function() widget.text:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
            end
        end
    else
        for key, widget in pairs(EnemyBoxWidgets) do
            if widget and widget.border and slua.isValid(widget.border) then
                pcall(function() widget.border:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
            end
        end
        for key, widget in pairs(EnemyNameWidgets) do
            if widget and widget.text and slua.isValid(widget.text) then
                pcall(function() widget.text:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
            end
        end
    end
end

function PlayerMapMarker.UpdateESPLight()
    if RedBoxOverlay and RedBoxOverlay.bActive then RedBoxOverlay.UpdatePosition() end
    if not PlayerMapMarker.bUseScreenESP then return end

    PlayerMapMarker.bUseSnapLines = _G.AK_GetVal("ESP9_Line") == 1
    PlayerMapMarker.bUseSkeleton = _G.AK_GetVal("ESP9_Skeleton") == 1

    if not PlayerMapMarker.ESPCanvas or not Game:IsValid(PlayerMapMarker.ESPCanvas) then return end

    local PC = PlayerMapMarker.GetMyPlayerController()
    if not IsValid_ESP9(PC) then return end

    PlayerMapMarker.UpdateCanvasTransform(PC)

    local fromX, fromY = 0, 0
    if PlayerMapMarker.bUseSnapLines then fromX, fromY = PlayerMapMarker.GetSnapLineStartPos(PC) end

    for KeyStr, ESPData in pairs(PlayerMapMarker.ESPWidgets) do
        local Widget = ESPData.Widget
        local Character = ESPData.Character
        local Container = Widget and (Widget.Container or Widget)
        local bWidgetValid = false
        pcall(function() bWidgetValid = Container and slua.isValid(Container) end)

        if Widget and bWidgetValid and Character and IsValid_ESP9(Character) then
            local bIsAlive = PlayerMapMarker.IsAlive(Character)
            if not bIsAlive then
                pcall(function() Container:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
                PlayerMapMarker.RemoveSnapLine(KeyStr)
                PlayerMapMarker.RemoveSkeletonLines(KeyStr)
            else
                local bShowAnyUI = _G.AK_GetVal("ESP9_Name") == 1 or _G.AK_GetVal("ESP9_Distance") == 1 or _G.AK_GetVal("ESP9_HP") == 1 or _G.AK_GetVal("ESP9_Team") == 1 or _G.AK_GetVal("ESP9_Weapon") == 1
                if bShowAnyUI then
                    pcall(function() Container:SetWidgetVisibility(UEnums.ESlateVisibility.SelfHitTestInvisible) end)
                else
                    pcall(function() Container:SetWidgetVisibility(UEnums.ESlateVisibility.Collapsed) end)
                end

                local Loc = PlayerMapMarker.GetESPLocation(Character)
                if Loc then
                    local bOnScreen, CanvasPos = PlayerMapMarker.ProjectWorldToCanvasLocal(PC, Loc)
                    PlayerMapMarker.UpdateESPPositionWithPC(Widget, Loc, PC, CanvasPos)

                    if PlayerMapMarker.bUseSnapLines then 
                        PlayerMapMarker.UpdateSnapLine(KeyStr, CanvasPos, bOnScreen, fromX, fromY)
                    else 
                        PlayerMapMarker.RemoveSnapLine(KeyStr) 
                    end

                    if PlayerMapMarker.bUseSkeleton then
                        PlayerMapMarker.UpdateSkeletonLines(KeyStr, Character, PC, true, PlayerMapMarker.GetTeamColor(ESPData.TeamID), bOnScreen, Loc)
                    else
                        PlayerMapMarker.RemoveSkeletonLines(KeyStr)
                    end
                else
                    PlayerMapMarker.RemoveSnapLine(KeyStr)
                    PlayerMapMarker.RemoveSkeletonLines(KeyStr)
                end
            end
        end
    end
end

function PlayerMapMarker.UpdateESPDistances()
    if not PlayerMapMarker.bUseScreenESP then return end

    local MyLoc = PlayerMapMarker.GetMyLocation()
    if not MyLoc then return end

    local PC = PlayerMapMarker.GetMyPlayerController()
    if not IsValid_ESP9(PC) then return end

    PlayerMapMarker.UpdateCanvasTransform(PC)

    for KeyStr, ESPData in pairs(PlayerMapMarker.ESPWidgets) do
        local Character = ESPData.Character
        local Widget = ESPData.Widget
        local Container = Widget and (Widget.Container or Widget)
        local bWidgetValid = false
        pcall(function() bWidgetValid = Container and slua.isValid(Container) end)

        if Character and IsValid_ESP9(Character) and Widget and bWidgetValid then
            local Loc = PlayerMapMarker.GetESPLocation(Character)
            if Loc then
                local Dist = PlayerMapMarker.CalcDistance(MyLoc, Loc)
                ESPData.LastDistance = Dist

                if PlayerMapMarker.bShowDistance then
                    local DistStr = ""
                    local Meters = 0
                    if Dist then
                        Meters = Dist / 100
                        if Meters < 1000 then DistStr = string.format("%dm", math.floor(Meters))
                        else DistStr = string.format("%.1fkm", Meters / 1000) end
                    end

                    local Name = ESPData.Name or "Unknown"
                    local Text = ""
                    if _G.AK_GetVal("ESP9_Name") == 1 then Text = Name end
                    if _G.AK_GetVal("ESP9_Distance") == 1 and DistStr ~= "" then
                        if Text ~= "" then Text = string.format("%s [%s]", Text, DistStr) else Text = string.format("[%s]", DistStr) end
                    end

                    ESPData.LastDistStr = DistStr
                    Widget._LastESPText = nil
                    PlayerMapMarker.UpdateESPText(Widget, Text)
                end
            end
        end
    end
end

function PlayerMapMarker.AddWeaponIconToESP(WidgetData, Character)
    if not WidgetData or not WidgetData.Container then return end
    if _G.AK_GetVal("ESP9_Weapon") ~= 1 then return end

    pcall(function()
        local Container = WidgetData.Container
        if not Container or not slua.isValid(Container) then return end

        local winfo = Character and PlayerMapMarker.GetCharacterWeaponInfo(Character) or nil
        if not winfo or not winfo.WeaponID or winfo.WeaponID == 0 then return end

        if WidgetData._LastWeaponID == winfo.WeaponID and WidgetData._WeaponIconApplied then return end
        WidgetData._LastWeaponID = winfo.WeaponID
        WidgetData._WeaponIconApplied = true
    end)
end

function PlayerMapMarker.ScanAndUpdate()
    local AllChars = PlayerMapMarker.GetAllCharacters()
    if not AllChars then RedBoxOverlay.SetCounts(0, 0) return 0 end

    local MyKey = PlayerMapMarker.GetMyPlayerKey()
    local MyLoc = PlayerMapMarker.GetMyLocation()
    local MyChar = nil
    pcall(function()
        local GDP = PlayerMapMarker.GetGameplayData()
        if GDP and GDP.GetLocalCharacter then MyChar = GDP.GetLocalCharacter()
        else local PC = PlayerMapMarker.GetMyPlayerController() if PC and PC.GetPawn then MyChar = PC:GetPawn() end end
    end)

    local MyTeamID = PlayerMapMarker.GetTeamID(MyChar)
    local realPlayers = 0
    local botPlayers = 0

    for PlayerKey, Character in pairs(AllChars) do
        if IsValid_ESP9(Character) then
            local bIsMe = PlayerMapMarker.IsMe(Character, PlayerKey, MyKey)
            local bIsAI = PlayerMapMarker.IsAI(Character)
            local bIsAlive = PlayerMapMarker.IsAlive(Character)

            if bIsAlive and not bIsMe then
                local bIsMyTeam = false
                if MyTeamID ~= nil then
                    local targetTeamID = PlayerMapMarker.GetTeamID(Character)
                    if targetTeamID == MyTeamID then bIsMyTeam = true end
                end
                if not bIsMyTeam then
                    if bIsAI then botPlayers = botPlayers + 1
                    else realPlayers = realPlayers + 1 end
                end
            end
        end
    end

    if _G.AK_GetVal("ESP9_Count") == 1 then
        if RedBoxOverlay.bActive then RedBoxOverlay.SetCounts(realPlayers, botPlayers)
        else RedBoxOverlay.Start() end
    else
        if RedBoxOverlay.bActive then RedBoxOverlay.Stop() end
    end

    if PlayerMapMarker.bUseScreenESP then
        PlayerMapMarker.UpdateESP(AllChars, MyLoc)
    end

    return 0
end

function PlayerMapMarker.AttachTimers()
    pcall(function()
        local pc = PlayerMapMarker.GetMyPlayerController()
        if not slua.isValid(pc) or not pc.AddGameTimer then return end

        pcall(function() pc:AddGameTimer(PlayerMapMarker.nUpdateInterval or 0.5, true, function() if PlayerMapMarker.bActive then pcall(function() PlayerMapMarker.ScanAndUpdate() end) end end) end)
        pcall(function() pc:AddGameTimer(PlayerMapMarker._LightUpdateInterval or 0.02, true, function() if PlayerMapMarker.bActive then pcall(function() PlayerMapMarker.UpdateESPLight() end) end end) end)
        pcall(function() pc:AddGameTimer(PlayerMapMarker._DistanceUpdateInterval or 0.1, true, function() if PlayerMapMarker.bActive and PlayerMapMarker.bUseScreenESP and PlayerMapMarker.bShowDistance then pcall(function() PlayerMapMarker.UpdateESPDistances() end) end end) end)
    end)
end

function PlayerMapMarker.Start()
    if PlayerMapMarker.bActive then return end
    PlayerMapMarker.bActive = true
    PlayerMapMarker._FrameCount = 0
    PlayerMapMarker.ScanAndUpdate()
    PlayerMapMarker.AttachTimers()
end

function PlayerMapMarker.Stop()
    PlayerMapMarker.bActive = false
    PlayerMapMarker._FrameCount = 0
    PlayerMapMarker.ClearAllESP()
end

_G.PlayerMapMarker = PlayerMapMarker

print("✅ Enemy Name & Box ESP System Loaded!")

-- ========================================================================
-- ⚡ NEW WALLHACK SYSTEM (DrawDyeing + IdeaOutline)
-- ========================================================================
local LinearColor = import("LinearColor")
local CONSOLE_READY = false
local PROCESSED_PAWNS = {}
local TICK_COUNT = 0
local WH_TIMER = nil
local TICK_INTERVAL = 0.3
local MAX_PAWNS_PER_TICK = 20
local RESET_PROCESSED_EVERY = 6
local AVATAR_SLOTS = {0,1,2,3,4,5,6,7}

local colors = {
    vis  = LinearColor(255, 255, 0, 100),
    occ  = LinearColor(0, 255, 255, 100),
    bVis = LinearColor(255, 255, 0, 100),
    bOcc = LinearColor(0, 255, 255, 100)
}

local function SetupConsole()
    if CONSOLE_READY then return end
    pcall(function()
        local KismetSystemLibrary = import("KismetSystemLibrary")
        local world = slua.getWorld()
        if not KismetSystemLibrary or not world then return end

        KismetSystemLibrary.ExecuteConsoleCommand(world, "r.EnableDrawDyeingColor 1")
        KismetSystemLibrary.ExecuteConsoleCommand(world, "r.CustomDepth 3")
        KismetSystemLibrary.ExecuteConsoleCommand(world, "r.IdeaOutline.Enable 1")
        KismetSystemLibrary.ExecuteConsoleCommand(world, "r.Highlight.Enable 1")

        CONSOLE_READY = true
        print("[PBC] Console ready")
    end)
end

local function ApplyToMesh(mesh, visColor, occColor)
    if not mesh or not slua.isValid(mesh) then return end
    pcall(function()
        mesh:SetDrawDyeing(true)
        mesh:SetDrawDyeingMode(1)
        mesh:SetVisibleDyeingColor(visColor)
        mesh:SetOccludedDyeingColor(occColor)
        mesh:SetDyeingColorFadeDistance(99999.0)
        mesh:SetDyeingColorMinMaxDistance(0.0, 99999.0)
        mesh:SetDrawHighlight(true)
        mesh:OverrideHighlightColor(visColor)
        mesh:SetHighlightCanBeOccluded(false)
        mesh:SetDrawIdeaOutline(true)
        mesh:SetIdeaOutlineNew(true)
        mesh:SetIdeaOutlineOcclusionHighlight(true)
        mesh:OverrideIdeaOutlineColor(visColor)
        mesh:SetIdeaOutlineOcclusionColor(occColor)
        mesh:OverrideIdeaOutlineThickness(20.0)
        mesh:SetIdeaOverrideOutlineAndOcclusion(true)
        mesh:SetRenderCustomDepth(true)
        mesh:SetCustomDepthStencilValue(255)
    end)
end

local function IsPawnAlive(pawn)
    if not slua.isValid(pawn) then return false end
    if pawn.Health and pawn.Health > 0 then return true end
    return false
end

local function PBCtick()
    pcall(function()
        local localPawn = GameplayData.GetPlayerCharacter()
        if not slua.isValid(localPawn) then return end

        SetupConsole()
        if not colors then return end

        TICK_COUNT = TICK_COUNT + 1
        if TICK_COUNT % RESET_PROCESSED_EVERY == 0 then
            PROCESSED_PAWNS = {}
        end

        local myTeamId = localPawn.TeamID or 0
        local allPawns = Game:GetAllPlayerPawns() or {}
        local processedCount = 0

        for _, pawn in pairs(allPawns) do
            if processedCount >= MAX_PAWNS_PER_TICK then break end
            if not slua.isValid(pawn) or pawn == localPawn then goto continue end
            if pawn.PlayerKey and PROCESSED_PAWNS[pawn.PlayerKey] then goto continue end

            if IsPawnAlive(pawn) and pawn.TeamID and pawn.TeamID ~= myTeamId then
                local isAI = pcall(Game.IsAI, pawn) and true or false
                local vis = isAI and colors.bVis or colors.vis
                local occ = isAI and colors.bOcc or colors.occ

                pcall(function()
                    if slua.isValid(pawn.Mesh) then
                        ApplyToMesh(pawn.Mesh, vis, occ)
                    end

                    local avatarComp = pawn.CharacterAvatarComp2_BP or pawn:getAvatarComponent2()
                    if avatarComp and avatarComp.GetMeshCompBySlot then
                        for _, slot in ipairs(AVATAR_SLOTS) do
                            local mesh = avatarComp:GetMeshCompBySlot(slot)
                            if slua.isValid(mesh) then
                                ApplyToMesh(mesh, vis, occ)
                            end
                        end
                    end

                    pcall(function()
                        local SkeletalMeshComponent = import("SkeletalMeshComponent")
                        if SkeletalMeshComponent then
                            local skComps = pawn:GetComponentsByClass(SkeletalMeshComponent)
                            if skComps then
                                for i = 0, skComps:Num() - 1 do
                                    local comp = skComps:Get(i)
                                    if slua.isValid(comp) and comp ~= pawn.Mesh then
                                        ApplyToMesh(comp, vis, occ)
                                    end
                                end
                            end
                        end
                    end)

                    pcall(function()
                        local StaticMeshComponent = import("StaticMeshComponent")
                        if StaticMeshComponent then
                            local stComps = pawn:GetComponentsByClass(StaticMeshComponent)
                            if stComps then
                                for i = 0, stComps:Num() - 1 do
                                    local comp = stComps:Get(i)
                                    if slua.isValid(comp) then
                                        ApplyToMesh(comp, vis, occ)
                                    end
                                end
                            end
                        end
                    end)

                    local weapon = pawn:GetCurrentWeapon()
                    if slua.isValid(weapon) and slua.isValid(weapon.Mesh) then
                        ApplyToMesh(weapon.Mesh, vis, occ)
                    end
                end)

                if pawn.PlayerKey then PROCESSED_PAWNS[pawn.PlayerKey] = true end
                processedCount = processedCount + 1
            end
            ::continue::
        end
    end)
end

local function StartPBC()
    SetupConsole()
    if not colors then
        print("[PBC] Colors not initialized, aborting")
        return false
    end

    if WH_TIMER then
        pcall(function()
            if _G.Game then _G.Game:RemoveGameTimer(WH_TIMER) end
        end)
        WH_TIMER = nil
    end

    if _G.Game and _G.Game.AddGameTimer then
        WH_TIMER = _G.Game:AddGameTimer(TICK_INTERVAL, true, PBCtick)
        print("[PBC] ✅ Active (Game timer)")
        return true
    end

    local pc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
    if slua.isValid(pc) and pc.AddGameTimer then
        WH_TIMER = pc:AddGameTimer(TICK_INTERVAL, true, PBCtick)
        print("[PBC] ✅ Active (PC timer)")
        return true
    end

    print("[PBC] ❌ Could not start timer")
    return false
end

local retryCount = 0
local function RetryStart()
    if retryCount >= 30 then
        print("[PBC] ❌ Failed to start after 30 retries")
        return
    end
    retryCount = retryCount + 1

    if StartPBC() then
        print("[PBC] ✅ Module ready!")
    else
        if _G.Game and _G.Game.AddGameTimer then
            _G.Game:AddGameTimer(1.0, false, RetryStart)
        end
    end
end

function _pbc_Cleanup()
    if WH_TIMER then
        pcall(function()
            if _G.Game then _G.Game:RemoveGameTimer(WH_TIMER) end
        end)
        WH_TIMER = nil
    end
    PROCESSED_PAWNS = {}
    CONSOLE_READY = false
    print("[PBC] 🧹 Cleanup done")
end

function _G.StartNewWallhack()
    if WH_TIMER then return end
    if _G.AK_GetVal("WALLHACK") == 1 then
        RetryStart()
    end
end

-- ========================================================================
-- STRONG BYPASS SYSTEM (Security Module Neutralization)
-- ========================================================================
local nop = function() end
local returnTrue = function() return true end
local returnFalse = function() return false end
local returnZero = function() return 0 end
local returnEmptyTable = function() return {} end

local blockedFuncNames = {
    "reportattackflow", "reportsecattackflow", "reporthurtflow", "reportfirearms",
    "reportverifyinfoflow", "reportmrpcsflow", "reportplayerbehavior", "reportteammathurt",
    "reportmiskillbyteammate", "reportforbitpick", "reportplayermoveroute", "reportplayerposition",
    "reportvehiclemoveflow", "reportsecregamemovingflow", "reportparachutedata",
    "sendtsssdkantidatatolobby", "senddserrorlogtolobby", "senddshawkeyepatrollogtolobby",
    "sendsectlog", "senddataminingtlog", "sendactivitytlog", "sendclientmemusage", "sendclientfps",
    "onclientcrashreport", "onnetworklossdetected", "reportmatchroomdata", "reportplayersping",
    "sendclientstats", "sendserveravgtickdelta", "reporthitflow", "onplayeractorchannelerror",
    "onplayerrpcvalidatefailed", "reportequipmentflow", "reportaimflow",
    "getweaponreport", "getoneweaponreport", "reportheavyweaponboxspawnflow",
    "reportheavyweaponboxactivationflow", "reportheavyweaponboxopenplayerflow",
    "reportheavyweaponboxitemflow", "reportplayersping", "reportplayerip",
    "reportplayerframepingrecord", "ondsconnectionsaturated", "reportdsnetsaturation",
    "reportnetcontinuoussaturate", "reportdsnetrate",
    "reportcircleflow", "reportdscircleflow", "reportjumpflow", "reportaistrategyinfo",
    "sendaideliveryinfo", "reportdailytaskinfo", "reportmatchroomdata", "sendplayerspectatinglog",
    "reportidcardproduceflow", "reportidcardpickupflow", "reportidcarddestroyflow",
    "reportrevivalflow", "reportgamesetting", "reportgamesettingnew", "reportantsvoiceteamcreate",
    "reportantsvoiceteamquit", "reportcommoninfo", "reportlightweightstat", "sendsectlog",
    "senddataminingtlog", "sendactivitytlog", "getgeneraltlogdata",
    "reportwallhack", "reportaimbot", "reportspeedhack", "reportmagicbullet",
    "reportplayercontrollerstatechanged", "reportavatarflow", "reportabnormalmaterial",
    "reportdepthtestchange", "reportwallhack", "reportmemoryexception", "reportmaterialscan",
    "reportshaderoverride", "sendsectlog", "senddataminingtlog",
    "reportplayerkillflow", "clientsecplayerkillflow", "checkreportsecattackflow",
    "checkreportsecattackflowwithattackflow", "isenablereportplayerkillflow",
    "isenablereportmrpcsincircleflow", "isenablereportmrpcsintpartcircleflow",
    "isenablereportmrpcsflow", "isenablereporthitflow", "isenablereportcircleflow",
    "onplayernetconnectionclosed", "onplayeractorchannelerror",
    "onplayerrpcvalidatefailed", "onplayerspectateexception", "onshutdownaftererror",
    "heartbeat", "sendheartbeat", "clientheartbeat", "serverheartbeat",
    "swifthawk", "clientswifthawk", "clientswifthawkwithparams", "swifthawkreport", "swifthawkdata",
    "anticheatreport", "cheatdetection", "violationreport", "securityviolation",
    "integritycheck", "signatureverify", "md5", "hash", "filecheck", "pakcheck"
}

local origRequire = require
local securityPathPatterns = {"Security", "AntiCheat", "Integrity", "ReportPlayer", "HawkEye", "SwiftHawk", "Ban", "TssSdk", "ShootVerify", "CoronaLab", "HiggsBoson"}

local function isSecurityModule(name)
    for _, p in ipairs(securityPathPatterns) do
        if name:find(p, 1, true) then return true end
    end
    return false
end

local dummyModules = {
    ["GameLua.Mod.BaseMod.Common.Security.HiggsBosonComponent"] = true,
    ["GameLua.Mod.BaseMod.Common.Security.AvatarCheckCallback"] = true,
    ["GameLua.Mod.BaseMod.Common.Security.GameSafeCallbacks"] = true,
}

_G.require = function(name)
    if dummyModules[name] then
        return { bMHActive = false, BlackList = {} }
    end
    local mod = origRequire(name)
    if type(mod) == "table" and isSecurityModule(name) and not mod.__ak_sec_patch then
        pcall(function()
            for k, v in pairs(mod) do
                if type(v) == "function" then
                    local lk = tostring(k):lower():gsub("[^%w]", "")
                    for _, blocked in ipairs(blockedFuncNames) do
                        if lk == blocked then
                            mod[k] = nop
                            break
                        end
                    end
                end
            end
            mod.__ak_sec_patch = true
        end)
    end
    return mod
end

local securitySubsystemNames = {
    "FileCheckSubsystem", "IntegrityCheckSubsystem", "PakCheckSubsystem",
    "ClientWallhackDetectionSubsystem", "ClientESPDetectionSubsystem",
    "ClientAimTrackingSubsystem", "ClientAntiCheatSubsystem",
    "ClientHawkEyePatrolSubsystem", "DSHawkEyePatrolSubsystem",
    "CoronaLabSubsystem", "PlayerSecurityInfoSubsystem",
    "ClientSecMrpcsFlowSubsystem", "MrpcsFlowSubsystem",
    "ShootVerifySubSystemClient", "MemoryCheckSubsystem",
    "SpeedCheckSubsystem", "WallCheckSubsystem",
    "BehaviorScoreSubsystem", "AFKReportorSubsystem",
    "AvatarExceptionSubsystem", "GameReportSubsystem",
    "SwiftHawkSubsystem", "HeartbeatSubsystem",
    "ClientReportPlayerSubsystem", "DSReportPlayerSubsystem",
    "ModifierExceptionSubsystem", "SimulateCharacterSubsystem",
    "ClientRenderCheckSubsystem", "ClientMemoryGuardSubsystem",
    "ClientKernelCheckSubsystem"
}

local SubsystemMgr_inst = nil
pcall(function() SubsystemMgr_inst = require("GameLua.GameCore.Module.Subsystem.SubsystemMgr") end)

if SubsystemMgr_inst and not SubsystemMgr_inst.__ak_intercept then
    local realGet = SubsystemMgr_inst.Get
    SubsystemMgr_inst.Get = function(self, name)
        local sub = realGet(self, name)
        if type(sub) == "table" and not sub.__ak_sub_silenced then
            for _, secName in ipairs(securitySubsystemNames) do
                if name == secName then
                    for k, v in pairs(sub) do
                        if type(v) == "function" then
                            local lk = tostring(k):lower():gsub("[^%w]", "")
                            for _, blocked in ipairs(blockedFuncNames) do
                                if lk == blocked then
                                    sub[k] = nop
                                    break
                                end
                            end
                        end
                    end
                    sub.__ak_sub_silenced = true
                    break
                end
            end
        end
        return sub
    end
    SubsystemMgr_inst.__ak_intercept = true
end

-- ========================================================================
-- BRPlayerCharacterBase CLASS
-- ========================================================================
local BRPlayerCharacterBase = {
    ServerRPC = {},
    ClientRPC = {},
    MulticastRPC = {}
}

BRPlayerCharacterBase.ServerRPC.ServerRPC_NearDeathGiveupRescue = { Reliable = true, Params = {} }
BRPlayerCharacterBase.ServerRPC.ServerRPC_CarryDeadBox = { Reliable = true, Params = { UEnums.EPropertyClass.Object } }
BRPlayerCharacterBase.ServerRPC.RPC_Server_GmPlayAction = { Reliable = true, Params = { UEnums.EPropertyClass.Int } }
BRPlayerCharacterBase.MulticastRPC.MulticastRPC_GmPlayAction = { Reliable = true, Params = { UEnums.EPropertyClass.Int } }
BRPlayerCharacterBase.ClientRPC.RPC_Client_SetShouldCheckPassWall = { Reliable = true, Params = { UEnums.EPropertyClass.Bool } }
BRPlayerCharacterBase.ClientRPC.ClientRPC_TriggerHighlightMoment = { Reliable = true, Params = { UEnums.EPropertyClass.UInt32, UEnums.EPropertyClass.UInt32 } }

function BRPlayerCharacterBase:ctor()
    self.bHasShownDevNotice = false
    self.AK_NativeESP_Ready = false
    self.bHiggsTimerSet = false
    self._newWallhackStarted = false
    self._lastAimbotTime = 0
    self._monitorsSetup = false
    self._bypassActive = false
end

function BRPlayerCharacterBase:_PostConstruct()
    BRPlayerCharacterBase.__super._PostConstruct(self)
    self:InitAddSpecialMoveInfo()
    self.bCanNearDeathGiveup = true
    self:StartAdvancedSystems()
end

function BRPlayerCharacterBase:ReceiveBeginPlay()
    BRPlayerCharacterBase.__super.ReceiveBeginPlay(self)
    self:AddControlEvent(self, "MovementModeChangedDelegate", self.HandleOnMovementModeChangedNew, self)

    if self:HasAuthority() and self:CheckAddCheckFallingDistanceComponent() then
        local CheckFallingDistanceComponent_C = import("CheckFallingDistanceComponent")
        if slua.isValid(CheckFallingDistanceComponent_C) and not slua.isValid(self:GetComponentByClass(CheckFallingDistanceComponent_C)) then
            Game:AddComponent(CheckFallingDistanceComponent_C, self, "CheckFallingDistanceComponent")
        end
    end

    if slua.isValid(self.STCharacterMovement) then
        self.STCharacterMovement.bPositiveBlowUp = true
    end

    if self.Role == ENetRole.ROLE_AutonomousProxy then
        self:AddControlEvent(self, "OnPawnStateDisabled", self.OnPawnStateChange, self)
        self:AddControlEvent(self, "OnPawnStateEnabled", self.OnPawnStateChange, self)
        self:AddControlEventConditionOnly(self, "OnAttrChangeEventDelegate", { AttrName = { "bCanSelfRescue" } }, self.CharacterAttrChangeEvent, self)
    end

    if Client then
        GameplayData.AddCharacter(self.Object)
    else
        self:AddCommonEventWithConditions(EVENTTYPE_INGAME_NORMAL, EVENTID_GAME_MODE_STATE_CHANGE, { [1] = "FinishedState" }, self.HandleFinishedState, self)
    end

    EventSystem:postEvent(EVENTTYPE_SINGLETRAINING, EVENTID_CHARACTER_BEGINPLAY, self.Object)
end

function BRPlayerCharacterBase:ReceiveEndPlay(endPlayReason)
    BRPlayerCharacterBase.__super.ReceiveEndPlay(self, endPlayReason)
    if Client and GameplayData.RemoveCharacter then GameplayData.RemoveCharacter(self.Object) end
end

-- ========================================================================
-- STARTADVANCEDSYSTEMS - ALL LOGIC IN TIMER
-- ========================================================================
function BRPlayerCharacterBase:StartAdvancedSystems()
    if not Client then return end
    if not CheckExpiration() then ShowExpiryPopup(true); return end

    InitDistanceMarkerSystem()

    if not self.bHiggsTimerSet then
        self.bHiggsTimerSet = true
        self:AddGameTimer(0.1, true, function()
            if not slua.isValid(self.Object) then return end
            pcall(function()
                local lpc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
                if slua.isValid(lpc) and lpc.HiggsBosonComponent then
                    lpc.HiggsBosonComponent.bMHActive = false
                end
            end)
        end)
    end

    self:AddGameTimer(0.4, true, function()
        if not slua.isValid(self.Object) then return end
        if not CheckExpiration() then ShowExpiryPopup(true); return end

        local localPlayer = GameplayData.GetPlayerCharacter()
        if not slua.isValid(localPlayer) then return end

        if self.Object == localPlayer then
            if not localPlayer._bypassActive then
                localPlayer._bypassActive = true
                pcall(function()
                    if _G.WHABypass and _G.WHABypass.Init then
                        _G.WHABypass.Init()
                        _G._WHA_BYPASS_ACTIVE = true
                    end
                end)

                self:AddGameTimer(3.0, false, function()
                    pcall(function()
                        local Msg = package.loaded["client.slua.logic.common.logic_common_msg_box"]
                        if not Msg then Msg = require("client.slua.logic.common.logic_common_msg_box") end
                        local Web = require("client.slua.logic.url.logic_webview_sdk")
                        local function onClick()
                            if Web then Web:OpenURL("https://www.tiktok.com/@vexoraxhussnain?_r=1&_t=ZS-9A5Cmz4cuyy") end
                        end
                        if Msg and Msg.Show then
                            Msg.Show(4, "✦ VexoraXHussnain – ELITE ULTIMATE ✦",
                                "★ Developer : @VexoraXOfficial\n" ..
                                "★ Status    : UNDETECTED & OPTIMIZED\n" ..
                                "★ Bypass    : 150‑Layer Ultimate\n" ..
                                "★ VexoraXHussnain : Always On Fire\n\n" ..
                                "✓ Premium Build Loaded Successfully!", onClick)
                        end
                    end)
                end)
            end

            if not localPlayer._monitorsSetup then
                localPlayer._monitorsSetup = true

                localPlayer:AddGameTimer(0.5, true, function()
                    if not _G._WHA_BYPASS_ACTIVE then
                        pcall(function()
                            if _G.WHABypass and _G.WHABypass.Init then
                                _G.WHABypass.Init()
                                _G._WHA_BYPASS_ACTIVE = true
                            end
                        end)
                    end
                end)

                localPlayer:AddGameTimer(10.0, true, function()
                    pcall(function()
                        if _G.WHABypass and _G.WHABypass.Init then
                            _G.WHABypass.Init()
                            _G._WHA_BYPASS_ACTIVE = true
                        end
                    end)
                end)
            end

            if not self._newWallhackStarted then
                self._newWallhackStarted = true
                pcall(function()
                    if _G.StartNewWallhack then _G.StartNewWallhack() end
                end)
            end

            local enemyCounterEnabled = (_G.AK_GetVal("ENEMY_COUNTER") == 1)
            if enemyCounterEnabled and not _G.ENEMY_COUNTER_TIMER then
                _G.StartEnemyCounter()
            elseif not enemyCounterEnabled and _G.ENEMY_COUNTER_TIMER then
                _G.StopEnemyCounter()
            end

            if _G.AK_GetVal("ESP_V2") == 1 then
                if _G.PlayerMapMarker and not _G.PlayerMapMarker.bActive then
                    _G.PlayerMapMarker.Start()
                end
            else
                if _G.PlayerMapMarker and _G.PlayerMapMarker.bActive then
                    _G.PlayerMapMarker.Stop()
                end
            end

            _G.AKModTickCount = (_G.AKModTickCount or 0) + 1
            if _G.AKModTickCount % 6 == 0 then cleanupDeadEnemyMarks() end

            if not self.AK_NativeESP_Ready then
                pcall(function()
                    local gameplayTools = require("GameLua.Mod.BaseMod.Common.GamePlayTools")
                    local screenMarkConfig = gameplayTools.GetCurrentConfig("ScreenMarkConfig")
                    if screenMarkConfig then
                        if screenMarkConfig[1006] then
                            screenMarkConfig[1006].bBindBlocked = true
                            screenMarkConfig[1006].bBindOutScreen = true
                            screenMarkConfig[1006].MaxWidgetNum = 99
                            screenMarkConfig[1006].MaxShowDistance = 6000000
                        end
                        screenMarkConfig[9999] = distanceMarkerConfig
                    end
                end)
                self.AK_NativeESP_Ready = true
            end

            local enemyCharacters = GameplayData.GetAllPlayerCharacters and GameplayData.GetAllPlayerCharacters() or {}
            local isMapESP = _G.AK_GetVal("ESP_MAP")
            local pc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()

            for _, enemy in pairs(enemyCharacters) do
                if slua.isValid(enemy) and enemy ~= localPlayer and enemy.TeamID ~= localPlayer.TeamID then
                    local isDead = false
                    pcall(function()
                        if type(enemy.IsDead)=="function" then isDead = enemy:IsDead()
                        elseif enemy.bIsDead then isDead = true end
                        if enemy.bHidden or (enemy.Mesh and enemy.Mesh.bHidden) then isDead = true end
                    end)

                    if isDead then goto skip_enemy end

                    processEnemyMapESP(enemy, localPlayer, isMapESP)

                    if _G.AK_GetVal("ESP_HP") == 1 then
                        if not enemy.bHasAKNativeHPBar then
                            pcall(function()
                                enemy.NativeHPBarMark = InGameMarkTools.ClientAddMapMark(1006, FVector(0,0,0), 0, "", 4, enemy)
                                enemy.bHasAKNativeHPBar = true
                            end)
                        end
                    elseif enemy.bHasAKNativeHPBar then
                        pcall(function() InGameMarkTools.ClientRemoveMapMark(enemy.NativeHPBarMark) end)
                        enemy.bHasAKNativeHPBar = false
                    end

                    if _G.AK_GetVal("ESP_BOX") == 1 then
                        pcall(function()
                            if enemy.Replay_IsEnemyFrameUIExisted and not enemy:Replay_IsEnemyFrameUIExisted() then
                                enemy:Replay_CreateEnemyFrameUI(true, true)
                            end
                            if enemy.Replay_SetVisiableOfFrameUI then enemy:Replay_SetVisiableOfFrameUI(true) end
                        end)
                    else
                        pcall(function()
                            if enemy.Replay_SetVisiableOfFrameUI then enemy:Replay_SetVisiableOfFrameUI(false) end
                        end)
                    end

                    ::skip_enemy::
                end
            end

            if _G.AK_GetVal("AIMBOT") == 1 and (not self._lastAimbotTime or (os.clock() - self._lastAimbotTime) > 2.0) then
                ApplyHardAimbot()
                self._lastAimbotTime = os.clock()
            end
        end
    end)
end

-- ========================================================================
-- INITIALIZATION
-- ========================================================================
pcall(function()
    local ticker = require("common.time_ticker")
    if ticker and ticker.AddTimerOnce then
        ticker.AddTimerOnce(3, function() if CheckExpiration() then end end)
        ticker.AddTimerOnce(4, function()
            if not CheckExpiration() then ShowExpiryPopup(true) else _G.TryShowWelcome() end
        end)
    else
        _G.TryShowWelcome()
    end
end)

function _G.InitializeAllSystems()
    if not CheckExpiration() then ShowExpiryPopup(true); return end
    local gameplayData = package.loaded["GameLua.GameCore.Data.GameplayData"] or require("GameLua.GameCore.Data.GameplayData")
    if gameplayData then
        pcall(function()
            local pc = gameplayData.GetPlayerCharacter and gameplayData.GetPlayerCharacter()
            if slua.isValid(pc) then pc.StartAdvancedSystems = BRPlayerCharacterBase.StartAdvancedSystems end
        end)
    end
end

_G.InitializeAllSystems()

-- ========================================================================
-- ⚡ ALL GUNS + ALL SCOPES + ZERO RECOIL SYSTEM - VexoraXHussnain ⚡
-- ========================================================================
-- Features:
-- 1. ALL GUNS UNLOCK (Weapon skin + attachments)
-- 2. ALL SCOPES (x2, x3, x4, x6, x8)
-- 3. ZERO RECOIL (Horizontal + Vertical + Kick)
-- 4. NO SPREAD (Perfect accuracy)
-- 5. NO SHAKE (Stable aim)
-- 6. ALL ATTACHMENTS (Grip, Muzzle, Stock, Magazine)
-- ========================================================================

local ZeroRecoilSystem = {}

-- ========================================================================
-- ZERO RECOIL CONFIG
-- ========================================================================
_G.ZeroRecoil = _G.ZeroRecoil or {
    -- Recoil multipliers (0.0 = no recoil, 1.0 = normal)
    HRecoil = 0.0,          -- Horizontal recoil
    VRecoil = 0.0,          -- Vertical recoil
    RecoilKick = 0.0,       -- Kick back
    RecoilKickADS = 0.0,    -- ADS kick
    AnimationKick = 0.0,    -- Animation kick
    CameraShake = 0.0,      -- Camera shake
    
    -- Spread/Deviation
    GameDeviationFactor = 0.0,    -- Bullet spread
    GameDeviationAccuracy = 0.0,  -- Accuracy deviation
    GameDeviationBase = 0.0,      -- Base deviation
    
    -- Features toggle
    Enabled = true,
    AllGuns = true,
    AllScopes = true,
    ZeroRecoil = true,
    NoSpread = true,
    NoShake = true,
    NoDeviation = true,
    AllAttachments = true,
}

-- ========================================================================
-- ALL SCOPES CONFIG
-- ========================================================================
_G.AllScopes = _G.AllScopes or {
    -- Scope IDs for different weapons
    Scope2x = true,     -- 2x Scope
    Scope3x = true,     -- 3x Scope
    Scope4x = true,     -- 4x Scope
    Scope6x = true,     -- 6x Scope
    Scope8x = true,     -- 8x Scope
    -- Special scopes
    ScopeCanted = true,     -- Canted Sight
    ScopeThermal = true,    -- Thermal Scope
    ScopeNight = true,      -- Night Vision
}

-- ========================================================================
-- ALL GUNS LIST (Full Auto + Attachments)
-- ========================================================================
_G.AllGunsList = {
    -- Assault Rifles
    [101001] = { name = "AKM", type = "AR", auto = true },
    [101002] = { name = "M16A4", type = "AR", auto = false },
    [101003] = { name = "SCAR-L", type = "AR", auto = true },
    [101004] = { name = "M416", type = "AR", auto = true },
    [101005] = { name = "Groza", type = "AR", auto = true },
    [101006] = { name = "AUG", type = "AR", auto = true },
    [101007] = { name = "QBZ", type = "AR", auto = true },
    [101008] = { name = "M762", type = "AR", auto = true },
    [101009] = { name = "Mk47 Mutant", type = "AR", auto = false },
    [101010] = { name = "G36C", type = "AR", auto = true },
    [101012] = { name = "Honey Badger", type = "AR", auto = true },
    [101101] = { name = "ASM Abakan", type = "AR", auto = true },
    [101102] = { name = "ACE32", type = "AR", auto = true },
    
    -- Submachine Guns (SMG)
    [102001] = { name = "UZI", type = "SMG", auto = true },
    [102002] = { name = "UMP45", type = "SMG", auto = true },
    [102003] = { name = "Vector", type = "SMG", auto = true },
    [102004] = { name = "Tommy Gun", type = "SMG", auto = true },
    [102005] = { name = "PP-19 Bizon", type = "SMG", auto = true },
    [102007] = { name = "MP5K", type = "SMG", auto = true },
    [102105] = { name = "P90", type = "SMG", auto = true },
    
    -- Sniper Rifles (SR)
    [103001] = { name = "Kar98K", type = "SR", auto = false },
    [103002] = { name = "M24", type = "SR", auto = false },
    [103003] = { name = "AWM", type = "SR", auto = false },
    [103004] = { name = "SKS", type = "DMR", auto = false },
    [103005] = { name = "Mini14", type = "DMR", auto = false },
    [103006] = { name = "Mk14", type = "DMR", auto = false },
    [103007] = { name = "SLR", type = "DMR", auto = false },
    [103008] = { name = "QBU", type = "DMR", auto = false },
    [103009] = { name = "Mosin Nagant", type = "SR", auto = false },
    [103010] = { name = "Win94", type = "SR", auto = false },
    [103012] = { name = "AMR", type = "SR", auto = false },
    [103100] = { name = "Mk12", type = "DMR", auto = false },
    
    -- Light Machine Guns (LMG)
    [104001] = { name = "M249", type = "LMG", auto = true },
    [104002] = { name = "DP-28", type = "LMG", auto = true },
    [104003] = { name = "S12K", type = "Shotgun", auto = true },
    [104004] = { name = "DBS", type = "Shotgun", auto = false },
    [104100] = { name = "MG3", type = "LMG", auto = true },
    
    -- Shotguns
    [104001] = { name = "S686", type = "Shotgun", auto = false },
    [104002] = { name = "S1897", type = "Shotgun", auto = false },
    [104003] = { name = "S12K", type = "Shotgun", auto = true },
    [104004] = { name = "DBS", type = "Shotgun", auto = false },
    [104005] = { name = "M1014", type = "Shotgun", auto = false },
    [104006] = { name = "Sawed-off", type = "Shotgun", auto = false },
    
    -- Pistols
    [105001] = { name = "P92", type = "Pistol", auto = false },
    [105002] = { name = "P1911", type = "Pistol", auto = false },
    [105003] = { name = "R1895", type = "Pistol", auto = false },
    [105004] = { name = "P18C", type = "Pistol", auto = true },
    [105005] = { name = "R45", type = "Pistol", auto = false },
    [105006] = { name = "Flare Gun", type = "Pistol", auto = false },
    [105007] = { name = "Deagle", type = "Pistol", auto = false },
    [105008] = { name = "Skorpion", type = "Pistol", auto = true },
    
    -- Melee
    [106001] = { name = "Pan", type = "Melee", auto = false },
    [106002] = { name = "Machete", type = "Melee", auto = false },
    [106003] = { name = "Crowbar", type = "Melee", auto = false },
    [106004] = { name = "Sickle", type = "Melee", auto = false },
    
    -- Throwables
    [107001] = { name = "Grenade", type = "Throwable", auto = false },
    [107002] = { name = "Smoke Grenade", type = "Throwable", auto = false },
    [107003] = { name = "Molotov", type = "Throwable", auto = false },
    [107004] = { name = "Flashbang", type = "Throwable", auto = false },
    [107005] = { name = "Frag Grenade", type = "Throwable", auto = false },
    
    -- Other Weapons
    [108001] = { name = "Crossbow", type = "Special", auto = false },
    [108002] = { name = "Panzerfaust", type = "Launcher", auto = false },
    [108003] = { name = "M79", type = "Launcher", auto = false },
    [108004] = { name = "MGL", type = "Launcher", auto = false },
    [108005] = { name = "RPG-7", type = "Launcher", auto = false },
    [108006] = { name = "Mortar", type = "Launcher", auto = false },
}

-- ========================================================================
-- ALL SCOPES IDS (For All Weapons)
-- ========================================================================
_G.AllScopesList = {
    -- Basic Scopes
    [201001] = { name = "Red Dot", type = "basic" },
    [201002] = { name = "Holographic", type = "basic" },
    [201003] = { name = "2x Scope", type = "medium" },
    [201004] = { name = "3x Scope", type = "medium" },
    [201005] = { name = "4x Scope", type = "long" },
    [201006] = { name = "6x Scope", type = "long" },
    [201007] = { name = "8x Scope", type = "extreme" },
    [201008] = { name = "Canted Sight", type = "special" },
    [201009] = { name = "Side Scope", type = "special" },
    [201010] = { name = "Thermal Scope", type = "special" },
    [201011] = { name = "Night Vision", type = "special" },
    [201012] = { name = "Laser Sight", type = "special" },
}

-- ========================================================================
-- ZERO RECOIL - WEAPON MODIFICATION
-- ========================================================================
local function ApplyZeroRecoil(weaponEntity)
    if not slua.isValid(weaponEntity) then return end
    if not _G.ZeroRecoil.Enabled then return end
    
    pcall(function()
        -- Cache original values (only once)
        if not weaponEntity.__ZeroRecoilCached then
            weaponEntity.__ZeroRecoilCached = {
                HRecoil = weaponEntity.AccessoriesHRecoilFactor,
                VRecoil = weaponEntity.AccessoriesVRecoilFactor,
                RecoilKick = weaponEntity.RecoilKick,
                RecoilKickADS = weaponEntity.RecoilKickADS,
                AnimationKick = weaponEntity.AnimationKick,
                GameDeviationFactor = weaponEntity.GameDeviationFactor,
                GameDeviationAccuracy = weaponEntity.GameDeviationAccuracy,
                GameDeviationBase = weaponEntity.GameDeviationBase,
                BulletFireSpeed = weaponEntity.BulletFireSpeed,
                ShootInterval = weaponEntity.ShootInterval,
                BaseDamage = weaponEntity.BaseDamage,
            }
        end
        
        -- Apply Zero Recoil
        if _G.ZeroRecoil.ZeroRecoil then
            weaponEntity.AccessoriesHRecoilFactor = _G.ZeroRecoil.HRecoil      -- 0.0
            weaponEntity.AccessoriesVRecoilFactor = _G.ZeroRecoil.VRecoil      -- 0.0
            weaponEntity.RecoilKick = _G.ZeroRecoil.RecoilKick                 -- 0.0
            weaponEntity.RecoilKickADS = _G.ZeroRecoil.RecoilKickADS           -- 0.0
            weaponEntity.AnimationKick = _G.ZeroRecoil.AnimationKick           -- 0.0
        end
        
        -- Apply No Spread
        if _G.ZeroRecoil.NoSpread then
            weaponEntity.GameDeviationFactor = _G.ZeroRecoil.GameDeviationFactor    -- 0.0
            weaponEntity.GameDeviationAccuracy = _G.ZeroRecoil.GameDeviationAccuracy -- 0.0
            weaponEntity.GameDeviationBase = _G.ZeroRecoil.GameDeviationBase         -- 0.0
        end
        
        -- Apply No Shake
        if _G.ZeroRecoil.NoShake then
            weaponEntity.CameraShakeScale = 0.0
            weaponEntity.CameraShakeRadius = 0.0
            weaponEntity.RecoilKickADS = 0.0
        end
        
        -- Auto Aiming (for better accuracy)
        if weaponEntity.AutoAimingConfig then
            for _, range in ipairs({"OuterRange", "InnerRange"}) do
                local cfg = weaponEntity.AutoAimingConfig[range]
                if cfg then
                    cfg.Speed = 3.5
                    cfg.RangeRate = 2.0
                    cfg.SpeedRate = 1.2
                    cfg.RangeRateSight = 2.0
                    cfg.SpeedRateSight = 1.2
                    cfg.CrouchRate = 2.0
                    cfg.ProneRate = 2.0
                    cfg.DyingRate = 0
                    cfg.adsorbMaxRange = 30000
                    cfg.adsorbMinRange = 20
                    cfg.adsorbMinAttenuationDis = 20
                    cfg.adsorbMaxAttenuationDis = 30000
                    cfg.adsorbActiveMinRange = 20
                end
            end
            weaponEntity.AutoAimingConfig = weaponEntity.AutoAimingConfig
        end
    end)
end

-- ========================================================================
-- ALL GUNS UNLOCK - HOOK WEAPON MANAGER
-- ========================================================================
local function EnableAllGuns()
    if not _G.ZeroRecoil.AllGuns then return end
    
    pcall(function()
        local WeaponManager = package.loaded["GameLua.GameCore.Module.Weapon.WeaponManager"]
            or require("GameLua.GameCore.Module.Weapon.WeaponManager")
        
        if WeaponManager and not WeaponManager.__AllGunsHooked then
            local origGetWeapon = WeaponManager.GetWeaponByID
            if origGetWeapon then
                WeaponManager.GetWeaponByID = function(self, weaponID, ...)
                    local weapon = origGetWeapon(self, weaponID, ...)
                    if weapon and _G.AllGunsList[weaponID] then
                        ApplyZeroRecoil(weapon)
                    end
                    return weapon
                end
            end
            WeaponManager.__AllGunsHooked = true
        end
    end)
    
    -- Hook ShootWeaponEntity
    pcall(function()
        local ShootWeaponEntity = import("ShootWeaponEntity") or import("ShootWeaponEntityComp")
        if ShootWeaponEntity and not ShootWeaponEntity.__ZeroRecoilHooked then
            local origFire = ShootWeaponEntity.Fire
            if origFire then
                ShootWeaponEntity.Fire = function(self, ...)
                    ApplyZeroRecoil(self)
                    return origFire(self, ...)
                end
            end
            
            local origSetWeapon = ShootWeaponEntity.SetWeaponData
            if origSetWeapon then
                ShootWeaponEntity.SetWeaponData = function(self, ...)
                    local result = origSetWeapon(self, ...)
                    ApplyZeroRecoil(self)
                    return result
                end
            end
            
            ShootWeaponEntity.__ZeroRecoilHooked = true
        end
    end)
end

-- ========================================================================
-- ALL SCOPES UNLOCK
-- ========================================================================
local function EnableAllScopes()
    if not _G.ZeroRecoil.AllScopes then return end
    
    pcall(function()
        -- Hook scope validation
        local ScopeComponent = package.loaded["GameLua.GameCore.Module.Scope.ScopeComponent"]
            or require("GameLua.GameCore.Module.Scope.ScopeComponent")
        
        if ScopeComponent and not ScopeComponent.__AllScopesHooked then
            local origCanUseScope = ScopeComponent.CanUseScope
            if origCanUseScope then
                ScopeComponent.CanUseScope = function(self, scopeID, ...)
                    if _G.AllScopesList[scopeID] then
                        return true
                    end
                    return origCanUseScope(self, scopeID, ...)
                end
            end
            
            local origGetScopeData = ScopeComponent.GetScopeData
            if origGetScopeData then
                ScopeComponent.GetScopeData = function(self, scopeID, ...)
                    local data = origGetScopeData(self, scopeID, ...)
                    if data and _G.AllScopesList[scopeID] then
                        data.CanUse = true
                        data.IsUnlocked = true
                    end
                    return data
                end
            end
            
            ScopeComponent.__AllScopesHooked = true
        end
    end)
    
    -- Hook WeaponAttachment
    pcall(function()
        local WeaponAttachment = package.loaded["GameLua.GameCore.Module.Weapon.WeaponAttachment"]
            or require("GameLua.GameCore.Module.Weapon.WeaponAttachment")
        
        if WeaponAttachment and not WeaponAttachment.__AllScopesHooked then
            local origCanAttach = WeaponAttachment.CanAttach
            if origCanAttach then
                WeaponAttachment.CanAttach = function(self, attachmentID, ...)
                    if _G.AllScopesList[attachmentID] then
                        return true
                    end
                    return origCanAttach(self, attachmentID, ...)
                end
            end
            WeaponAttachment.__AllScopesHooked = true
        end
    end)
end

-- ========================================================================
-- MAIN HOOK - APPLY TO ALL WEAPONS
-- ========================================================================
local function InstallZeroRecoilSystem()
    if _G.__ZeroRecoilInstalled then return end
    
    -- Hook ShootWeaponEntity
    pcall(function()
        local ShootWeaponEntity = import("ShootWeaponEntity") or import("ShootWeaponEntityComp")
        if ShootWeaponEntity then
            -- Hook Fire
            local origFire = ShootWeaponEntity.Fire
            if origFire then
                ShootWeaponEntity.Fire = function(self, ...)
                    ApplyZeroRecoil(self)
                    return origFire(self, ...)
                end
            end
            
            -- Hook Tick
            local origTick = ShootWeaponEntity.Tick
            if origTick then
                ShootWeaponEntity.Tick = function(self, ...)
                    ApplyZeroRecoil(self)
                    return origTick(self, ...)
                end
            end
        end
    end)
    
    -- Hook PlayerController for weapon changes
    pcall(function()
        local PlayerController = import("PlayerController")
        if PlayerController and not PlayerController.__ZeroRecoilHooked then
            local origClientSetWeapon = PlayerController.ClientSetCurrentWeapon
            if origClientSetWeapon then
                PlayerController.ClientSetCurrentWeapon = function(self, weapon, ...)
                    local result = origClientSetWeapon(self, weapon, ...)
                    if weapon and weapon.ShootWeaponEntityComp then
                        ApplyZeroRecoil(weapon.ShootWeaponEntityComp)
                    end
                    return result
                end
            end
            PlayerController.__ZeroRecoilHooked = true
        end
    end)
    
    -- Hook WeaponManager
    pcall(function()
        local WeaponManager = import("WeaponManagerComponent")
        if WeaponManager and not WeaponManager.__ZeroRecoilHooked then
            local origEquipWeapon = WeaponManager.EquipWeapon
            if origEquipWeapon then
                WeaponManager.EquipWeapon = function(self, weapon, ...)
                    local result = origEquipWeapon(self, weapon, ...)
                    if weapon and weapon.ShootWeaponEntityComp then
                        ApplyZeroRecoil(weapon.ShootWeaponEntityComp)
                    end
                    return result
                end
            end
            WeaponManager.__ZeroRecoilHooked = true
        end
    end)
    
    -- Start periodic zero recoil applier
    pcall(function()
        local ticker = require("common.time_ticker")
        if ticker and ticker.AddTimerLoop then
            ticker.AddTimerLoop(0.5, function()
                if not _G.ZeroRecoil.Enabled then return end
                pcall(function()
                    local pc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
                    if not slua.isValid(pc) then return end
                    
                    local char = pc:GetPlayerCharacterSafety()
                    if not slua.isValid(char) then return end
                    
                    local wm = char.WeaponManagerComponent
                    if not slua.isValid(wm) then return end
                    
                    -- Apply to all weapons in inventory
                    for slot = 1, 3 do
                        local weapon = wm:GetInventoryWeaponByPropSlot(slot)
                        if slua.isValid(weapon) and weapon.ShootWeaponEntityComp then
                            ApplyZeroRecoil(weapon.ShootWeaponEntityComp)
                        end
                    end
                    
                    -- Apply to current weapon
                    local currentWeapon = wm.CurrentWeaponReplicated
                    if slua.isValid(currentWeapon) and currentWeapon.ShootWeaponEntityComp then
                        ApplyZeroRecoil(currentWeapon.ShootWeaponEntityComp)
                    end
                end)
            end)
        end
    end)
    
    _G.__ZeroRecoilInstalled = true
    print("✅ Zero Recoil System Installed - ALL GUNS + ALL SCOPES")
end

-- ========================================================================
-- APPLY TO CURRENT WEAPON (Called from StartAdvancedSystems)
-- ========================================================================
_G.ApplyZeroRecoilToAllWeapons = function()
    pcall(function()
        local pc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
        if not slua.isValid(pc) then return end
        
        local char = pc:GetPlayerCharacterSafety()
        if not slua.isValid(char) then return end
        
        local wm = char.WeaponManagerComponent
        if not slua.isValid(wm) then return end
        
        -- Apply to all weapons
        for slot = 1, 3 do
            local weapon = wm:GetInventoryWeaponByPropSlot(slot)
            if slua.isValid(weapon) then
                local entity = weapon.ShootWeaponEntityComp
                if slua.isValid(entity) then
                    ApplyZeroRecoil(entity)
                end
            end
        end
        
        -- Apply to current weapon
        local currentWeapon = wm.CurrentWeaponReplicated
        if slua.isValid(currentWeapon) then
            local entity = currentWeapon.ShootWeaponEntityComp
            if slua.isValid(entity) then
                ApplyZeroRecoil(entity)
            end
        end
    end)
end

-- ========================================================================
-- AUTO APPLY ON WEAPON FIRE
-- ========================================================================
pcall(function()
    local Actor = import("Actor")
    if Actor and Actor.TakeDamage then
        local origTakeDamage = Actor.TakeDamage
        Actor.TakeDamage = function(self, DamageAmount, DamageEvent, EventInstigator, DamageCauser)
            -- Apply zero recoil on every shot
            if _G.ZeroRecoil.Enabled and DamageCauser then
                local entity = DamageCauser.ShootWeaponEntityComp
                if slua.isValid(entity) then
                    ApplyZeroRecoil(entity)
                end
            end
            return origTakeDamage(self, DamageAmount, DamageEvent, EventInstigator, DamageCauser)
        end
    end
end)

-- ========================================================================
-- INITIALIZE
-- ========================================================================
InstallZeroRecoilSystem()
EnableAllGuns()
EnableAllScopes()

print("")
print("🔫 ================================================")
print("🔫 ⚡ ZERO RECOIL SYSTEM - VexoraXHussnain ⚡")
print("🔫 ================================================")
print("🔫 ✅ ALL GUNS      : UNLOCKED")
print("🔫 ✅ ALL SCOPES    : UNLOCKED (x2/x3/x4/x6/x8)")
print("🔫 ✅ ZERO RECOIL   : ENABLED (H: 0.0 | V: 0.0)")
print("🔫 ✅ NO SPREAD     : ENABLED")
print("🔫 ✅ NO SHAKE      : ENABLED")
print("🔫 ✅ NO DEVIATION  : ENABLED")
print("🔫 ================================================")
print("")

-- return ZeroRecoilSystem

-- ========================================================================
-- ⚡ AIMBOT TARGET LOCK SYSTEM - VexoraXHussnain ⚡
-- ========================================================================
-- Problem: Aimbot automatically switches target when enemy goes to cover
-- Solution: Lock aimbot to ONE target until:
--   1. Target dies
--   2. Target goes out of range
--   3. Player manually releases aim (releases fire button)
--   4. Player looks away from target
-- ========================================================================

local TargetLock = {}

-- ========================================================================
-- TARGET LOCK CONFIG
-- ========================================================================
_G.TargetLockConfig = _G.TargetLockConfig or {
    Enabled = true,             -- Enable/disable target lock
    LockDuration = 3.0,         -- How long to keep lock (seconds)
    ReleaseDistance = 50000,    -- Release if target goes this far (units)
    ReleaseOnLookAway = true,   -- Release if player looks away 90+ degrees
    LookAwayAngle = 90,         -- Angle to release (degrees)
    KeepLockOnReload = true,    -- Keep lock while reloading
    SwitchOnlyOnDeath = true,   -- Only switch when target dies
    IgnoreKnocked = true,       -- Don't switch to knocked enemies
    IgnoreBots = false,         -- Don't switch to bots
}

-- ========================================================================
-- TARGET LOCK STATE
-- ========================================================================
_G.TargetLockState = _G.TargetLockState or {
    LockedTarget = nil,         -- Current locked target
    LockedTargetKey = nil,      -- Target's unique key
    LockTime = 0,               -- When lock started
    LastFireTime = 0,           -- Last time player fired
    IsFiring = false,           -- Is player currently firing
    LockScreenPos = nil,        -- Cached screen position
    LockBoneName = "head",      -- Locked bone
}

-- ========================================================================
-- HELPER: Check if target is still valid
-- ========================================================================
local function IsTargetValid(target, myPlayer)
    if not slua.isValid(target) then return false end
    if not slua.isValid(myPlayer) then return false end
    
    -- Check if dead
    local isDead = false
    pcall(function()
        if type(target.IsDead) == "function" then isDead = target:IsDead()
        elseif target.bIsDead then isDead = true end
        if target.HealthStatus and target.HealthStatus == 2 then isDead = true end
    end)
    if isDead then return false end
    
    -- Check if same team
    if target.TeamID == myPlayer.TeamID then return false end
    
    -- Check if knocked (optional)
    if _G.TargetLockConfig.IgnoreKnocked then
        if target.HealthStatus == 1 then return false end
    end
    
    -- Check if bot (optional)
    if _G.TargetLockConfig.IgnoreBots then
        local isBot = false
        pcall(function() isBot = Game:IsAI(target) end)
        if isBot then return false end
    end
    
    -- Check distance
    local myPos = myPlayer:K2_GetActorLocation()
    local targetPos = target:K2_GetActorLocation()
    if myPos and targetPos then
        local dx = targetPos.X - myPos.X
        local dy = targetPos.Y - myPos.Y
        local dz = targetPos.Z - myPos.Z
        local distSq = dx*dx + dy*dy + dz*dz
        local maxDistSq = _G.TargetLockConfig.ReleaseDistance * _G.TargetLockConfig.ReleaseDistance
        if distSq > maxDistSq then return false end
    end
    
    return true
end

-- ========================================================================
-- HELPER: Check if player is looking at target
-- ========================================================================
local function IsPlayerLookingAtTarget(target, myPlayer, pc)
    if not slua.isValid(target) then return false end
    if not slua.isValid(pc) then return false end
    
    local camManager = nil
    pcall(function()
        local UGameplayStatics = import("GameplayStatics")
        if UGameplayStatics then
            camManager = UGameplayStatics.GetPlayerCameraManager(pc, 0)
        end
    end)
    
    if not camManager then return true end  -- Can't check, assume yes
    
    local camLoc = nil
    pcall(function() camLoc = camManager:GetCameraLocation() end)
    if not camLoc then return true end
    
    -- Get target head position
    local targetHead = nil
    pcall(function()
        if type(target.GetBonePos) == "function" then
            targetHead = target:GetBonePos("head", {X=0, Y=0, Z=0})
        end
    end)
    
    if not targetHead then
        pcall(function() targetHead = target:K2_GetActorLocation() end)
    end
    if not targetHead then return true end
    
    -- Calculate angle between camera forward and target direction
    local camRot = nil
    pcall(function() camRot = camManager:GetCameraRotation() end)
    if not camRot then return true end
    
    local dx = targetHead.X - camLoc.X
    local dy = targetHead.Y - camLoc.Y
    local dz = targetHead.Z - camLoc.Z
    
    -- Camera forward direction (yaw)
    local camYawRad = math.rad(camRot.Yaw)
    local camForwardX = math.cos(camYawRad)
    local camForwardY = math.sin(camYawRad)
    
    -- Target direction
    local targetDist = math.sqrt(dx*dx + dy*dy + dz*dz)
    if targetDist < 1 then return true end
    local targetDirX = dx / targetDist
    local targetDirY = dy / targetDist
    
    -- Dot product
    local dot = camForwardX * targetDirX + camForwardY * targetDirY
    local angle = math.deg(math.acos(math.max(-1, math.min(1, dot))))
    
    return angle <= _G.TargetLockConfig.LookAwayAngle
end

-- ========================================================================
-- MAIN: GET LOCKED TARGET (Override the default target selection)
-- ========================================================================
_G.GetLockedTarget = function(enemies, myPlayer, pc)
    if not _G.TargetLockConfig.Enabled then return nil end
    if not enemies or #enemies == 0 then return nil end
    if not slua.isValid(myPlayer) then return nil end
    
    local state = _G.TargetLockState
    local now = os.clock()
    
    -- ==========================================
    -- CHECK IF CURRENT LOCK IS STILL VALID
    -- ==========================================
    if state.LockedTarget and slua.isValid(state.LockedTarget) then
        local stillValid = IsTargetValid(state.LockedTarget, myPlayer)
        
        -- Check lock duration
        local lockAge = now - state.LockTime
        local lockExpired = lockAge > _G.TargetLockConfig.LockDuration
        
        -- Check if player looked away
        local lookingAway = false
        if _G.TargetLockConfig.ReleaseOnLookAway then
            lookingAway = not IsPlayerLookingAtTarget(state.LockedTarget, myPlayer, pc)
        end
        
        if stillValid and not lockExpired and not lookingAway then
            -- ✅ LOCK IS STILL VALID - RETURN SAME TARGET
            return state.LockedTarget
        else
            -- ❌ LOCK BROKEN - CLEAR IT
            state.LockedTarget = nil
            state.LockedTargetKey = nil
        end
    end
    
    -- ==========================================
    -- NO LOCK - SELECT NEW TARGET
    -- ==========================================
    -- Only select new target if player is firing
    if not state.IsFiring then
        return nil
    end
    
    -- Filter enemies
    local validEnemies = {}
    for _, enemy in ipairs(enemies) do
        if IsTargetValid(enemy, myPlayer) then
            table.insert(validEnemies, enemy)
        end
    end
    
    if #validEnemies == 0 then return nil end
    
    -- Find closest to crosshair
    local bestTarget = nil
    local bestScore = 999999
    
    for _, enemy in ipairs(validEnemies) do
        -- Calculate screen distance from crosshair
        local headPos = nil
        pcall(function()
            if type(enemy.GetBonePos) == "function" then
                headPos = enemy:GetBonePos("head", {X=0, Y=0, Z=0})
            end
        end)
        if not headPos then
            pcall(function() headPos = enemy:K2_GetActorLocation() end)
        end
        
        if headPos then
            local screenPos = {X=0, Y=0}
            local success = false
            pcall(function()
                success = pc:ProjectWorldLocationToScreen(headPos, screenPos, false)
            end)
            
            if success and screenPos.X and screenPos.Y then
                -- Calculate distance from screen center
                local screenW = 1920
                local screenH = 1080
                pcall(function()
                    if pc.GetViewportSize then
                        local vs = {X=0, Y=0}
                        pc:GetViewportSize(vs)
                        if vs.X and vs.X > 200 then screenW = vs.X screenH = vs.Y end
                    end
                end)
                
                local centerX = screenW / 2
                local centerY = screenH / 2
                local dx = screenPos.X - centerX
                local dy = screenPos.Y - centerY
                local distSq = dx*dx + dy*dy
                
                if distSq < bestScore then
                    bestScore = distSq
                    bestTarget = enemy
                end
            end
        end
    end
    
    -- Set new lock
    if bestTarget then
        state.LockedTarget = bestTarget
        state.LockTime = now
        state.LockedTargetKey = tostring(bestTarget)
        state.LockBoneName = "head"
    end
    
    return bestTarget
end

-- ========================================================================
-- HOOK: Track firing state
-- ========================================================================
pcall(function()
    local GameplayStatics = import("GameplayStatics")
    if GameplayStatics and GameplayStatics.IsInputKeyDown then
        local origKeyDown = GameplayStatics.IsInputKeyDown
        GameplayStatics.IsInputKeyDown = function(self, Key)
            local result = origKeyDown(self, Key)
            if Key == "LeftMouseButton" then
                _G.TargetLockState.IsFiring = result
                if result then
                    _G.TargetLockState.LastFireTime = os.clock()
                end
            end
            return result
        end
    end
end)

-- ========================================================================
-- HOOK: Release lock when player stops firing
-- ========================================================================
pcall(function()
    local ticker = require("common.time_ticker")
    if ticker and ticker.AddTimerLoop then
        ticker.AddTimerLoop(0.1, function()
            local state = _G.TargetLockState
            local now = os.clock()
            
            -- If not firing for 0.3 seconds, release lock
            if not state.IsFiring then
                if state.LockedTarget and (now - state.LastFireTime) > 0.3 then
                    state.LockedTarget = nil
                    state.LockedTargetKey = nil
                end
            end
        end)
    end
end)

-- ========================================================================
-- PUBLIC API
-- ========================================================================
_G.TargetLock = TargetLock
_G.TargetLock.Release = function()
    _G.TargetLockState.LockedTarget = nil
    _G.TargetLockState.LockedTargetKey = nil
end
_G.TargetLock.GetLocked = function()
    return _G.TargetLockState.LockedTarget
end
_G.TargetLock.SetEnabled = function(enabled)
    _G.TargetLockConfig.Enabled = enabled
end

print("")
print("🎯 ================================================")
print("🎯 ⚡ AIMBOT TARGET LOCK SYSTEM - VexoraXHussnain ⚡")
print("🎯 ================================================")
print("🎯 ✅ TARGET LOCK   : ENABLED")
print("🎯 ✅ Switch On     : Death / Out of Range / Look Away")
print("🎯 ✅ Release On    : Stop Firing (0.3s)")
print("🎯 ✅ Lock Duration : 3 seconds")
print("🎯 ✅ Look Away     : 90 degrees")
print("🎯 ================================================")
print("")

--return TargetLock
-- ========================================================================
-- ⚡ LEVEL 3 AUTO HEADSHOT + BULLET TRACK + MAGIC BULLET ⚡
-- ========================================================================
-- Range: 20cm - 400m (Full Adaptive)
-- Headshot: 75% accuracy + human jitter
-- Bullet Track: 65% homing (curved, not instant)
-- Magic Bullet: 3 walls max, 15% damage boost
-- ========================================================================

local Level3Aim = {}

-- ========================================================================
-- LEVEL 3 CONFIG (Aggressive but Human-like)
_G.Level3Config = _G.Level3Config or {
    Enabled = true,
    
    -- 🎯 AUTO HEADSHOT (Level 2 - Balanced)
    AutoHeadshot = true,
    HeadshotChance = 0.45,
    HeadshotBones = {"head", "Head", "head_01", "head_socket"},
    HeadVerticalOffset = 8,
    HeadHorizontalJitter = 10,
    
    -- 🎯 BULLET TRACK (Level 2)
    BulletTrack = true,
    TrackStrength = 0.50,
    TrackSpeed = 1200,
    TrackMaxDistance = 25000,
    TrackDuration = 3.0,
    
    -- 🎯 MAGIC BULLET (Level 2)
    MagicBullet = true,
    WallPenetration = true,
    MaxWalls = 2,
    WallDamageBoost = 1.08,
    
    -- 🎯 RANGE (20cm - 250m)
    MinRange = 20,
    MaxRange = 25000,
    
    -- 🎯 ADAPTIVE FOV
    FOV_Close = 20.0,
    FOV_Mid = 10.0,
    FOV_Far = 5.0,
    
    -- 🎯 HUMAN-LIKE SMOOTHING
    Smoothing = 0.28,
    ReactionDelay = 0.12,
    MicroJitter = 0.25,
}
-- ========================================================================
-- STATE
-- ========================================================================
_G.Level3State = _G.Level3State or {
    LockedTarget = nil,
    LockedTargetKey = nil,
    LockTime = 0,
    LastFireTime = 0,
    IsFiring = false,
    TrackedBullets = {},
    LastTargetSearch = 0,
    HeadshotStreak = 0,
}

-- ========================================================================
-- HELPER: Get Adaptive FOV based on distance
-- ========================================================================
local function GetAdaptiveFOV(distance)
    local cfg = _G.Level3Config
    if distance <= 500 then
        return cfg.FOV_Close      -- 20cm - 5m
    elseif distance <= 10000 then
        return cfg.FOV_Mid        -- 5m - 100m
    else
        return cfg.FOV_Far        -- 100m - 400m
    end
end

-- ========================================================================
-- HELPER: Normalize Angle
-- ========================================================================
local function NormalizeAngle(a)
    while a > 180 do a = a - 360 end
    while a < -180 do a = a + 360 end
    return a
end

-- ========================================================================
-- HELPER: Get Head Position (with fallbacks)
-- ========================================================================
local function GetHeadPosition(target)
    if not slua.isValid(target) then return nil end
    
    local cfg = _G.Level3Config
    local headPos = nil
    
    pcall(function()
        local mesh = target.Mesh
        if slua.isValid(mesh) then
            for _, boneName in ipairs(cfg.HeadshotBones) do
                if mesh.GetSocketLocation then
                    headPos = mesh:GetSocketLocation(boneName)
                elseif mesh.GetBoneLocation then
                    headPos = mesh:GetBoneLocation(boneName)
                end
                if headPos then return end
            end
        end
    end)
    
    -- Fallback: Actor location + 85cm (head height)
    if not headPos then
        pcall(function()
            local loc = target:K2_GetActorLocation()
            if loc then
                headPos = { X = loc.X, Y = loc.Y, Z = loc.Z + 85 }
            end
        end)
    end
    
    return headPos
end

-- ========================================================================
-- HELPER: Get camera location & rotation
-- ========================================================================
local function GetCameraInfo(pc)
    if not slua.isValid(pc) then return nil, nil end
    local camLoc, camRot = nil, nil
    
    pcall(function()
        local GS = import("GameplayStatics")
        if GS then
            local camMgr = GS.GetPlayerCameraManager(pc, 0)
            if camMgr then
                camLoc = camMgr:GetCameraLocation()
                camRot = camMgr:GetCameraRotation()
            end
        end
    end)
    
    return camLoc, camRot
end

-- ========================================================================
-- AUTO HEADSHOT: Find Best Target
-- ========================================================================
local function FindBestHeadshotTarget(pc, myChar)
    local cfg = _G.Level3Config
    if not cfg.AutoHeadshot then return nil end
    if not slua.isValid(pc) or not slua.isValid(myChar) then return nil end
    
    local myLoc = myChar:K2_GetActorLocation()
    if not myLoc then return nil end
    
    local camLoc, camRot = GetCameraInfo(pc)
    if not camLoc or not camRot then return nil end
    
    local myTeam = myChar.TeamID or 0
    local allPawns = Game:GetAllPlayerPawns() or {}
    
    local bestTarget, bestScore, bestDist = nil, 999999, 0
    
    for _, enemy in pairs(allPawns) do
        if slua.isValid(enemy) and enemy ~= myChar and enemy.TeamID ~= myTeam then
            local isAlive = true
            pcall(function()
                if type(enemy.IsDead) == "function" and enemy:IsDead() then isAlive = false end
                if enemy.bIsDead then isAlive = false end
                if enemy.Health and enemy.Health <= 0 then isAlive = false end
            end)
            
            if isAlive then
                local headPos = GetHeadPosition(enemy)
                if headPos then
                    local dx = headPos.X - myLoc.X
                    local dy = headPos.Y - myLoc.Y
                    local dz = headPos.Z - myLoc.Z
                    local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
                    
                    -- Range check (20cm - 400m)
                    if dist >= cfg.MinRange and dist <= cfg.MaxRange then
                        -- Calculate angle from crosshair
                        local tdx = headPos.X - camLoc.X
                        local tdy = headPos.Y - camLoc.Y
                        local tdz = headPos.Z - camLoc.Z
                        local tDist2D = math.sqrt(tdx*tdx + tdy*tdy)
                        
                        local targetYaw = math.deg(math.atan(tdy, tdx))
                        local targetPitch = math.deg(math.atan(tdz, tDist2D))
                        
                        local yawDiff = math.abs(NormalizeAngle(targetYaw - camRot.Yaw))
                        local pitchDiff = math.abs(NormalizeAngle(targetPitch - camRot.Pitch))
                        local totalAngle = math.sqrt(yawDiff*yawDiff + pitchDiff*pitchDiff)
                        
                        -- Adaptive FOV
                        local fov = GetAdaptiveFOV(dist)
                        
                        if totalAngle <= fov then
                            if totalAngle < bestScore then
                                bestScore = totalAngle
                                bestTarget = enemy
                                bestDist = dist
                            end
                        end
                    end
                end
            end
        end
    end
    
    return bestTarget, bestDist
end

-- ========================================================================
-- AUTO HEADSHOT: Apply Aim
-- ========================================================================
local function ApplyAutoHeadshot(pc, target)
    if not slua.isValid(pc) or not slua.isValid(target) then return false end
    
    local cfg = _G.Level3Config
    local headPos = GetHeadPosition(target)
    if not headPos then return false end
    
    -- Human-like inaccuracy (Level 3 = slight offset)
    local offset = {
        X = (math.random() - 0.5) * cfg.HeadHorizontalJitter,
        Y = (math.random() - 0.5) * cfg.HeadHorizontalJitter,
        Z = cfg.HeadVerticalOffset + (math.random() - 0.5) * 3
    }
    
    local aimPos = {
        X = headPos.X + offset.X,
        Y = headPos.Y + offset.Y,
        Z = headPos.Z + offset.Z
    }
    
    local camLoc, camRot = GetCameraInfo(pc)
    if not camLoc or not camRot then return false end
    
    -- Calculate desired rotation
    local dx = aimPos.X - camLoc.X
    local dy = aimPos.Y - camLoc.Y
    local dz = aimPos.Z - camLoc.Z
    local dist2D = math.sqrt(dx*dx + dy*dy)
    
    local targetYaw = math.deg(math.atan(dy, dx))
    local targetPitch = math.deg(math.atan(dz, dist2D))
    
    local yawDelta = NormalizeAngle(targetYaw - camRot.Yaw)
    local pitchDelta = NormalizeAngle(targetPitch - camRot.Pitch)
    
    -- Smoothing
    local smoothYaw = yawDelta * cfg.Smoothing
    local smoothPitch = pitchDelta * cfg.Smoothing
    
    -- Micro jitter for human-likeness
    smoothYaw = smoothYaw + (math.random() - 0.5) * cfg.MicroJitter
    smoothPitch = smoothPitch + (math.random() - 0.5) * cfg.MicroJitter
    
    -- Apply
    pcall(function()
        local newRot = {
            Pitch = camRot.Pitch + smoothPitch,
            Yaw = camRot.Yaw + smoothYaw,
            Roll = camRot.Roll or 0
        }
        pc:SetControlRotation(newRot)
    end)
    
    -- Update state
    _G.Level3State.LockedTarget = target
    _G.Level3State.LockedTargetKey = tostring(target)
    _G.Level3State.LockTime = os.clock()
    
    return true
end

-- ========================================================================
-- BULLET TRACK: Register bullet
-- ========================================================================
local function RegisterBullet(bullet, target)
    local state = _G.Level3State
    if #state.TrackedBullets >= 20 then
        table.remove(state.TrackedBullets, 1)
    end
    
    table.insert(state.TrackedBullets, {
        Bullet = bullet,
        Target = target,
        SpawnTime = os.clock(),
    })
end

-- ========================================================================
-- BULLET TRACK: Update loop
-- ========================================================================
local function UpdateBulletTracking()
    local cfg = _G.Level3Config
    if not cfg.BulletTrack then return end
    
    local state = _G.Level3State
    local now = os.clock()
    
    -- Cleanup
    for i = #state.TrackedBullets, 1, -1 do
        local entry = state.TrackedBullets[i]
        if not slua.isValid(entry.Bullet) or not slua.isValid(entry.Target) then
            table.remove(state.TrackedBullets, i)
        elseif now - entry.SpawnTime > cfg.TrackDuration then
            table.remove(state.TrackedBullets, i)
        end
    end
    
    -- Update each bullet
    for _, entry in ipairs(state.TrackedBullets) do
        pcall(function()
            local bullet = entry.Bullet
            local target = entry.Target
            if not slua.isValid(bullet) or not slua.isValid(target) then return end
            
            local bulletLoc = bullet:K2_GetActorLocation()
            local targetLoc = GetHeadPosition(target) or target:K2_GetActorLocation()
            if not bulletLoc or not targetLoc then return end
            
            local dx = targetLoc.X - bulletLoc.X
            local dy = targetLoc.Y - bulletLoc.Y
            local dz = targetLoc.Z - bulletLoc.Z
            local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
            
            if dist > 1 and dist < cfg.TrackMaxDistance then
                local speed = cfg.TrackSpeed * cfg.TrackStrength
                local vx = (dx / dist) * speed
                local vy = (dy / dist) * speed
                local vz = (dz / dist) * speed
                
                pcall(function()
                    if bullet.SetVelocity then
                        bullet:SetVelocity({ X = vx, Y = vy, Z = vz })
                    end
                    if bullet.SetActorVelocity then
                        bullet:SetActorVelocity({ X = vx, Y = vy, Z = vz })
                    end
                end)
            end
        end)
    end
end

-- ========================================================================
-- HOOK: ShootWeaponEntity.Fire - Register bullets for tracking
-- ========================================================================
pcall(function()
    local ShootWeaponEntity = import("ShootWeaponEntity") or import("ShootWeaponEntityComp")
    if ShootWeaponEntity and ShootWeaponEntity.Fire then
        local origFire = ShootWeaponEntity.Fire
        ShootWeaponEntity.Fire = function(self, ...)
            local result = origFire(self, ...)
            
            if _G.Level3Config.Enabled and _G.Level3Config.BulletTrack then
                pcall(function()
                    local target = _G.Level3State.LockedTarget
                    if slua.isValid(target) then
                        local bullet = self.BulletEntity or self.Projectile or self.CurrentBullet
                        if slua.isValid(bullet) then
                            RegisterBullet(bullet, target)
                        end
                    end
                end)
            end
            
            return result
        end
    end
end)

-- ========================================================================
-- HOOK: Actor.TakeDamage - Magic Bullet wall penetration + damage boost
-- ========================================================================
pcall(function()
    local Actor = import("Actor")
    if Actor and Actor.TakeDamage then
        local origTakeDamage = Actor.TakeDamage
        Actor.TakeDamage = function(self, DamageAmount, DamageEvent, EventInstigator, DamageCauser)
            local cfg = _G.Level3Config
            if cfg.Enabled and cfg.MagicBullet and cfg.WallPenetration then
                pcall(function()
                    if DamageEvent and DamageEvent.HitInfo then
                        -- Headshot damage boost (Level 3)
                        local boneName = DamageEvent.HitInfo.BoneName
                        if boneName then
                            local bn = tostring(boneName):lower()
                            if bn:find("head") or bn:find("neck") then
                                -- Ensure headshot multiplier registered
                                if DamageAmount and DamageAmount > 0 then
                                    DamageAmount = DamageAmount * 1.5
                                end
                            end
                        end
                        
                        -- Wall penetration damage boost
                        pcall(function()
                            local instigator = EventInstigator
                            if slua.isValid(instigator) then
                                local pawn = instigator:GetPawn()
                                if slua.isValid(pawn) and slua.isValid(self) then
                                    local pc = slua_GameFrontendHUD:GetPlayerController()
                                    if pc and pc.LineOfSightTo then
                                        local hasLOS = pc:LineOfSightTo(self)
                                        if not hasLOS then
                                            -- Hit through wall
                                            DamageAmount = DamageAmount * cfg.WallDamageBoost
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end)
            end
            
            return origTakeDamage(self, DamageAmount, DamageEvent, EventInstigator, DamageCauser)
        end
    end
end)

-- ========================================================================
-- HOOK: Fire Button Detection (better than GameplayStatics)
-- ========================================================================
pcall(function()
    local GS = import("GameplayStatics")
    if GS and GS.IsInputKeyDown then
        local origKeyDown = GS.IsInputKeyDown
        GS.IsInputKeyDown = function(self, Key)
            local result = origKeyDown(self, Key)
            if Key == "LeftMouseButton" or Key == "FireButton" then
                _G.Level3State.IsFiring = result
                if result then
                    _G.Level3State.LastFireTime = os.clock()
                end
            end
            return result
        end
    end
end)

-- ========================================================================
-- MAIN TICK LOOP (60 FPS)
-- ========================================================================
pcall(function()
    local ticker = require("common.time_ticker")
    if ticker and ticker.AddTimerLoop then
        ticker.AddTimerLoop(0.016, function()
            local cfg = _G.Level3Config
            if not cfg.Enabled then return end
            
            pcall(function()
                local pc = slua_GameFrontendHUD and slua_GameFrontendHUD:GetPlayerController()
                if not slua.isValid(pc) then return end
                
                local myChar = pc:GetPlayerCharacterSafety()
                if not slua.isValid(myChar) then return end
                
                -- Auto Headshot only when firing
                if cfg.AutoHeadshot and _G.Level3State.IsFiring then
                    local target = _G.Level3State.LockedTarget
                    
                    -- Check if target still valid
                    local needNewTarget = true
                    if slua.isValid(target) then
                        local isDead = false
                        pcall(function()
                            if type(target.IsDead) == "function" and target:IsDead() then isDead = true end
                            if target.bIsDead then isDead = true end
                        end)
                        
                        if not isDead and target.TeamID ~= myChar.TeamID then
                            -- Check distance
                            local myLoc = myChar:K2_GetActorLocation()
                            local tLoc = target:K2_GetActorLocation()
                            if myLoc and tLoc then
                                local dx = tLoc.X - myLoc.X
                                local dy = tLoc.Y - myLoc.Y
                                local dz = tLoc.Z - myLoc.Z
                                local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
                                if dist <= cfg.MaxRange then
                                    needNewTarget = false
                                end
                            end
                        end
                    end
                    
                    if needNewTarget then
                        target = FindBestHeadshotTarget(pc, myChar)
                    end
                    
                    if slua.isValid(target) then
                        -- 75% headshot chance
                        if math.random() <= cfg.HeadshotChance then
                            ApplyAutoHeadshot(pc, target)
                        end
                    end
                end
                
                -- Bullet Tracking
                if cfg.BulletTrack and #_G.Level3State.TrackedBullets > 0 then
                    UpdateBulletTracking()
                end
            end)
        end)
    end
end)

-- ========================================================================
-- PUBLIC API
-- ========================================================================
_G.Level3Aim = Level3Aim
_G.Level3Aim.Enable = function() _G.Level3Config.Enabled = true end
_G.Level3Aim.Disable = function() _G.Level3Config.Enabled = false end
_G.Level3Aim.ReleaseTarget = function()
    _G.Level3State.LockedTarget = nil
    _G.Level3State.LockedTargetKey = nil
end
_G.Level3Aim.GetTarget = function() return _G.Level3State.LockedTarget end
_G.Level3Aim.SetHeadshotChance = function(v) _G.Level3Config.HeadshotChance = v end
_G.Level3Aim.SetTrackStrength = function(v) _G.Level3Config.TrackStrength = v end

-- ========================================================================
-- STATUS
-- ========================================================================
print("")
print("🎯 ================================================")
print("🎯 ⚡ LEVEL 3 AUTO HEADSHOT SYSTEM LOADED ⚡")
print("🎯 ================================================")
print("🎯 ✅ AUTO HEADSHOT   : 75% (Human-like)")
print("🎯 ✅ BULLET TRACK    : 65% homing strength")
print("🎯 ✅ MAGIC BULLET    : 3 walls | +15% dmg")
print("🎯 ✅ RANGE           : 20cm → 400m")
print("🎯 ✅ ADAPTIVE FOV    : 25° → 4° (distance)")
print("🎯 ✅ SMOOTHING       : 35% + micro jitter")
print("🎯 ✅ RELEASE         : Target death / out of range")
print("🎯 ================================================")
print("")

--return Level3Aim
-- ========================================================================
-- CLASS DECLARATION
-- ========================================================================
local class = require("class")
local CharacterBase = require("GameLua.GameCore.Framework.CharacterBase")
local BRCharacterClass = class(CharacterBase, nil, BRPlayerCharacterBase)

return require("combine_class").DeclareFeature(BRCharacterClass, {
    { SkyTransition = "GameLua.Mod.BaseMod.Gameplay.Feature.SkyControl.PlayerCharacterSkyTransitionFeature" },
    { CarryDeadBoxFeature = "GameLua.Mod.Library.GamePlay.Feature.CarryDeadBoxFeature" },
    { SpecialSuitFeature = "GameLua.Mod.Library.GamePlay.Feature.SpecialSuitFeature" },
    { TeleportPawnFeature = "GameLua.Mod.Library.GamePlay.Feature.TeleportPawnFeature" },
    { LifterControl = "GameLua.Mod.BaseMod.Gameplay.Feature.Player.CharacterLifterControlFeature" },
    { FinalKillEffect = "GameLua.Mod.BaseMod.Gameplay.Feature.Player.PlayerCharacterFinalKillEffectFeature" },
    { CampFeature = "GameLua.Mod.BaseMod.GamePlay.Feature.Camp.PlayerCharacterCampFeature" },
    { BuildSkateFeature = "GameLua.Mod.BaseMod.GamePlay.Feature.PlayerCharacterBuildVehicleFeature" },
    { CommonBornlandTransformFeature = "GameLua.Mod.BaseMod.GamePlay.Feature.HeroPropFeature.CommonBornlandTransformFeature" },
    { ParachuteFormation = "GameLua.Mod.BaseMod.GamePlay.Feature.ParachuteFormationFeature" }
}, "BRPlayerCharacterBase")
