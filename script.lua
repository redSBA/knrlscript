-- Mobile KRNL Script for Roblox with Invisibility and Multi-language
local player = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Языковые настройки
local languages = {
    RU = {
        loading = "🖼️ Загрузочное изображение показано",
        loadingHidden = "🖼️ Загрузочное изображение скрыто",
        flyScriptLoading = "📥 Загрузка Fly скрипта...",
        flyScriptLoaded = "✅ Fly скрипт успешно загружен!",
        flyPanelOpen = "🪽 Панель Fly открыта",
        flyPanelClosed = "🪽 Панель Fly закрыта",
        updatesPanelOpen = "📜 Панель обновлений открыта",
        updatesPanelClosed = "📜 Панель обновлений закрыта",
        noclipEnabled = "🚷 Noclip ВКЛЮЧЕН - проходите сквозь стены!",
        noclipDisabled = "🚷 Noclip ВЫКЛЮЧЕН",
        invisibilityEnabled = "👻 Невидимость ВКЛЮЧЕНА",
        invisibilityDisabled = "👻 Невидимость ВЫКЛЮЧЕНА",
        spinEnabled = "🔄 Спин ВКЛЮЧЕН",
        spinDisabled = "🔄 Спин ВЫКЛЮЧЕН",
        spinSpeed = "🔄 Скорость спина: ",
        walkSpeed = "🚀 Скорость передвижения: ",
        spinPanelOpen = "⚙️ Панель спина открыта",
        spinPanelClosed = "⚙️ Панель спина закрыта",
        movingPanda = "🐼 Перемещайте панду...",
        pandaMoved = "🐼 Панда перемещена!",
        menuExpanded = "📋 Меню развернуто",
        menuCollapsed = "📋 Меню свернуто",
        scriptActivated = "🚀 Мобильный скрипт v2.0 beta активирован!",
        languageChanged = "🌐 Язык изменен на: Русский",
        
        -- Тексты интерфейса
        madeBy = "made redSBA",
        version = "v2.0 beta",
        updatesButton = "📜 Версии",
        flyButton = "🪽 Полёт",
        invisibleButton = "👻 Невид",
        spinButton = "🔄 Спин",
        noclipButton = "🚷 Noclip",
        speedUpButton = "🚀+",
        speedDownButton = "🚀-",
        spinTitle = "🔄 Настройки Спина",
        spinToggle = "Спин: ВЫКЛ",
        spinSpeedText = "Скорость: 50",
        closeButton = "✕ Закрыть",
        flyTitle = "🪽 Advanced Fly",
        loadFlyButton = "📥 Загрузить Fly скрипт",
        flyInfo = "Загружает продвинутый скрипт полета",
        updatesTitle = "📜 История обновлений",
        updatesText = "v2.0 beta:\n• Добавлена функция спина\n• Обновлён Fly скрипт\n• Добавлен Noclip\n• Улучшен интерфейс\n\nv1.0 beta:\n• Первый релиш\n• Базовая функциональность\n• Система прыжков и скорости\n• Меню управления",
        languageButton = "🌐 Язык",
        languageTitle = "🌐 Выбор языка",
        selectLanguage = "Выберите язык:",
        russian = "🇷🇺 Русский",
        bashkir = "🇸🇱 Башҡорт", -- Флаг перевернут
        english = "🇺🇸 English",
        ukrainian = "🇺🇦 Українська",
        
        -- Сообщения в консоль
        consoleMessages = {
            "🎨 Обновленный дизайн с отдельной кнопкой +!",
            "🐼 Зажмите панду чтобы переместить",
            "➕ Нажмите + чтобы свернуть/развернуть меню",
            "🔄 Нажмите 'Спин' для настроек вращения",
            "🚷 Нажмите 'Noclip' для прохождения сквозь стены",
            "👻 Нажмите 'Невид' для невидимости",
            "🪽 Нажмите 'Полёт' для загрузки Fly скрипта",
            "📜 Нажмите 'Версии' для истории обновлений",
            "🌐 Нажмите 'Язык' для смены языка"
        }
    },
    
    BA = {
        loading = "🖼️ Йөкләү рәсеме күрһәтелде",
        loadingHidden = "🖼️ Йөкләү рәсеме яшерелде",
        flyScriptLoading = "📥 Fly скрипты йөкләнә...",
        flyScriptLoaded = "✅ Fly скрипты уңышлы йөкләнде!",
        flyPanelOpen = "🪽 Fly панеле асылды",
        flyPanelClosed = "🪽 Fly панеле ябылды",
        updatesPanelOpen = "📜 Яңыртыуҙар панеле асылды",
        updatesPanelClosed = "📜 Яңыртыуҙар панеле ябылды",
        noclipEnabled = "🚷 Noclip ҠОШОЛДО - диуәрҙәр аша үтеү!",
        noclipDisabled = "🚷 Noclip СүНДЕРЕЛДЕ",
        invisibilityEnabled = "👻 Күренмәүлек ҠОШОЛДО",
        invisibilityDisabled = "👻 Күренмәүлек СүНДЕРЕЛДЕ",
        spinEnabled = "🔄 Әйләнеш ҠОШОЛДО",
        spinDisabled = "🔄 Әйләнеш СүНДЕРЕЛДЕ",
        spinSpeed = "🔄 Әйләнеш тиҙлеге: ",
        walkSpeed = "🚀 Хәрәкәт тиҙлеге: ",
        spinPanelOpen = "⚙️ Әйләнеш көйләүҙәре асылды",
        spinPanelClosed = "⚙️ Әйләнеш көйләүҙәре ябылды",
        movingPanda = "🐼 Панданы күсерегеҙ...",
        pandaMoved = "🐼 Панда күсерелеүе тәмамланды!",
        menuExpanded = "📋 Меню киңәйтелде",
        menuCollapsed = "📋 Меню төрәндерелде",
        scriptActivated = "🚀 Мобиль скрипт v2.0 beta эшләй!",
        languageChanged = "🌐 Тел үҙгәртелде: Башҡорт",
        
        -- Тексты интерфейса
        madeBy = "redSBA яһаған",
        version = "v2.0 beta",
        updatesButton = "📜 Өлгөләр",
        flyButton = "🪽 Осоу",
        invisibleButton = "👻 Күренмәү",
        spinButton = "🔄 Әйләнеш",
        noclipButton = "🚷 Noclip",
        speedUpButton = "🚀+",
        speedDownButton = "🚀-",
        spinTitle = "🔄 Әйләнеш көйләүҙәре",
        spinToggle = "Әйләнеш: ЯБЫҠ",
        spinSpeedText = "Тиҙлек: 50",
        closeButton = "✕ Ябырға",
        flyTitle = "🪽 Күрһәткесле Осоу",
        loadFlyButton = "📥 Fly скрипты йөкләргә",
        flyInfo = "Күрһәткесле осоу скриптын йөкләй",
        updatesTitle = "📜 Яңыртыуҙар тарихы",
        updatesText = "v2.0 beta:\n• Әйләнеш функцияһы өҫтәлде\n• Fly скрипты яңыртылды\n• Noclip өҫтәлде\n• Интерфейс яҡшыртылды\n\nv1.0 beta:\n• Тәүге сығарылыш\n• Төп функциялар\n• Сикерәү һәм тиҙлек системаһы\n• Идара итеү менюһы",
        languageButton = "🌐 Тел",
        languageTitle = "🌐 Тел һайлау",
        selectLanguage = "Тел һайлағыҙ:",
        russian = "🇷🇺 Урыҫса",
        bashkir = "🇸🇱 Башҡортса", -- Флаг перевернут
        english = "🇺🇸 Инглизсә",
        ukrainian = "🇺🇦 Украинса",
        
        -- Сообщения в консоль
        consoleMessages = {
            "🎨 Яңы дизайн айырым + төймәһе менән!",
            "🐼 Панданы күсереү өсөн тотоп тотоғоҙ",
            "➕ Менюны төрәндереү/киңәйтеү өсөн + төймәһенә баҫығыҙ",
            "🔄 Әйләнеш көйләүҙәре өсөн 'Әйләнеш' төймәһенә баҫығыҙ",
            "🚷 Диуәрҙәр аша үтеү өсөн 'Noclip' төймәһенә баҫығыҙ",
            "👻 Күренмәүлек өсөн 'Күренмәү' төймәһенә баҫығыҙ",
            "🪽 Fly скрипты йөкләү өсөн 'Осоу' төймәһенә баҫығыҙ",
            "📜 Яңыртыуҙар тарихы өсөн 'Өлгөләр' төймәһенә баҫығыҙ",
            "🌐 Телде үҙгәртеү өсөн 'Тел' төймәһенә баҫығыҙ"
        }
    },
    
    EN = {
        loading = "🖼️ Loading image shown",
        loadingHidden = "🖼️ Loading image hidden",
        flyScriptLoading = "📥 Loading Fly script...",
        flyScriptLoaded = "✅ Fly script loaded successfully!",
        flyPanelOpen = "🪽 Fly panel opened",
        flyPanelClosed = "🪽 Fly panel closed",
        updatesPanelOpen = "📜 Updates panel opened",
        updatesPanelClosed = "📜 Updates panel closed",
        noclipEnabled = "🚷 Noclip ENABLED - walk through walls!",
        noclipDisabled = "🚷 Noclip DISABLED",
        invisibilityEnabled = "👻 Invisibility ENABLED",
        invisibilityDisabled = "👻 Invisibility DISABLED",
        spinEnabled = "🔄 Spin ENABLED",
        spinDisabled = "🔄 Spin DISABLED",
        spinSpeed = "🔄 Spin speed: ",
        walkSpeed = "🚀 Walk speed: ",
        spinPanelOpen = "⚙️ Spin settings opened",
        spinPanelClosed = "⚙️ Spin settings closed",
        movingPanda = "🐼 Moving panda...",
        pandaMoved = "🐼 Panda moved!",
        menuExpanded = "📋 Menu expanded",
        menuCollapsed = "📋 Menu collapsed",
        scriptActivated = "🚀 Mobile script v2.0 beta activated!",
        languageChanged = "🌐 Language changed to: English",
        
        -- Тексты интерфейса
        madeBy = "made redSBA",
        version = "v2.0 beta",
        updatesButton = "📜 Versions",
        flyButton = "🪽 Fly",
        invisibleButton = "👻 Invis",
        spinButton = "🔄 Spin",
        noclipButton = "🚷 Noclip",
        speedUpButton = "🚀+",
        speedDownButton = "🚀-",
        spinTitle = "🔄 Spin Settings",
        spinToggle = "Spin: OFF",
        spinSpeedText = "Speed: 50",
        closeButton = "✕ Close",
        flyTitle = "🪽 Advanced Fly",
        loadFlyButton = "📥 Load Fly script",
        flyInfo = "Loads advanced flight script",
        updatesTitle = "📜 Update History",
        updatesText = "v2.0 beta:\n• Added spin function\n• Updated Fly script\n• Added Noclip\n• Improved interface\n\nv1.0 beta:\n• First release\n• Basic functionality\n• Jump and speed system\n• Control menu",
        languageButton = "🌐 Language",
        languageTitle = "🌐 Language Selection",
        selectLanguage = "Select language:",
        russian = "🇷🇺 Russian",
        bashkir = "🇸🇱 Bashkir", -- Флаг перевернут
        english = "🇺🇸 English",
        ukrainian = "🇺🇦 Ukrainian",
        
        -- Сообщения в консоль
        consoleMessages = {
            "🎨 Updated design with separate + button!",
            "🐼 Hold the panda to move it",
            "➕ Press + to collapse/expand menu",
            "🔄 Press 'Spin' for rotation settings",
            "🚷 Press 'Noclip' to walk through walls",
            "👻 Press 'Invis' for invisibility",
            "🪽 Press 'Fly' to load Fly script",
            "📜 Press 'Versions' for update history",
            "🌐 Press 'Language' to change language"
        }
    },
    
    UA = {
        loading = "🖼️ Завантажувальне зображення показано",
        loadingHidden = "🖼️ Завантажувальне зображення приховано",
        flyScriptLoading = "📥 Завантаження Fly скрипту...",
        flyScriptLoaded = "✅ Fly скрипт успішно завантажено!",
        flyPanelOpen = "🪽 Панель Fly відкрита",
        flyPanelClosed = "🪽 Панель Fly закрита",
        updatesPanelOpen = "📜 Панель оновлень відкрита",
        updatesPanelClosed = "📜 Панель оновлень закрита",
        noclipEnabled = "🚷 Noclip УВІМКНЕНО - проходьте крізь стіни!",
        noclipDisabled = "🚷 Noclip ВИМКНЕНО",
        invisibilityEnabled = "👻 Невидимість УВІМКНЕНО",
        invisibilityDisabled = "👻 Невидимість ВИМКНЕНО",
        spinEnabled = "🔄 Обертання УВІМКНЕНО",
        spinDisabled = "🔄 Обертання ВИМКНЕНО",
        spinSpeed = "🔄 Швидкість обертання: ",
        walkSpeed = "🚀 Швидкість переміщення: ",
        spinPanelOpen = "⚙️ Панель обертання відкрита",
        spinPanelClosed = "⚙️ Панель обертання закрита",
        movingPanda = "🐼 Переміщуйте панду...",
        pandaMoved = "🐼 Панду переміщено!",
        menuExpanded = "📋 Меню розгорнуто",
        menuCollapsed = "📋 Меню згорнуто",
        scriptActivated = "🚀 Мобільний скрипт v2.0 beta активовано!",
        languageChanged = "🌐 Мову змінено на: Українська",
        
        -- Тексты интерфейса
        madeBy = "made redSBA",
        version = "v2.0 beta",
        updatesButton = "📜 Версії",
        flyButton = "🪽 Політ",
        invisibleButton = "👻 Невидимість",
        spinButton = "🔄 Обертання",
        noclipButton = "🚷 Noclip",
        speedUpButton = "🚀+",
        speedDownButton = "🚀-",
        spinTitle = "🔄 Налаштування обертання",
        spinToggle = "Обертання: ВИМК",
        spinSpeedText = "Швидкість: 50",
        closeButton = "✕ Закрити",
        flyTitle = "🪽 Розширений політ",
        loadFlyButton = "📥 Завантажити Fly скрипт",
        flyInfo = "Завантажує розширений скрипт польоту",
        updatesTitle = "📜 Історія оновлень",
        updatesText = "v2.0 beta:\n• Додано функцію обертання\n• Оновлено Fly скрипт\n• Додано Noclip\n• Удосконалено інтерфейс\n\nv1.0 beta:\n• Перший реліз\n• Базова функціональність\n• Система стрибків та швидкості\n• Меню керування",
        languageButton = "🌐 Мова",
        languageTitle = "🌐 Вибір мови",
        selectLanguage = "Оберіть мову:",
        russian = "🇷🇺 Російська",
        bashkir = "🇸🇱 Башкирська", -- Флаг перевернут
        english = "🇺🇸 Англійська",
        ukrainian = "🇺🇦 Українська",
        
        -- Сообщения в консоль
        consoleMessages = {
            "🎨 Оновлений дизайн з окремою кнопкою +!",
            "🐼 Утримуйте панду, щоб перемістити її",
            "➕ Натисніть +, щоб згорнути/розгорнути меню",
            "🔄 Натисніть 'Обертання' для налаштувань обертання",
            "🚷 Натисніть 'Noclip' для проходження крізь стіни",
            "👻 Натисніть 'Невидимість' для невидимості",
            "🪽 Натисніть 'Політ' для завантаження Fly скрипту",
            "📜 Натисніть 'Версії' для історії оновлень",
            "🌐 Натисніть 'Мова' для зміни мови"
        }
    }
}

