-- Workspace rules wiki:
-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- WS1 : Monocle
hl.workspace_rule({
    workspace = "1",
    layout = "monocle",
})

-- WS2 -> WS10 : Master
for i = 2, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        layout = "master",
        layout_opts = {
            orientation = "left",
        },
    })
end
