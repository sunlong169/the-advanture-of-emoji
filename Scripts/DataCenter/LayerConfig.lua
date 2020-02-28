Layer = {
    "default", "player", "build", "enemy"
}
LayerConfig = {
    default = {
        default = true,
        player  = true,
        build   = true,
        enemy   = true,
    },
    player = {
        player  = false,
        build   = true,
        enemy   = true,
    },
    build = {
        build   = false,
        enemy   = true,
    },
    enemy = {
        enemy   = false,
    }
}