local currentLanguage = "RU" -- Язык по умолчанию

-- Функция для получения перевода
local function t(key)
    return languages[currentLanguage][key] or key
end

-- Конфигурация
local config = {
    infiniteJump = false,
    walkSpeed = 32,
    jumpPower = 50,
    invisible = false,
    flyMode = false,
    flyForce = 100,
    menuExpanded = true,
    spinEnabled = false,
    spinSpeed = 50,
    noclipEnabled = false
}

-- Сенсорные кнопки для мобильного управления
local touchGui = Instance.new("ScreenGui")
touchGui.Name = "MobileHackGui"
touchGui.Parent = game:GetService("CoreGui")

-- Переменные для перемещения панды
local isDragging = false
local dragStartPosition = Vector2.new(0, 0)
local pandaStartPosition = Vector2.new(0, 0)

-- Основной контейнер для кнопки панды
local pandaContainer = Instance.new("Frame")
pandaContainer.Size = UDim2.new(0, 50, 0, 50)
pandaContainer.Position = UDim2.new(0, 10, 0, 10)
pandaContainer.BackgroundTransparency = 1
pandaContainer.ZIndex = 100
pandaContainer.Parent = touchGui

-- Кнопка панды
local pandaButton = Instance.new("TextButton")
pandaButton.Size = UDim2.new(1, 0, 1, 0)
pandaButton.Position = UDim2.new(0, 0, 0, 0)
pandaButton.Text = "🐼"
pandaButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
pandaButton.TextColor3 = Color3.fromRGB(0, 0, 0)
pandaButton.TextScaled = true
pandaButton.ZIndex = 101
pandaButton.Font = Enum.Font.SciFi
pandaButton.TextStrokeTransparency = 0.8
pandaButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
-- Скругление углов
local pandaCorner = Instance.new("UICorner")
pandaCorner.CornerRadius = UDim.new(0, 12)
pandaCorner.Parent = pandaButton
pandaButton.Parent = pandaContainer

