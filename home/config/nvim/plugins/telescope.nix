{ ... }: {
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        project = {
          enable = true;
          settings = {
            base_dirs = [
              { path = "~/Development"; max_depth = 4; }
              { path = "~/src"; max_depth = 4; }
              { path = "~/dev"; max_depth = 4; }
            ];
            hidden_files = true;
            order_by = "asc";
            search_by = "title";
            sync_with_nvim_tree = true;
            theme = "dropdown";
            ignore_missing_dirs = true;
            on_project_selected.__raw = ''
              function(prompt_bufnr)
                local project_actions =
                  require("telescope._extensions.project.actions")

                project_actions.change_working_directory(prompt_bufnr, false)
              end
            '';

            mappings = {
              n = {
                d.__raw = "require('telescope._extensions.project.actions').delete_project";
                r.__raw = "require('telescope._extensions.project.actions').rename_project";
                c.__raw = "require('telescope._extensions.project.actions').add_project";
                C.__raw = "require('telescope._extensions.project.actions').add_project_cwd";
                f.__raw = "require('telescope._extensions.project.actions').find_project_files";
                b.__raw = "require('telescope._extensions.project.actions').browse_project_files";
                s.__raw = "require('telescope._extensions.project.actions').search_in_project_files";
                R.__raw = "require('telescope._extensions.project.actions').recent_project_files";
                w.__raw = "require('telescope._extensions.project.actions').change_working_directory";
                o.__raw = "require('telescope._extensions.project.actions').next_cd_scope";
              };

              i = {
                "<c-d>".__raw = "require('telescope._extensions.project.actions').delete_project";
                "<c-v>".__raw = "require('telescope._extensions.project.actions').rename_project";
                "<c-a>".__raw = "require('telescope._extensions.project.actions').add_project";
                "<c-A>".__raw = "require('telescope._extensions.project.actions').add_project_cwd";
                "<c-f>".__raw = "require('telescope._extensions.project.actions').find_project_files";
                "<c-b>".__raw = "require('telescope._extensions.project.actions').browse_project_files";
                "<c-s>".__raw = "require('telescope._extensions.project.actions').search_in_project_files";
                "<c-r>".__raw = "require('telescope._extensions.project.actions').recent_project_files";
                "<c-l>".__raw = "require('telescope._extensions.project.actions').change_working_directory";
                "<c-o>".__raw = "require('telescope._extensions.project.actions').next_cd_scope";
              };
            };
          };
        };
      };
      settings = {
        defaults = {
          prompt_prefix = " ";
          selection_caret = "❯ ";
          path_display = [ "smart" ];
          sorting_strategy = "ascending";
          layout_config = {
            prompt_position = "top";
          };
        };
        pickers = {
          find_files = {
            hidden = true;
          };
        };
      };
    };
  };
}
