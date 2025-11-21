require("sshfs"):setup()

require("relative-motions"):setup({ show_numbers = "relative", show_motion = true, enter_mode = "first" })

require("copy-file-contents"):setup({ append_char = "\n", notification = true })