-- Отдельная кнопка + (расположена рядом с пандой, но не слишком близко)
local plusButton = Instance.new("TextButton")
plusButton.Size = UDim2.new(0, 30, 0, 30)
plusButton.Position = UDim2.new(0, 55, 0, 10) -- Смещена от панды на 5 пикселей
plusButton.Text = "+"
plusButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
plusButton.TextColor3 = Color3.fromRGB(0, 0, 0)
plusButton.TextScaled = true
plusButton.ZIndex = 101
plusButton.Font = Enum.Font.SciFi
plusButton.TextStrokeTransparency = 0.8
plusButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
-- Скругление углов
local plusCorner = Instance.new("UICorner")
plusCorner.CornerRadius = UDim.new(0, 8)
plusCorner.Parent = plusButton
plusButton.Parent = touchGui

-- Кнопка смены языка
local languageButton = Instance.new("TextButton")
languageButton.Size = UDim2.new(0, 30, 0, 30)
languageButton.Position = UDim2.new(0, 90, 0, 10)
languageButton.Text = "🌐"
languageButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
languageButton.TextColor3 = Color3.fromRGB(0, 0, 0)
languageButton.TextScaled = true
languageButton.ZIndex = 101
languageButton.Font = Enum.Font.SciFi
languageButton.TextStrokeTransparency = 0.8
languageButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
-- Скругление углов
local languageCorner = Instance.new("UICorner")
languageCorner.CornerRadius = UDim.new(0, 8)
languageCorner.Parent = languageButton
languageButton.Parent = touchGui

-- Текст "made redSBA"
local madeByText = Instance.new("TextLabel")
madeByText.Size = UDim2.new(0, 120, 0, 25)
madeByText.Position = UDim2.new(0, 130, 0, 10)
madeByText.Text = t("madeBy")
madeByText.TextColor3 = Color3.fromRGB(0, 0, 0)
madeByText.TextScaled = true
madeByText.Font = Enum.Font.SciFi
madeByText.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
madeByText.BackgroundTransparency = 0
madeByText.TextStrokeTransparency = 0.8
madeByText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
madeByText.ZIndex = 90
madeByText.Visible = true
-- Скругление углов
local madeByCorner = Instance.new("UICorner")
madeByCorner.CornerRadius = UDim.new(0, 8)
madeByCorner.Parent = madeByText
madeByText.Parent = touchGui

-- Текст "v2.0 beta"
local versionText = Instance.new("TextLabel")
versionText.Size = UDim2.new(0, 80, 0, 25)
versionText.Position = UDim2.new(0, 260, 0, 10)
versionText.Text = t("version")
versionText.TextColor3 = Color3.fromRGB(0, 0, 0)
versionText.TextScaled = true
versionText.Font = Enum.Font.Code
versionText.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
versionText.BackgroundTransparency = 0
versionText.TextStrokeTransparency = 0.8
versionText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
versionText.ZIndex = 90
versionText.Visible = true
-- Скругление углов
local versionCorner = Instance.new("UICorner")
versionCorner.CornerRadius = UDim.new(0, 8)
versionCorner.Parent = versionText
versionText.Parent = touchGui

-- Кнопка истории обновлений
local updatesButton = Instance.new("TextButton")
updatesButton.Size = UDim2.new(0, 80, 0, 25)
updatesButton.Position = UDim2.new(0, 350, 0, 10)
updatesButton.Text = t("updatesButton")
updatesButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
updatesButton.TextColor3 = Color3.fromRGB(0, 0, 0)
updatesButton.TextScaled = true
updatesButton.ZIndex = 90
updatesButton.Visible = true
updatesButton.Font = Enum.Font.SciFi
updatesButton.TextStrokeTransparency = 0.8
updatesButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
-- Скругление углов
local updatesCorner = Instance.new("UICorner")
updatesCorner.CornerRadius = UDim.new(0, 8)
updatesCorner.Parent = updatesButton
updatesButton.Parent = touchGui

-- Основная панель управления (горизонтальная вверху)
local controlPanel = Instance.new("Frame")
controlPanel.Size = UDim2.new(1, -20, 0, 60)
controlPanel.Position = UDim2.new(0, 10, 0, 45)
controlPanel.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
controlPanel.BackgroundTransparency = 0
controlPanel.BorderSizePixel = 0
controlPanel.Visible = true
controlPanel.ZIndex = 90
-- Скругление углов
local controlCorner = Instance.new("UICorner")
controlCorner.CornerRadius = UDim.new(0, 15)
controlCorner.Parent = controlPanel
controlPanel.Parent = touchGui

-- Кнопка режима полета
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 80, 0, 40)
flyButton.Position = UDim2.new(0, 10, 0, 10)
flyButton.Text = t("flyButton")
flyButton.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
flyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
flyButton.TextScaled = true
flyButton.Font = Enum.Font.SciFi
flyButton.TextStrokeTransparency = 0.8
flyButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
flyButton.ZIndex = 91
-- Скругление углов
local flyCorner = Instance.new("UICorner")
flyCorner.CornerRadius = UDim.new(0, 10)
flyCorner.Parent = flyButton
flyButton.Parent = controlPanel

-- Кнопка невидимости
local invisibleButton = Instance.new("TextButton")
invisibleButton.Size = UDim2.new(0, 80, 0, 40)
invisibleButton.Position = UDim2.new(0, 100, 0, 10)
invisibleButton.Text = t("invisibleButton")
invisibleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
invisibleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
invisibleButton.TextScaled = true
invisibleButton.Font = Enum.Font.SciFi
invisibleButton.TextStrokeTransparency = 0.8
invisibleButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
invisibleButton.ZIndex = 91
-- Скругление углов
local invisibleCorner = Instance.new("UICorner")
invisibleCorner.CornerRadius = UDim.new(0, 10)
invisibleCorner.Parent = invisibleButton
invisibleButton.Parent = controlPanel

