return {
  "goolord/alpha-nvim",
  name = "alpha",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local function center_text(text, width)
      local padding = math.floor((width - #text) / 2)
      return string.rep(" ", padding) .. text
    end

    local function get_plugin_count()
      local ok, lazy = pcall(require, "lazy")
      if ok and lazy.stats then
        return lazy.stats().count or 0
      end
      return 0
    end

    local function get_date_info()
      return os.date("%A, %B %d, %Y") -- e.g., Sunday, August 03, 2025
    end

    local function get_lsp_count()
      local clients = require("lspconfig.util").available_servers() or {}
      return #clients
    end

    local width = 70

    local header_ascii = {
      " .-._            ,----.     _,.---._            ,-.-.  .=-.-.       ___   ",
      "/==/ \\  .-._  ,-.--` , \\  ,-.' , -  `.   ,--.-./=/ ,/ /==/_ /.-._ .'=.'\\  ",
      "|==|, \\/ /, /|==|-  _.-` /==/_,  ,  - \\ /==/, ||=| -||==|, |/==/ \\|==|  | ",
      "|==|-  \\|  | |==|   `.-.|==|   .=.     |\\==\\,  \\ / ,||==|  ||==|,|  / - | ",
      "|==| ,  | -|/==/_ ,    /|==|_ : ;=:  - | \\==\\ - ' - /|==|- ||==|  \\/  , | ",
      "|==| -   _ ||==|    .-' |==| , '='     |  \\==\\ ,   | |==| ,||==|- ,   _ | ",
      "|==|  /\\ , ||==|_  ,`-._ \\==\\ -    ,_ /   |==| -  ,/ |==|- ||==| _ /\\   | ",
      "/==/, | |- |/==/ ,     /  '.='. -   .'    \\==\\  _ /  /==/. //==/  / / , / ",
      "`--`./  `--``--`-----``     `--`--''       `--`--'   `--`-` `--`./  `--`  ",
      "",
      center_text("Hello, nenosaj", width),
      center_text("  " .. get_date_info(), width),
      center_text(
        string.format("⚙️  Plugins: %d    󰙳  LSPs: %d", get_plugin_count(), get_lsp_count()),
        width
      ),
      "",
    }
    dashboard.section.header.val = header_ascii

    _G.new_file_in_dir = function()
      vim.ui.input({ prompt = "Directory to create file in: ", completion = "dir" }, function(input)
        local dir = input and vim.fn.expand(input)
        if dir and vim.fn.isdirectory(dir) == 1 then
          vim.ui.input({ prompt = "New file name: " }, function(filename)
            if filename and filename ~= "" then
              local filepath = dir .. "/" .. filename
              vim.cmd("e " .. vim.fn.fnameescape(filepath))
            end
          end)
        else
          vim.notify("Invalid directory!", vim.log.levels.ERROR)
        end
      end)
    end

    _G.browse_directory = function()
      vim.ui.input({ prompt = "Directory to browse: ", completion = "dir" }, function(input)
        local dir = input and vim.fn.expand(input)
        if dir and vim.fn.isdirectory(dir) == 1 then
          require("telescope.builtin").find_files({ cwd = dir })
        else
          vim.notify("Invalid directory!", vim.log.levels.ERROR)
        end
      end)
    end

    -- Buttons
    dashboard.section.buttons.val = {
   --   dashboard.button("l", "  > Load last session", ":SessionManager load_last_session<CR>"),
      dashboard.button("t", "  > Open notes", ":cd ~/HDD/notes | e .<CR>"),
      dashboard.button("u", "  > Update plugins", ":Lazy sync<CR>"),
      dashboard.button("h", "  > Open HDD", ":cd ~/HDD | e .<CR>"),
      dashboard.button("r", "  > Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("o", "  > Open dotfiles", ":cd ~/dotfiles | e .<CR>"),
      dashboard.button("s", "  > Settings", ":cd ~/.config/nvim | e $MYVIMRC<CR>"),
      dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
    }

    local quotes = {
      -- Dostoevsky
      "“Man only likes to count his troubles; he doesn't calculate his happiness.” – Dostoevsky",
      "“To live without hope is to cease to live.” – Dostoevsky",
      "“The soul is healed by being with children.” – Dostoevsky",
      "“Pain and suffering are always inevitable for a large intelligence and a deep heart.” – Dostoevsky",

      -- Camus
      "“In the depth of winter, I finally learned that within me there lay an invincible summer.” – Camus",
      "“The only way to deal with an unfree world is to become so absolutely free that your very existence is an act of rebellion.” – Camus",
      "“Live to the point of tears.” – Camus",
      "“You will never be happy if you continue to search for what happiness consists of.” – Camus",

      -- Schopenhauer
      "“A man can do what he wills, but he cannot will what he wills.” – Schopenhauer",
      "“Talent hits a target no one else can hit; Genius hits a target no one else can see.” – Schopenhauer",
      "“Compassion is the basis of morality.” – Schopenhauer",
      "“Mostly it is loss which teaches us about the worth of things.” – Schopenhauer",

      -- Nietzsche
      "“He who has a why to live can bear almost any how.” – Nietzsche",
      "“That which does not kill us makes us stronger.” – Nietzsche",
      "“In individuals, insanity is rare; but in groups, parties, nations and epochs, it is the rule.” – Nietzsche",
      "“To live is to suffer, to survive is to find some meaning in the suffering.” – Nietzsche",
    }

    math.randomseed(os.time())
    local quote = center_text(quotes[math.random(#quotes)], width)
    -- Footer
    dashboard.section.footer.val = {
      -- "",
      -- "                                  _ ",
      -- "                                  (_)",
      -- "  _ __   ___ _ __   ___  ___  __ _ _ ",
      -- " | '_ \\ / _ \\ '_ \\ / _ \\/ __|/ _` | |",
      -- " | | | |  __/ | | | (_) \\__ \\ (_| | |",
      -- " |_| |_|\\___|_| |_|\\___/|___/\\__,_| |",
      -- "                                 _/ |",
      -- "                                |__/ ",
      --
      "",
      quote,
      "",
    }

    vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
    alpha.setup(dashboard.opts)

    vim.keymap.set("n", "<leader>a", ":Alpha<CR>", { desc = "Open Alpha Dashboard" })
  end,
}
