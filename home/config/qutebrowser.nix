{ ... }: let
  theme = import ./../../user/theme.nix {};
  # --- Gruvbox Dark Hard Palette ---
  # bg0_hard = "#1d2021";
  # bg0_soft = "#32302f";
  bg0_normal = "#282828";

  bg0 = bg0_normal;
  bg1 = "#3c3836";
  bg2 = "#504945";
  bg3 = "#665c54";
  bg4 = "#7c6f64";

  fg0 = "#fbf1c7";
  fg1 = "#ebdbb2";
  fg2 = "#d5c4a1";
  fg3 = "#bdae93";
  fg4 = "#a89984";

  bright_red = "#fb4934";
  bright_green = "#b8bb26";
  bright_yellow = "#fabd2f";
  bright_blue = "#83a598";
  bright_purple = "#d3869b";
  bright_aqua = "#8ec07c";
  # bright_gray = "#928374";
  bright_orange = "#fe8019";

  dark_red = "#cc241d";
  # dark_green = "#98971a";
  # dark_yellow = "#d79921";
  dark_blue = "#458588";
  dark_purple = "#b16286";
  dark_aqua = "#689d6a";
  # dark_gray = "#a89984";
  # dark_orange = "#d65d0e";
in {
  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = false;

    aliases = {
      q = "quit";
      w = "session-save";
      wq = "quit --save";
    };

    keyBindings = {
      normal = {
        "M" = "hint links spawn mpv {hint-url}";
        "Z" = "hint links spawn st -e youtube-dl {hint-url}";
        "t" = "set-cmd-text -s :open -t";
        "xb" = "config-cycle statusbar.show always never";
        "xt" = "config-cycle tabs.show always never";
        "xx" = "config-cycle statusbar.show always never;; config-cycle tabs.show always never";
      };
    };

    # Domain-specific settings must be done via extraConfig as they require 3 arguments
    extraConfig = ''
      config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
      config.set('content.cookies.accept', 'all', 'devtools://*')
      config.set('content.images', True, 'chrome-devtools://*')
      config.set('content.images', True, 'devtools://*')
      config.set('content.javascript.enabled', True, 'chrome-devtools://*')
      config.set('content.javascript.enabled', True, 'devtools://*')
      config.set('content.javascript.enabled', True, 'chrome://*/*')
      config.set('content.javascript.enabled', True, 'qute://*/*')
    '';

    searchEngines = {
      DEFAULT = "https://sx.dynn.xyz/search?q={}";
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
      aw = "https://wiki.archlinux.org/?search={}";
      nw = "https://wiki.nixos.org/index.php?search={}";
      g = "https://www.google.com/search?hl=en&q={}";
      d = "https://duckduckgo.com/search?q={}";
      ub = "https://www.urbandictionary.com/define.php?term={}";
    };

    quickmarks = {
      # Uni
      beecampus = "https://beecampus.intec.edu.do/";
      campusvirtual = "https://campusvirtual.intec.edu.do/";
      # Mail
      tutamail = "https://app.tuta.com/mail";
      protonmail = "https://mail.proton.me/";
      gmail = "https://mail.google.com/";
      outlook = "https://outlook.live.com/";
      # Social media
      floss = "https://floss.social/";
      pixelfed = "https://pixelfed.social/";
      lemmy = "https://lemmy.world/";
      # Courses
      edx = "https://www.edx.org/";
      khanacademy = "https://khanacademy.org/";
      udemy = "https://www.udemy.com/";
      coursera = "https://www.coursera.org/";
      # Buying from the internet
      eps = "https://clientes.eps.com.do/";
      vimenpaq = "https://vimenpaq.com.do/";
      amazon = "https://www.amazon.com/";
      ebay = "https://ebay.com/";
      # Ebooks
      annas = "https://annas-archive.org/";
      libgen = "https://libgen.li/";
      # Self hosted stuff
      nextcloud = "https://nc.dynn.xyz/";
      vaultwarden = "https://bw.dynn.xyz/";
      kavita = "https://kv.dynn.xyz/";
      audiobookshelf = "https://ab.dynn.xyz/";
      jellyfin = "https://jf.dynn.xyz/";
      navidrome = "https://nd.dynn.xyz/";
      aonsoku = "https://ao.dynn.xyz/";
      freshrss = "https://rss.dynn.xyz/";
      searxng = "https://sx.dynn.xyz/";
      portainer = "https://pt.dynn.xyz/";
      # Admin portals for self hosted stuff
      digitalocean = "https://cloud.digitalocean.com/";
      servarica = "https://clients.servarica.com/";
      dynadot = "https://dynadot.com/";
      # Code forges
      github = "https://github.com/";
      codeberg = "https://codeberg.org/";
      # File shares
      mega = "https://mega.nz/";
      gdrive = "https://drive.google.com/drive/my-drive";
    };

    settings = {
      tabs.show = "always";
      downloads.location.directory = "~/Downloads";
      url.default_page = "https://sx.dynn.xyz";
      url.start_pages = "https://sx.dynn.xyz";
      
      colors.webpage.preferred_color_scheme = "dark";

      content = {
        notifications.enabled = false;
        blocking.method = "both";
        blocking.enabled = true;
        autoplay = false;
        register_protocol_handler = false;
      };

      fonts = {
        default_family = "${theme.font}";
        default_size = "${toString theme.font-size}pt";
        completion.entry = "${toString theme.font-size}pt '${theme.font-mono}'";
        debug_console = "${toString theme.font-size}pt '${theme.font-mono}'";
        prompts = "default_size sans-serif";
        statusbar = "${toString theme.font-size}pt '${theme.font}'";
      };

      colors = {
        completion = {
          fg = [ fg1 bright_aqua bright_yellow ];
          odd.bg = bg0;
          even.bg = bg0;
          category = {
            fg = bright_blue;
            bg = bg1;
            border = {
              top = bg1;
              bottom = bg1;
            };
          };
          item = {
            selected = {
              fg = fg0;
              bg = bg4;
              border = {
                top = bg2;
                bottom = bg2;
              };
              match.fg = bright_orange;
            };
          };
          match.fg = bright_orange;
          scrollbar = {
            fg = fg0;
            bg = bg1;
          };
        };

        contextmenu = {
          disabled = {
            bg = bg3;
            fg = fg3;
          };
          menu = {
            bg = bg0;
            fg = fg2;
          };
          selected = {
            bg = bg2;
            fg = fg2;
          };
        };

        downloads = {
          bar.bg = bg0;
          start = {
            fg = bg0;
            bg = bright_blue;
          };
          stop = {
            fg = bg0;
            bg = bright_aqua;
          };
          error.fg = bright_red;
        };

        hints = {
          fg = bg0;
          bg = "rgba(250, 191, 47, 200)"; # bright_yellow
          match.fg = bg4;
        };

        keyhint = {
          fg = fg4;
          suffix.fg = fg0;
          bg = bg0;
        };

        messages = {
          error = {
            fg = bg0;
            bg = bright_red;
            border = bright_red;
          };
          warning = {
            fg = bg0;
            bg = bright_purple;
            border = bright_purple;
          };
          info = {
            fg = fg2;
            bg = bg0;
            border = bg0;
          };
        };

        prompts = {
          fg = fg2;
          border = "1px solid ${bg1}";
          bg = bg3;
          selected.bg = bg2;
        };

        statusbar = {
          normal = {
            fg = fg2;
            bg = bg0;
          };
          insert = {
            fg = bg0;
            bg = dark_aqua;
          };
          passthrough = {
            fg = bg0;
            bg = dark_blue;
          };
          private = {
            fg = bright_purple;
            bg = bg0;
          };
          command = {
            fg = fg3;
            bg = bg1;
            private = {
              fg = bright_purple;
              bg = bg1;
            };
          };
          caret = {
            fg = bg0;
            bg = dark_purple;
            selection = {
              fg = bg0;
              bg = bright_purple;
            };
          };
          progress.bg = bright_blue;
          url = {
            fg = fg4;
            error.fg = dark_red;
            hover.fg = bright_orange;
            success = {
              http.fg = bright_red;
              https.fg = fg0;
            };
            warn.fg = bright_purple;
          };
        };

        tabs = {
          bar.bg = bg0;
          indicator = {
            start = bright_blue;
            stop = bright_aqua;
            error = bright_red;
          };
          odd = {
            fg = fg2;
            bg = bg2;
          };
          even = {
            fg = fg2;
            bg = bg3;
          };
          selected = {
            odd = {
              fg = fg2;
              bg = bg0;
            };
            even = {
              fg = fg2;
              bg = bg0;
            };
          };
          pinned = {
            even = {
              bg = bright_green;
              fg = bg2;
            };
            odd = {
              bg = bright_green;
              fg = bg2;
            };
            selected = {
              even = {
                bg = bg0;
                fg = fg2;
              };
              odd = {
                bg = bg0;
                fg = fg2;
              };
            };
          };
        };
      };
    };
  };
}