-- Кнопка спина
local spinButton = Instance.new("TextButton")
spinButton.Size = UDim2.new(0, 80, 0, 40)
spinButton.Position = UDim2.new(0, 190, 0, 10)
spinButton.Text = t("spinButton")
spinButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
spinButton.TextColor3 = Color3.fromRGB(0, 0, 0)
spinButton.TextScaled = true
spinButton.Font = Enum.Font.SciFi
spinButton.TextStrokeTransparency = 0.8
spinButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
spinButton.ZIndex = 91
-- Скругление углов
local spinCorner = Instance.new("UICorner")
spinCorner.CornerRadius = UDim.new(0, 10)
spinCorner.Parent = spinButton
spinButton.Parent = controlPanel

-- Кнопка Noclip
local noclipButton = Instance.new("TextButton")
noclipButton.Size = UDim2.new(0, 80, 0, 40)
noclipButton.Position = UDim2.new(0, 280, 0, 10)
noclipButton.Text = t("noclipButton")
noclipButton.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
noclipButton.TextColor3 = Color3.fromRGB(0, 0, 0)
noclipButton.TextScaled = true
noclipButton.Font = Enum.Font.SciFi
noclipButton.TextStrokeTransparency = 0.8
noclipButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
noclipButton.ZIndex = 91
-- Скругление углов
local noclipCorner = Instance.new("UICorner")
noclipCorner.CornerRadius = UDim.new(0, 10)
noclipCorner.Parent = noclipButton
noclipButton.Parent = controlPanel

-- Кнопка увеличения скорости
local speedUpButton = Instance.new("TextButton")
speedUpButton.Size = UDim2.new(0, 40, 0, 40)
speedUpButton.Position = UDim2.new(0, 370, 0, 10)
speedUpButton.Text = t("speedUpButton")
speedUpButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
speedUpButton.TextColor3 = Color3.fromRGB(0, 0, 0)
speedUpButton.TextScaled = true
speedUpButton.Font = Enum.Font.SciFi
speedUpButton.TextStrokeTransparency = 0.8
speedUpButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
speedUpButton.ZIndex = 91
-- Скругление углов
local speedUpCorner = Instance.new("UICorner")
speedUpCorner.CornerRadius = UDim.new(0, 10)
speedUpCorner.Parent = speedUpButton
speedUpButton.Parent = controlPanel

-- Кнопка уменьшения скорости
local speedDownButton = Instance.new("TextButton")
speedDownButton.Size = UDim2.new(0, 40, 0, 40)
speedDownButton.Position = UDim2.new(0, 420, 0, 10)
speedDownButton.Text = t("speedDownButton")
speedDownButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
speedDownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
speedDownButton.TextScaled = true
speedDownButton.Font = Enum.Font.SciFi
speedDownButton.TextStrokeTransparency = 0.8
speedDownButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
speedDownButton.ZIndex = 91
-- Скругление углов
local speedDownCorner = Instance.new("UICorner")
speedDownCorner.CornerRadius = UDim.new(0, 10)
speedDownCorner.Parent = speedDownButton
speedDownButton.Parent = controlPanel

-- Панель настроек спина
local spinPanel = Instance.new("Frame")
spinPanel.Size = UDim2.new(0, 200, 0, 120)
spinPanel.Position = UDim2.new(0, 10, 0, 110)
spinPanel.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
spinPanel.BackgroundTransparency = 0
spinPanel.BorderSizePixel = 0
spinPanel.Visible = false
spinPanel.ZIndex = 95
-- Скругление углов
local spinPanelCorner = Instance.new("UICorner")
spinPanelCorner.CornerRadius = UDim.new(0, 15)
spinPanelCorner.Parent = spinPanel
spinPanel.Parent = touchGui

-- Заголовок панели спина
local spinTitle = Instance.new("TextLabel")
spinTitle.Size = UDim2.new(1, 0, 0, 25)
spinTitle.Position = UDim2.new(0, 0, 0, 0)
spinTitle.Text = t("spinTitle")
spinTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
spinTitle.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
spinTitle.TextScaled = true
spinTitle.Font = Enum.Font.SciFi
spinTitle.TextStrokeTransparency = 0.8
spinTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
spinTitle.ZIndex = 96
-- Скругление углов (только сверху)
local spinTitleCorner = Instance.new("UICorner")
spinTitleCorner.CornerRadius = UDim.new(0, 15)
spinTitleCorner.Parent = spinTitle
spinTitle.Parent = spinPanel

-- Кнопка включения/выключения спина
local spinToggleButton = Instance.new("TextButton")
spinToggleButton.Size = UDim2.new(0, 180, 0, 30)
spinToggleButton.Position = UDim2.new(0, 10, 0, 30)
spinToggleButton.Text = config.spinEnabled and 
    (currentLanguage == "RU" and "Спин: ВКЛ" or 
     currentLanguage == "BA" and "Әйләнеш: АСЫҠ" or 
     currentLanguage == "UA" and "Обертання: УВІМК" or
     "Spin: ON") or 
    t("spinToggle")
spinToggleButton.BackgroundColor3 = config.spinEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(220, 50, 50)
spinToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
spinToggleButton.TextScaled = true
spinToggleButton.Font = Enum.Font.SciFi
spinToggleButton.TextStrokeTransparency = 0.8
spinToggleButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
spinToggleButton.ZIndex = 96
-- Скругление углов
local spinToggleCorner = Instance.new("UICorner")
spinToggleCorner.CornerRadius = UDim.new(0, 8)
spinToggleCorner.Parent = spinToggleButton
spinToggleButton.Parent = spinPanel

-- Кнопка увеличения скорости спина
local spinSpeedUpButton = Instance.new("TextButton")
spinSpeedUpButton.Size = UDim2.new(0, 40, 0, 30)
spinSpeedUpButton.Position = UDim2.new(0, 10, 0, 65)
spinSpeedUpButton.Text = "⬆️"
spinSpeedUpButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
spinSpeedUpButton.TextColor3 = Color3.fromRGB(0, 0, 0)
spinSpeedUpButton.TextScaled = true
spinSpeedUpButton.Font = Enum.Font.SciFi
spinSpeedUpButton.TextStrokeTransparency = 0.8
spinSpeedUpButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
spinSpeedUpButton.ZIndex = 96
-- Скругление углов
local spinSpeedUpCorner = Instance.new("UICorner")
spinSpeedUpCorner.CornerRadius = UDim.new(0, 8)
spinSpeedUpCorner.Parent = spinSpeedUpButton
spinSpeedUpButton.Parent = spinPanel

-- Кнопка уменьшения скорости спина
local spinSpeedDownButton = Instance.new("TextButton")
spinSpeedDownButton.Size = UDim2.new(0, 40, 0, 30)
spinSpeedDownButton.Position = UDim2.new(0, 60, 0, 65)
spinSpeedDownButton.Text = "⬇️"
spinSpeedDownButton.BackgroundColor3 = Color3.fromRGB(200, 100, 100)
spinSpeedDownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
spinSpeedDownButton.TextScaled = true
spinSpeedDownButton.Font = Enum.Font.SciFi
spinSpeedDownButton.TextStrokeTransparency = 0.8
spinSpeedDownButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
spinSpeedDownButton.ZIndex = 96
-- Скругление углов
local spinSpeedDownCorner = Instance.new("UICorner")
spinSpeedDownCorner.CornerRadius = UDim.new(0, 8)
spinSpeedDownCorner.Parent = spinSpeedDownButton
spinSpeedDownButton.Parent = spinPanel

