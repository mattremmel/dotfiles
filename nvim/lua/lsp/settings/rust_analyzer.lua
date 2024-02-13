return {
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeature = true,
            },
            check = {
                command = 'clippy',
            },
            imports = {
                group = {
                    enable = false,
                },
            },
            completion = {
                postfix = {
                    enable = false,
                }
            },
        }
    }
}
