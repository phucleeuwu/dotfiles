-- items/workspaces.lua
local colors = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local query_workspaces =
	"aerospace list-workspaces --all --format '%{workspace}%{monitor-appkit-nsscreen-screens-id}' --json"

-- Add padding to the left
local root = sbar.add("item", {
	icon = {
		color = colors.with_alpha(colors.white, 0.6),
		highlight_color = colors.white,
		drawing = false,
	},
	label = {
		color = colors.grey,
		highlight_color = colors.white,
		drawing = false,
	},
	background = {
		color = colors.bg0,
		-- border_width = 1,
		height = 28,
		-- border_color = colors.black,
		corner_radius = 9,
		drawing = false,
	},
	padding_left = 6,
	padding_right = 0,
})

local workspaces = {}

local function updateVisible(visible_workspaces)
    local is_visible = false
    for i, visible_workspace in ipairs(visible_workspaces) do
        if workspace_index == visible_workspace["workspace"] then
            is_visible = true
            break
        end
    end
    for workspace_index, _ in pairs(workspaces) do
        workspaces[workspace_index]:set({
            background = { drawing = is_visible }
        })
    end
end

-- FIXME: nasty - updateVisible side effect
local function withWindows(f)
    local open_windows = {}
	local get_windows = "aerospace list-windows --monitor all --format '%{workspace}%{app-name}' --json"
	local query_visible_workspaces =
		"aerospace list-workspaces --visible --monitor all --format '%{workspace}%{monitor-appkit-nsscreen-screens-id}' --json"
	local get_focus_workspaces = "aerospace list-workspaces --focused"
    sbar.exec(query_visible_workspaces, function(visible_workspaces)
        sbar.exec(get_windows, function(workspace_and_windows)
            for _, entry in ipairs(workspace_and_windows) do
                local workspace_index = entry.workspace
                local app = entry["app-name"]
                if open_windows[workspace_index] == nil then
                    open_windows[workspace_index] = {}
                end
                table.insert(open_windows[workspace_index], app)
            end
            sbar.exec(get_focus_workspaces, function(focused_workspaces)
                local args = { open_windows = open_windows, focused_workspaces = focused_workspaces, visible_workspaces = visible_workspaces }
                f(args)
            end)
        end)
    end)
end

local function updateWindow(workspace_index, args)
    local open_windows = args.open_windows[workspace_index]
    local focused_workspaces = args.focused_workspaces
    local visible_workspaces = args.visible_workspaces

    if open_windows == nil then
        open_windows = {}
    end

    local icon_line = ""
    local no_app = true
    for i, open_window in ipairs(open_windows) do
        no_app = false
        local app = open_window
        local lookup = app_icons[app]
        local icon = ((lookup == nil) and app_icons["Default"] or lookup)
        icon_line = icon_line .. " " .. icon
    end

    local is_visible = false
    local monitor_id = nil
    for i, visible_workspace in ipairs(visible_workspaces) do
        if workspace_index == visible_workspace["workspace"] then
            is_visible = true
            monitor_id = visible_workspace["monitor-appkit-nsscreen-screens-id"]
            break
        end
    end

    sbar.animate("tanh", 10, function()
        if no_app and is_visible then
            icon_line = " —"
            workspaces[workspace_index]:set({
                icon = { drawing = true },
                label = {
                    string = icon_line,
                    drawing = true,
                    -- padding_right = 20,
                    font = "sketchybar-app-font:Regular:16.0",
                    y_offset = -1,
                },
                background = { drawing = is_visible },
                padding_right = 1,
                padding_left = 1,
                display = monitor_id,
            })
            return
        end
        if no_app and workspace_index ~= focused_workspaces then
            workspaces[workspace_index]:set({
                icon = { drawing = false },
                label = { drawing = false },
                background = { drawing = is_visible },
                padding_right = 0,
                padding_left = 0,
            })
            return
        end
        if no_app and workspace_index == focused_workspaces then
            icon_line = " —"
            workspaces[workspace_index]:set({
                icon = { drawing = true },
                label = {
                    string = icon_line,
                    drawing = true,
                    -- padding_right = 20,
                    font = "sketchybar-app-font:Regular:16.0",
                    y_offset = -1,
                },
                background = { drawing = is_visible },
                padding_right = 1,
                padding_left = 1,
            })
        end

        workspaces[workspace_index]:set({
            icon = { drawing = true },
            label = { drawing = true, string = icon_line },
            background = { drawing = is_visible },
            padding_right = 1,
            padding_left = 1,
        })
    end)
end

local function updateWindows()
    withWindows(function(args)
        for workspace_index, _ in pairs(workspaces) do
            updateWindow(workspace_index, args)
        end
    end)
end

local function updateWorkspaceMonitor()
    local workspace_monitor = {}
    sbar.exec(query_workspaces, function(workspaces_and_monitors)
        for _, entry in ipairs(workspaces_and_monitors) do
            local space_index = entry.workspace
            local monitor_id = math.floor(entry["monitor-appkit-nsscreen-screens-id"])
            workspace_monitor[space_index] = monitor_id
        end
        for workspace_index, _ in pairs(workspaces) do
            workspaces[workspace_index]:set({
                display = workspace_monitor[workspace_index],
            })
        end
	end)
end

sbar.exec(query_workspaces, function(workspaces_and_monitors)
    for _, entry in ipairs(workspaces_and_monitors) do
        local workspace_index = entry.workspace

        local workspace = sbar.add("item", {
            icon = {
                color = colors.with_alpha(colors.white, 0.6),
                highlight_color = colors.white,
                drawing = false,
                font = { family = settings.font.numbers },
                string = workspace_index,
                padding_left = 10,
                padding_right = 5,
            },
            label = {
                padding_right = 10,
                -- color = colors.grey,
                color = colors.with_alpha(colors.white, 0.6),
                highlight_color = colors.white,
                font = "sketchybar-app-font:Regular:16.0",
                y_offset = -1,
            },
            padding_right = 2,
            padding_left = 2,
            background = {
                color = colors.bg3,
                height = 28,
                drawing = false,
            },
            click_script = "aerospace workspace " .. workspace_index,
            blur_radius = 30,
        })

        workspaces[workspace_index] = workspace

        workspace:subscribe("aerospace_workspace_change", function(env)
            local focused_workspace = env.FOCUSED_WORKSPACE
            local is_focused = focused_workspace == workspace_index

            sbar.animate("tanh", 10, function()
                workspace:set({
                    icon = { highlight = is_focused },
                    label = { highlight = is_focused },
                    background = {
                        drawing = is_focused,
                    },
                })
            end)
        end)
    end

    -- initial setup
    updateWindows()
    updateWorkspaceMonitor()

    root:subscribe("aerospace_focus_change", function()
        updateWindows()
    end)

    root:subscribe("display_change", function()
        updateWorkspaceMonitor()
        updateWindows()
    end)

    sbar.exec("aerospace list-workspaces --focused", function(focused_workspace)
        local focused_workspace = focused_workspace:match("^%s*(.-)%s*$")
        workspaces[focused_workspace]:set({
            icon = { highlight = true },
            label = { highlight = true },
            background = { drawing = true },
        })
    end)
end)