-- Текст скорости спина
local spinSpeedText = Instance.new("TextLabel")
spinSpeedText.Size = UDim2.new(0, 100, 0, 30)
spinSpeedText.Position = UDim2.new(0, 110, 0, 65)
spinSpeedText.Text = t("spinSpeedText"):gsub("50", config.spinSpeed)
spinSpeedText.TextColor3 = Color3.fromRGB(0, 0, 0)
spinSpeedText.BackgroundColor3 = Color3.fromRGB(220, 100, 100)
spinSpeedText.BackgroundTransparency = 0
spinSpeedText.TextScaled = true
spinSpeedText.Font = Enum.Font.SciFi
spinSpeedText.TextStrokeTransparency = 0.8
spinSpeedText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
spinSpeedText.ZIndex = 96
-- Скругление углов
local spinSpeedCorner = Instance.new("UICorner")
spinSpeedCorner.CornerRadius = UDim.new(0, 8)
spinSpeedCorner.Parent = spinSpeedText
spinSpeedText.Parent = spinPanel

-- Кнопка закрытия панели спина
local closeSpinButton = Instance.new("TextButton")
closeSpinButton.Size = UDim2.new(0, 180, 0, 25)
closeSpinButton.Position = UDim2.new(0, 10, 0, 90)
closeSpinButton.Text = t("closeButton")
closeSpinButton.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
closeSpinButton.TextColor3 = Color3.fromRGB(0, 0, 0)
closeSpinButton.TextScaled = true
closeSpinButton.Font = Enum.Font.SciFi
closeSpinButton.TextStrokeTransparency = 0.8
closeSpinButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
closeSpinButton.ZIndex = 96
-- Скругление углов
local closeSpinCorner = Instance.new("UICorner")
closeSpinCorner.CornerRadius = UDim.new(0, 8)
closeSpinCorner.Parent = closeSpinButton
closeSpinButton.Parent = spinPanel

-- Панель Fly скрипта
local flyPanel = Instance.new("Frame")
flyPanel.Size = UDim2.new(0, 250, 0, 150)
flyPanel.Position = UDim2.new(0, 10, 0, 110)
flyPanel.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
flyPanel.BackgroundTransparency = 0
flyPanel.BorderSizePixel = 0
flyPanel.Visible = false
flyPanel.ZIndex = 95
-- Скругление углов
local flyPanelCorner = Instance.new("UICorner")
flyPanelCorner.CornerRadius = UDim.new(0, 15)
flyPanelCorner.Parent = flyPanel
flyPanel.Parent = touchGui

-- Заголовок панели Fly
local flyTitle = Instance.new("TextLabel")
flyTitle.Size = UDim2.new(1, 0, 0, 25)
flyTitle.Position = UDim2.new(0, 0, 0, 0)
flyTitle.Text = t("flyTitle")
flyTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
flyTitle.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
flyTitle.TextScaled = true
flyTitle.Font = Enum.Font.SciFi
flyTitle.TextStrokeTransparency = 0.8
flyTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
flyTitle.ZIndex = 96
-- Скругление углов (только сверху)
local flyTitleCorner = Instance.new("UICorner")
flyTitleCorner.CornerRadius = UDim.new(0, 15)
flyTitleCorner.Parent = flyTitle
flyTitle.Parent = flyPanel

-- Кнопка загрузки Fly скрипта
local loadFlyButton = Instance.new("TextButton")
loadFlyButton.Size = UDim2.new(0, 230, 0, 40)
loadFlyButton.Position = UDim2.new(0, 10, 0, 30)
loadFlyButton.Text = t("loadFlyButton")
loadFlyButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
loadFlyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
loadFlyButton.TextScaled = true
loadFlyButton.Font = Enum.Font.SciFi
loadFlyButton.TextStrokeTransparency = 0.8
loadFlyButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
loadFlyButton.ZIndex = 96
-- Скругление углов
local loadFlyCorner = Instance.new("UICorner")
loadFlyCorner.CornerRadius = UDim.new(0, 10)
loadFlyCorner.Parent = loadFlyButton
loadFlyButton.Parent = flyPanel

-- Информация о Fly скрипта
local flyInfoText = Instance.new("TextLabel")
flyInfoText.Size = UDim2.new(0, 230, 0, 50)
flyInfoText.Position = UDim2.new(0, 10, 0, 75)
flyInfoText.Text = t("flyInfo")
flyInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
flyInfoText.BackgroundColor3 = Color3.fromRGB(220, 100, 100)
flyInfoText.BackgroundTransparency = 0
flyInfoText.TextScaled = true
flyInfoText.TextWrapped = true
flyInfoText.Font = Enum.Font.SciFi
flyInfoText.TextStrokeTransparency = 0.8
flyInfoText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
flyInfoText.ZIndex = 96
-- Скругление углов
local flyInfoCorner = Instance.new("UICorner")
flyInfoCorner.CornerRadius = UDim.new(0, 8)
flyInfoCorner.Parent = flyInfoText
flyInfoText.Parent = flyPanel

-- Кнопка закрытия панели Fly
local closeFlyButton = Instance.new("TextButton")
closeFlyButton.Size = UDim2.new(0, 230, 0, 25)
closeFlyButton.Position = UDim2.new(0, 10, 0, 120)
closeFlyButton.Text = t("closeButton")
closeFlyButton.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
closeFlyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
closeFlyButton.TextScaled = true
closeFlyButton.Font = Enum.Font.SciFi
closeFlyButton.TextStrokeTransparency = 0.8
closeFlyButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
closeFlyButton.ZIndex = 96
-- Скругление углов
local closeFlyCorner = Instance.new("UICorner")
closeFlyCorner.CornerRadius = UDim.new(0, 8)
closeFlyCorner.Parent = closeFlyButton
closeFlyButton.Parent = flyPanel

-- Панель истории обновлений
local updatesPanel = Instance.new("Frame")
updatesPanel.Size = UDim2.new(0, 300, 0, 200)
updatesPanel.Position = UDim2.new(0.5, -150, 0.5, -100)
updatesPanel.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
updatesPanel.BackgroundTransparency = 0
updatesPanel.BorderSizePixel = 0
updatesPanel.Visible = false
updatesPanel.ZIndex = 100
-- Скругление углов
local updatesPanelCorner = Instance.new("UICorner")
updatesPanelCorner.CornerRadius = UDim.new(0, 15)
updatesPanelCorner.Parent = updatesPanel
updatesPanel.Parent = touchGui

-- Заголовок панели обновлений
local updatesTitle = Instance.new("TextLabel")
updatesTitle.Size = UDim2.new(1, 0, 0, 30)
updatesTitle.Position = UDim2.new(0, 0, 0, 0)
updatesTitle.Text = t("updatesTitle")
updatesTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
updatesTitle.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
updatesTitle.TextScaled = true
updatesTitle.Font = Enum.Font.SciFi
updatesTitle.TextStrokeTransparency = 0.8
updatesTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
updatesTitle.ZIndex = 101
-- Скругление углов (только сверху)
local updatesTitleCorner = Instance.new("UICorner")
updatesTitleCorner.CornerRadius = UDim.new(0, 15)
updatesTitleCorner.Parent = updatesTitle
updatesTitle.Parent = updatesPanel

-- Текст обновлений
local updatesText = Instance.new("TextLabel")
updatesText.Size = UDim2.new(0, 280, 0, 140)
updatesText.Position = UDim2.new(0, 10, 0, 35)
updatesText.Text = t("updatesText")
updatesText.TextColor3 = Color3.fromRGB(0, 0, 0)
updatesText.BackgroundColor3 = Color3.fromRGB(220, 100, 100)
updatesText.BackgroundTransparency = 0
updatesText.TextXAlignment = Enum.TextXAlignment.Left
updatesText.TextYAlignment = Enum.TextYAlignment.Top
updatesText.TextScaled = false
updatesText.TextWrapped = true
updatesText.Font = Enum.Font.SciFi
updatesText.TextStrokeTransparency = 0.8
updatesText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
updatesText.ZIndex = 101
-- Скругление углов
local updatesTextCorner = Instance.new("UICorner")
updatesTextCorner.CornerRadius = UDim.new(0, 8)
updatesTextCorner.Parent = updatesText
updatesText.Parent = updatesPanel

