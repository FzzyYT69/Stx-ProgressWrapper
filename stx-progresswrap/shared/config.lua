Config = {}

Config.lib = 'ox'
Config.Core = 'qb-core' -- rsg-core

Config.ProgressBarsSett = {
    [1] = {
        id = 'prog1',
        name = 'progressbar',
        exportfunction = function(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
            exports['progressbar']:Progress({
                name = name:lower(),
                duration = duration,
                label = label,
                useWhileDead = useWhileDead,
                canCancel = canCancel,
                controlDisables = disableControls,
                animation = animation,
                prop = prop,
                propTwo = propTwo,
            }, function(cancelled)
                if not cancelled then
                    if onFinish then
                        onFinish()
                    end
                else
                    if onCancel then
                        onCancel()
                    end
                end
            end)
        end,
    },
    [2] = {
        id = 'prog2',
        name = 'progressbar2',
        exportfunction = function(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
            exports['progressbar2']:Progress({
                name = name:lower(),
                duration = duration,
                label = label,
                useWhileDead = useWhileDead,
                canCancel = canCancel,
                controlDisables = disableControls,
                animation = animation,
                prop = prop,
                propTwo = propTwo,
            }, function(cancelled)
                if not cancelled then
                    if onFinish then
                        onFinish()
                    end
                else
                    if onCancel then
                        onCancel()
                    end
                end
            end)
        end,
    }
}