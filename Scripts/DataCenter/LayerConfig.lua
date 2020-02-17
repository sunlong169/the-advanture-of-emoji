Layer = {
    "default", "player", "build", "enemy"
}
LayerConfig = {
    default = {
        default = false,
        player  = false,
        build   = false,
        enemy   = false,
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