-- Кнопка закрытия панели обновлений
local closeUpdatesButton = Instance.new("TextButton")
closeUpdatesButton.Size = UDim2.new(0, 280, 0, 25)
closeUpdatesButton.Position = UDim2.new(0, 10, 0, 170)
closeUpdatesButton.Text = t("closeButton")
closeUpdatesButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeUpdatesButton.TextColor3 = Color3.fromRGB(0, 0, 0)
closeUpdatesButton.TextScaled = true
closeUpdatesButton.Font = Enum.Font.SciFi
closeUpdatesButton.TextStrokeTransparency = 0.8
closeUpdatesButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
closeUpdatesButton.ZIndex = 101
-- Скругление углов
local closeUpdatesCorner = Instance.new("UICorner")
closeUpdatesCorner.CornerRadius = UDim.new(0, 8)
closeUpdatesCorner.Parent = closeUpdatesButton
closeUpdatesButton.Parent = updatesPanel

-- Панель выбора языка
local languagePanel = Instance.new("Frame")
languagePanel.Size = UDim2.new(0, 250, 0, 220) -- Увеличиваем высоту для украинского языка
languagePanel.Position = UDim2.new(0.5, -125, 0.5, -110)
languagePanel.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
languagePanel.BackgroundTransparency = 0
languagePanel.BorderSizePixel = 0
languagePanel.Visible = false
languagePanel.ZIndex = 100
-- Скругление углов
local languagePanelCorner = Instance.new("UICorner")
languagePanelCorner.CornerRadius = UDim.new(0, 15)
languagePanelCorner.Parent = languagePanel
languagePanel.Parent = touchGui

-- Заголовок панели языка
local languageTitle = Instance.new("TextLabel")
languageTitle.Size = UDim2.new(1, 0, 0, 30)
languageTitle.Position = UDim2.new(0, 0, 0, 0)
languageTitle.Text = t("languageTitle")
languageTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
languageTitle.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
languageTitle.TextScaled = true
languageTitle.Font = Enum.Font.SciFi
languageTitle.TextStrokeTransparency = 0.8
languageTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
languageTitle.ZIndex = 101
-- Скругление углов (только сверху)
local languageTitleCorner = Instance.new("UICorner")
languageTitleCorner.CornerRadius = UDim.new(0, 15)
languageTitleCorner.Parent = languageTitle
languageTitle.Parent = languagePanel

-- Текст выбора языка
local selectLanguageText = Instance.new("TextLabel")
selectLanguageText.Size = UDim2.new(0, 230, 0, 25)
selectLanguageText.Position = UDim2.new(0, 10, 0, 35)
selectLanguageText.Text = t("selectLanguage")
selectLanguageText.TextColor3 = Color3.fromRGB(0, 0, 0)
selectLanguageText.BackgroundTransparency = 1
selectLanguageText.TextScaled = true
selectLanguageText.Font = Enum.Font.SciFi
selectLanguageText.TextStrokeTransparency = 0.8
selectLanguageText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
selectLanguageText.ZIndex = 101
selectLanguageText.Parent = languagePanel

-- Кнопка русского языка
local russianButton = Instance.new("TextButton")
russianButton.Size = UDim2.new(0, 230, 0, 30)
russianButton.Position = UDim2.new(0, 10, 0, 65)
russianButton.Text = t("russian")
russianButton.BackgroundColor3 = currentLanguage == "RU" and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(220, 50, 50)
russianButton.TextColor3 = Color3.fromRGB(0, 0, 0)
russianButton.TextScaled = true
russianButton.Font = Enum.Font.SciFi
russianButton.TextStrokeTransparency = 0.8
russianButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
russianButton.ZIndex = 101
-- Скругление углов
local russianCorner = Instance.new("UICorner")
russianCorner.CornerRadius = UDim.new(0, 8)
russianCorner.Parent = russianButton
russianButton.Parent = languagePanel

-- Кнопка башкирского языка
local bashkirButton = Instance.new("TextButton")
bashkirButton.Size = UDim2.new(0, 230, 0, 30)
bashkirButton.Position = UDim2.new(0, 10, 0, 100)
bashkirButton.Text = t("bashkir")
bashkirButton.BackgroundColor3 = currentLanguage == "BA" and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(220, 50, 50)
bashkirButton.TextColor3 = Color3.fromRGB(0, 0, 0)
bashkirButton.TextScaled = true
bashkirButton.Font = Enum.Font.SciFi
bashkirButton.TextStrokeTransparency = 0.8
bashkirButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
bashkirButton.ZIndex = 101
-- Скругление углов
local bashkirCorner = Instance.new("UICorner")
bashkirCorner.CornerRadius = UDim.new(0, 8)
bashkirCorner.Parent = bashkirButton
bashkirButton.Parent = languagePanel

-- Кнопка английского языка
local englishButton = Instance.new("TextButton")
englishButton.Size = UDim2.new(0, 230, 0, 30)
englishButton.Position = UDim2.new(0, 10, 0, 135)
englishButton.Text = t("english")
englishButton.BackgroundColor3 = currentLanguage == "EN" and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(220, 50, 50)
englishButton.TextColor3 = Color3.fromRGB(0, 0, 0)
englishButton.TextScaled = true
englishButton.Font = Enum.Font.SciFi
englishButton.TextStrokeTransparency = 0.8
englishButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
englishButton.ZIndex = 101
-- Скругление углов
local englishCorner = Instance.new("UICorner")
englishCorner.CornerRadius = UDim.new(0, 8)
englishCorner.Parent = englishButton
englishButton.Parent = languagePanel

-- Кнопка украинского языка
local ukrainianButton = Instance.new("TextButton")
ukrainianButton.Size = UDim2.new(0, 230, 0, 30)
ukrainianButton.Position = UDim2.new(0, 10, 0, 170)
ukrainianButton.Text = t("ukrainian")
ukrainianButton.BackgroundColor3 = currentLanguage == "UA" and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(220, 50, 50)
ukrainianButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ukrainianButton.TextScaled = true
ukrainianButton.Font = Enum.Font.SciFi
ukrainianButton.TextStrokeTransparency = 0.8
ukrainianButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
ukrainianButton.ZIndex = 101
-- Скругление углов
local ukrainianCorner = Instance.new("UICorner")
ukrainianCorner.CornerRadius = UDim.new(0, 8)
ukrainianCorner.Parent = ukrainianButton
ukrainianButton.Parent = languagePanel

-- Переменные для спина
local bodyGyro = nil
local spinConnection = nil

-- Переменные для Noclip
local noclipConnection = nil
local originalCollision = {}

