{ ... }: {
  programs.nixvim.extraConfigLua = ''
    --------------------------------------------------
    -- Transparent background highlights
    --------------------------------------------------
    vim.cmd([[
      hi Normal      guibg=NONE ctermbg=NONE
      hi LineNr      guibg=NONE ctermbg=NONE
      hi SignColumn  guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
      hi Visual      cterm=none ctermbg=darkgrey ctermfg=white
    ]])

    --------------------------------------------------
    -- toggleterm setup
    --------------------------------------------------
    require("toggleterm").setup({
      size = 14,
      hide_numbers = true,
      shade_terminals = false,
      start_in_insert = true,
      insert_mappings = false,
      direction = "float",
      float_opts = { border = "rounded", winblend = 0 },
    })

    --------------------------------------------------
    -- which key
    --------------------------------------------------
    pcall(function()
      local wk = require("which-key")
      wk.add({
        { "<leader>b", group = "Buffers" },
        { "<leader>e", group = "Explorer" },
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>l", group = "LSP" },
        { "<leader>o", group = "Open" },
        { "<leader>s", group = "Session" },
        { "<leader>t", group = "Terminal" },
        { "<leader>w", group = "Windows" },
        { "<leader>x", group = "Diagnostics" },
      })
    end)

    --------------------------------------------------
    -- Persistent undo directory
    --------------------------------------------------
    local undodir = vim.fn.stdpath("state") .. "/undo"
    if vim.fn.isdirectory(undodir) == 0 then
      vim.fn.mkdir(undodir, "p")
    end
    vim.o.undodir = undodir

    --------------------------------------------------
    -- Persisted telescope
    --------------------------------------------------
    -- Load Telescope extensions
    pcall(function()
      require("telescope").load_extension("persisted")
    end)

    --------------------------------------------------
    -- nvim-cmp + LuaSnip setup
    --------------------------------------------------
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Load VSCode-style snippets (friendly-snippets etc.)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
        { name = "luasnip" },
      }),
    })
  '';
}
