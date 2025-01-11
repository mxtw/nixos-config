{
  programs.nixvim = {
    plugins.obsidian = {
      enable = true;

      settings =
        {
          workspaces = [{
            name = "notes";
            path = "~/notes";
          }];

          ui.enable = false;

          daily_notes = {
            folder = "daily";
            date_format = "%Y-%m-%d";
            alias_format = "%B %-d, %Y";
            template = null;
          };
          templates.subdir = "templates";

          notes_subdir = "notes";
          new_notes_location = "notes_subdir";
          note_id_func.__raw = ''
            function(title)
                -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                -- In this case a note with the title 'My new note' will be given an ID that looks
                -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                local suffix = ""
                if title ~= nil then
                    -- If title is given, transform it into valid file name.
                    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    -- If title is nil, just add 4 random uppercase letters to the suffix.
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end
                return tostring(os.time()) .. "-" .. suffix
            end
          '';

        };
    };
    keymaps = [
      {
        action = "<cmd>ObsidianQuickSwitch<CR>";
        key = "<leader>nf";
        options = {
          silent = true;
          desc = "Find Notes";
        };
      }
      {
        action = "<cmd>ObsidianSearch<CR>";
        key = "<leader>ns";
        options = {
          silent = true;
          desc = "Search Note Contents";
        };
      }
      {
        action = "<cmd>ObsidianNew<CR>";
        key = "<leader>nn";
        options = {
          silent = true;
          desc = "Create New Note";
        };
      }
      {
        action = "<cmd>ObsidianTemplate<CR>";
        key = "<leader>nc";
        options = {
          silent = true;
          desc = "Insert Template";
        };
      }
      {
        action = "<cmd>ObsidianOpen<CR>";
        key = "<leader>no";
        options = {
          silent = true;
          desc = "Open in Obsidian";
        };
      }
      {
        action = "<cmd>e ~/notes/index.md<CR>";
        key = "<leader>na";
        options = {
          silent = true;
          desc = "Open Index";
        };
      }
      {
        action = "<cmd>ObsidianBacklinks<CR>";
        key = "<leader>nb";
        options = {
          silent = true;
          desc = "Show Backlinks";
        };
      }
      {
        action = "<cmd>ObsidianToday<CR>";
        key = "<leader>nt";
        options = {
          silent = true;
          desc = "Open Today's Note";
        };
      }
      {
        action = "<cmd>ObsidianTomorrow<CR>";
        key = "<leader>nm";
        options = {
          silent = true;
          desc = "Open Tomorrow's Note";
        };
      }
      {
        action = "<cmd>ObsidianYesterday<CR>";
        key = "<leader>ny";
        options = {
          silent = true;
          desc = "Open Yesterday's Note";
        };
      }
    ];
  };
}