-- Функция для анимации
local function animateElement(element, targetProperties, duration)
    local tweenInfo = TweenInfo.new(
        duration,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(element, tweenInfo, targetProperties)
    tween:Play()
    return tween
end

-- Функция для обновления всех текстов интерфейса
local function updateInterfaceLanguage()
    -- Обновляем основные тексты
    madeByText.Text = t("madeBy")
    versionText.Text = t("version")
    updatesButton.Text = t("updatesButton")
    flyButton.Text = t("flyButton")
    invisibleButton.Text = t("invisibleButton")
    spinButton.Text = t("spinButton")
    noclipButton.Text = t("noclipButton")
    speedUpButton.Text = t("speedUpButton")
    speedDownButton.Text = t("speedDownButton")
    
    -- Обновляем панель спина
    spinTitle.Text = t("spinTitle")
    spinToggleButton.Text = config.spinEnabled and 
        (currentLanguage == "RU" and "Спин: ВКЛ" or 
         currentLanguage == "BA" and "Әйләнеш: АСЫҠ" or 
         currentLanguage == "UA" and "Обертання: УВІМК" or
         "Spin: ON") or 
        t("spinToggle")
    spinSpeedText.Text = t("spinSpeedText"):gsub("50", config.spinSpeed)
    closeSpinButton.Text = t("closeButton")
    
    -- Обновляем панель Fly
    flyTitle.Text = t("flyTitle")
    loadFlyButton.Text = t("loadFlyButton")
    flyInfoText.Text = t("flyInfo")
    closeFlyButton.Text = t("closeButton")
    
    -- Обновляем панель обновлений
    updatesTitle.Text = t("updatesTitle")
    updatesText.Text = t("updatesText")
    closeUpdatesButton.Text = t("closeButton")
    
    -- Обновляем панель языка
    languageTitle.Text = t("languageTitle")
    selectLanguageText.Text = t("selectLanguage")
    russianButton.Text = t("russian")
    bashkirButton.Text = t("bashkir")
    englishButton.Text = t("english")
    ukrainianButton.Text = t("ukrainian")
    
    -- Обновляем цвета кнопок языка
    russianButton.BackgroundColor3 = currentLanguage == "RU" and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(220, 50, 50)
    bashkirButton.BackgroundColor3 = currentLanguage == "BA" and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(220, 50, 50)
    englishButton.BackgroundColor3 = currentLanguage == "EN" and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(220, 50, 50)
    ukrainianButton.BackgroundColor3 = currentLanguage == "UA" and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(220, 50, 50)
    
    -- Обновляем цвет кнопки спина
    spinToggleButton.BackgroundColor3 = config.spinEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(220, 50, 50)
end

-- Функция для смены языка
local function changeLanguage(lang)
    if languages[lang] then
        currentLanguage = lang
        updateInterfaceLanguage()
        
        -- Обновляем сообщение в консоли
        local langNames = {
            RU = "Русский",
            BA = "Башҡорт",
            EN = "English",
            UA = "Українська"
        }
        print(t("languageChanged"))
    end
end

-- Функция для показа/скрытия панели языка
local function toggleLanguagePanel()
    languagePanel.Visible = not languagePanel.Visible
end

-- Функция для загрузки Fly скрипта
local function loadFlyScript()
    pcall(function()
        print(t("flyScriptLoading"))
        loadstring(game:HttpGet("https://pastebin.com/raw/v9ke2q8v"))()
        print(t("flyScriptLoaded"))
    end)
end

-- Функция для показа/скрытия панель Fly
local function toggleFlyPanel()
    flyPanel.Visible = not flyPanel.Visible
    if flyPanel.Visible then
        print(t("flyPanelOpen"))
    else
        print(t("flyPanelClosed"))
    end
end

-- Функция для показа/скрытия панели обновлений
local function toggleUpdatesPanel()
    updatesPanel.Visible = not updatesPanel.Visible
    if updatesPanel.Visible then
        print(t("updatesPanelOpen"))
    else
        print(t("updatesPanelClosed"))
    end
end

-- Функция для включения/выключения Noclip
local function toggleNoclip()
    config.noclipEnabled = not config.noclipEnabled
    
    if config.noclipEnabled then
        -- Включаем Noclip
        pcall(function()
            local character = player.Character
            if character then
                -- Сохраняем оригинальные настройки коллизии
                originalCollision = {}
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        originalCollision[part] = part.CanCollide
                        part.CanCollide = false
                    end
                end
                
                -- Создаем соединение для постоянного отключения коллизии
                if noclipConnection then
                    noclipConnection:Disconnect()
                end
                
                noclipConnection = RunService.Stepped:Connect(function()
                    pcall(function()
                        local character = player.Character
                        if character then
                            for _, part in pairs(character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = false
                                end
                            end
                        end
                    end)
                end)
                
                noclipButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
                print(t("noclipEnabled"))
            end
        end)
    else
        -- Выключаем Noclip
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
        
        -- Восстанавливаем оригинальные настройки коллизии
        pcall(function()
            local character = player.Character
            if character then
                for part, canCollide in pairs(originalCollision) do
                    if part and part.Parent then
                        part.CanCollide = canCollide
                    end
                end
                originalCollision = {}
            end
        end)
        
        noclipButton.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
        print(t("noclipDisabled"))
    end
end

-- Функция для включения/выключения невидимости
local function toggleInvisibility()
    config.invisible = not config.invisible
    
    if config.invisible then
        -- Включаем невидимость
        pcall(function()
            local character = player.Character
            if character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 1
                        if part:FindFirstChild("face") then
                            part.face.Transparency = 1
                        end
                    elseif part:IsA("Decal") then
                        part.Transparency = 1
                    elseif part:IsA("Accessory") and part:FindFirstChild("Handle") then
                        part.Handle.Transparency = 1
                    end
                end
                
                if character:FindFirstChild("Humanoid") then
                    character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                end
            end
        end)
        
        invisibleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        print(t("invisibilityEnabled"))
    else
        -- Выключаем невидимость
        pcall(function()
            local character = player.Character
            if character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 0
                        if part:FindFirstChild("face") then
                            part.face.Transparency = 0
                        end
                    elseif part:IsA("Decal") then
                        part.Transparency = 0
                    elseif part:IsA("Accessory") and part:FindFirstChild("Handle") then
                        part.Handle.Transparency = 0
                    end
                end
                
                if character:FindFirstChild("Humanoid") then
                    character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
                end
            end
        end)
        
        invisibleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        print(t("invisibilityDisabled"))
    end
end

-- Функция для включения/выключения спина
local function toggleSpin()
    config.spinEnabled = not config.spinEnabled
    
    if config.spinEnabled then
        -- Включаем спин
        pcall(function()
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local rootPart = character.HumanoidRootPart
                
                -- Удаляем старый BodyGyро если есть
                if bodyGyro then
                    bodyGyro:Destroy()
                    bodyGyro = nil
                end
                
                -- Создаем новый BodyGyro для вращения
                bodyGyro = Instance.new("BodyGyro")
                bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                bodyGyro.P = 1000
                bodyGyro.D = 50
                bodyGyro.CFrame = rootPart.CFrame
                bodyGyro.Parent = rootPart
                
                -- Запускаем вращение
                if spinConnection then
                    spinConnection:Disconnect()
                end
                
                spinConnection = RunService.Heartbeat:Connect(function()
                    if bodyGyro and bodyGyro.Parent and bodyGyro.Parent:IsA("BasePart") then
                        bodyGyro.CFrame = bodyGyro.CFrame * CFrame.Angles(0, math.rad(config.spinSpeed) * 0.016, 0)
                    end
                end)
                
                spinToggleButton.Text = currentLanguage == "RU" and "Спин: ВКЛ" or 
                                       currentLanguage == "BA" and "Әйләнеш: АСЫҠ" or 
                                       currentLanguage == "UA" and "Обертання: УВІМК" or
                                       "Spin: ON"
                spinToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
                print(t("spinEnabled"))
            end
        end)
    else
        -- Выключаем спин
        if spinConnection then
            spinConnection:Disconnect()
            spinConnection = nil
        end
        
        if bodyGyro then
            bodyGyro:Destroy()
            bodyGyro = nil
        end
        
        spinToggleButton.Text = t("spinToggle")
        spinToggleButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
        print(t("spinDisabled"))
    end
end

-- Функция для изменения скорости спина
local function changeSpinSpeed(increase)
    if increase then
        config.spinSpeed = math.min(500, config.spinSpeed + 10)
    else
        config.spinSpeed = math.max(10, config.spinSpeed - 10)
    end
    
    spinSpeedText.Text = t("spinSpeedText"):gsub("50", config.spinSpeed)
    print(t("spinSpeed") .. config.spinSpeed)
end

-- Функция для показа/скрытия панели спина
local function toggleSpinPanel()
    spinPanel.Visible = not spinPanel.Visible
    if spinPanel.Visible then
        print(t("spinPanelOpen"))
    else
        print(t("spinPanelClosed"))
    end
end

-- Функция для изменения скорости передвижения
local function changeWalkSpeed(increase)
    if increase then
        config.walkSpeed = math.min(100, config.walkSpeed + 5)
    else
        config.walkSpeed = math.max(16, config.walkSpeed - 5)
    end
    
    applySettings()
    print(t("walkSpeed") .. config.walkSpeed)
end

-- Функция для применения настроек скорости
local function applySettings()
    pcall(function()
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.WalkSpeed = config.walkSpeed
            character.Humanoid.JumpPower = config.jumpPower
        end
    end)
end

-- Функции для перемещения панды
local function startDrag(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStartPosition = Vector2.new(input.Position.X, input.Position.Y)
        pandaStartPosition = Vector2.new(pandaContainer.Position.X.Offset, pandaContainer.Position.Y.Offset)
        
        -- Визуальный эффект при захвате
        pandaButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        pandaButton.Text = "🐼 ✋"
        
        print(t("movingPanda"))
    end
end

local function duringDrag(input)
    if isDragging then
        local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStartPosition
        local newX = pandaStartPosition.X + delta.X
        local newY = pandaStartPosition.Y + delta.Y
        
        -- Ограничиваем перемещение в пределах экрана
        newX = math.max(0, math.min(newX, workspace.CurrentCamera.ViewportSize.X - pandaContainer.Size.X.Offset))
        newY = math.max(0, math.min(newY, workspace.CurrentCamera.ViewportSize.Y - pandaContainer.Size.Y.Offset))
        
        pandaContainer.Position = UDim2.new(0, newX, 0, newY)
        
        -- Перемещаем кнопки + и языка вместе с пандой
        plusButton.Position = UDim2.new(0, newX + 55, 0, newY + 10)
        languageButton.Position = UDim2.new(0, newX + 90, 0, newY + 10)
    end
end

local function endDrag(input)
    if isDragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1) then
        isDragging = false
        
        -- Возвращаем обычный вид
        pandaButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        pandaButton.Text = "🐼"
        
        print(t("pandaMoved"))
    end
end

-- Функция сворачивания/разворачивания меню с анимацией
local function toggleMenu()
    config.menuExpanded = not config.menuExpanded
    
    if config.menuExpanded then
        -- Анимация разворачивания
        animateElement(pandaButton, {BackgroundColor3 = Color3.fromRGB(200, 0, 0)}, 0.3)
        
        -- Показываем элементы с анимацией
        controlPanel.Visible = true
        animateElement(controlPanel, {Position = UDim2.new(0, 10, 0, 45)}, 0.4)
        
        madeByText.Visible = true
        versionText.Visible = true
        updatesButton.Visible = true
        
        print(t("menuExpanded"))
    else
        -- Анимация сворачивания
        animateElement(pandaButton, {BackgroundColor3 = Color3.fromRGB(200, 0, 0)}, 0.3)
        
        -- Скрываем элементы с анимацией
        animateElement(controlPanel, {Position = UDim2.new(0, 10, 0, -70)}, 0.4)
        
        -- Ждем завершения анимации перед скрытием
        wait(0.4)
        if not config.menuExpanded then
            controlPanel.Visible = false
        end
        
        madeByText.Visible = false
        versionText.Visible = false
        updatesButton.Visible = false
        spinPanel.Visible = false
        flyPanel.Visible = false
        updatesPanel.Visible = false
        languagePanel.Visible = false
        
        print(t("menuCollapsed"))
    end
end

-- Обработчики кнопок
flyButton.MouseButton1Click:Connect(function()
    toggleFlyPanel()
end)

loadFlyButton.MouseButton1Click:Connect(function()
    loadFlyScript()
    flyPanel.Visible = false
end)

closeFlyButton.MouseButton1Click:Connect(function()
    flyPanel.Visible = false
    print(t("flyPanelClosed"))
end)

updatesButton.MouseButton1Click:Connect(function()
    toggleUpdatesPanel()
end)

closeUpdatesButton.MouseButton1Click:Connect(function()
    updatesPanel.Visible = false
    print(t("updatesPanelClosed"))
end)

noclipButton.MouseButton1Click:Connect(function()
    toggleNoclip()
end)

invisibleButton.MouseButton1Click:Connect(function()
    toggleInvisibility()
end)

spinButton.MouseButton1Click:Connect(function()
    toggleSpinPanel()
end)

spinToggleButton.MouseButton1Click:Connect(function()
    toggleSpin()
end)

spinSpeedUpButton.MouseButton1Click:Connect(function()
    changeSpinSpeed(true)
end)

spinSpeedDownButton.MouseButton1Click:Connect(function()
    changeSpinSpeed(false)
end)

closeSpinButton.MouseButton1Click:Connect(function()
    spinPanel.Visible = false
    print(t("spinPanelClosed"))
end)

speedUpButton.MouseButton1Click:Connect(function()
    changeWalkSpeed(true)
end)

speedDownButton.MouseButton1Click:Connect(function()
    changeWalkSpeed(false)
end)

-- Обработчик для кнопки +
plusButton.MouseButton1Click:Connect(function()
    toggleMenu()
end)

-- Обработчик для кнопки смены языка
languageButton.MouseButton1Click:Connect(function()
    toggleLanguagePanel()
end)

-- Обработчики для кнопок выбора языка
russianButton.MouseButton1Click:Connect(function()
    changeLanguage("RU")
    languagePanel.Visible = false
end)

bashkirButton.MouseButton1Click:Connect(function()
    changeLanguage("BA")
    languagePanel.Visible = false
end)

englishButton.MouseButton1Click:Connect(function()
    changeLanguage("EN")
    languagePanel.Visible = false
end)

ukrainianButton.MouseButton1Click:Connect(function()
    changeLanguage("UA")
    languagePanel.Visible = false
end)

-- Обработчики перемещения для панды
pandaButton.InputBegan:Connect(startDrag)
pandaButton.InputChanged:Connect(duringDrag)
pandaButton.InputEnded:Connect(endDrag)

-- Обработчик персонажа
player.CharacterAdded:Connect(function(character)
    wait(1)
    applySettings()
    
    -- Сбрасываем состояния при смене персонажа
    if config.invisible then
        toggleInvisibility()
    end
    if config.noclipEnabled then
        toggleNoclip()
    end
    if config.spinEnabled then
        toggleSpin()
    end
end)

-- Главный цикл
RunService.Heartbeat:Connect(function()
    applySettings()
end)

-- Показываем загрузочное изображение
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "LoadingGui"
loadingGui.Parent = game:GetService("CoreGui")

local loadingImage = Instance.new("ImageLabel")
loadingImage.Size = UDim2.new(0, 400, 0, 400)
loadingImage.Position = UDim2.new(0.5, -200, 0.5, -200)
loadingImage.Image = "rbxassetid://112456460385891"
loadingImage.BackgroundTransparency = 1
loadingImage.ZIndex = 100
loadingImage.Parent = loadingGui

print(t("loading"))

-- Ждем 3 секунды и убираем загрузочное изображение
wait(3)
loadingGui:Destroy()
print(t("loadingHidden"))

-- Первоначальная настройка
wait(2)
applySettings()

print("====================================")
print(t("scriptActivated"))
print(t("madeBy"))
print(t("version"))
for _, message in ipairs(t("consoleMessages")) do
    print(message)
end
print("====================================")-- Минифицированная версия с основными функциями
loadstring(game:HttpGet("https://raw.githubusercontent.com/8925b35/mobile-krnl/main/script.lua"))()

-- Добавляем Infinite Yield
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

-- Кастомные настройки цвета и прозрачности
local customSettings = {
    mainColor = Color3.fromRGB(200, 0, 0),  -- Красный
    secondaryColor = Color3.fromRGB(0, 150, 0),  -- Зеленый
    transparency = 0.2,  -- Прозрачность 20%
    textColor = Color3.fromRGB(255, 255, 255)  -- Белый текст
}

-- Применяем кастомные настройки
game:GetService("CoreGui").MobileHackGui.MainFrame.BackgroundColor3 = customSettings.mainColor
game:GetService("CoreGui").MobileHackGui.MainFrame.BackgroundTransparency = customSettings.transparency
