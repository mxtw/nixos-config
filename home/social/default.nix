{ pkgs, config, ... }:
{
  sops.secrets.soju-password = { };
  home.packages = with pkgs; [
    vesktop
    weechat

    chatterino2
    streamlink
  ];

  programs.halloy = {
    enable = true;
    settings = {
      servers.soju = {
        channels = [ ];
        nickname = "mxtw";
        sasl.plain = {
          username = "mxtw";
          password_file = config.sops.secrets.soju-password.path;
        };
        server = "irc.macks.cloud";
        use_tls = true;
        port = 6697;
      };
      font = {
        family = "Hack";
        size = 15;
      };
      actions = {
        sidebar = {
          buffer = "replace-pane";
          focused_buffer = "close-pane";
        };
        buffer = {
          click_channel_name = "replace-pane";
          click_username = "new-pane";
        };
      };
      buffer.channel.topic.enabled = true;
      buffer.chathistory.infinite_scroll = true;
      buffer.commands.show_description = true;
      buffer.server_messages = {
        join.enabled = false;
        quit.enabled = false;
        part.enabled = false;
        change_host.enabled = false;
      };
      buffer.nickname.brackets.left = "<";
      buffer.nickname.brackets.right = ">";
      buffer.nickname.alignment = "right";
      theme = "mocha";
      keyboard = {
        move_up = "alt+up";
        move_down = "alt+down";
        move_left = "alt+left";
        move_right = "alt+right";
      };
    };
    themes.mocha = {
      general = {
        background = "#11111b";
        border = "#6c7086";
        horizontal_rule = "#313244";
        unread_indicator = "#cba6f7";
      };
      text = {
        primary = "#cdd6f4";
        secondary = "#a6adc8";
        tertiary = "#cba6f7";
        success = "#a6e3a1";
        error = "#f38ba8";
      };
      buttons.primary = {
        background = "#11111b";
        background_hover = "#181825";
        background_selected = "#1e1e2e";
        background_selected_hover = "#181825";
      };
      buttons.secondary = {
        background = "#181825";
        background_hover = "#45475a";
        background_selected = "#313244";
        background_selected_hover = "#45475a";
      };
      buffer = {
        action = "#fab387";
        background = "#1e1e2e";
        background_text_input = "#181825";
        background_title_bar = "#181825";
        border = "#11111b";
        border_selected = "#b4befe";
        code = "#b4befe";
        highlight = "#45475a";
        nickname = "#89dceb";
        selection = "#313244";
        timestamp = "#bac2de";
        topic = "#7f849c";
        url = "#89b4fa";
      };
      buffer.server_messages.default = "#f9e2af";
    };
  };
}
